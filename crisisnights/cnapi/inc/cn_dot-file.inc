#if !defined isnull
    #define isnull(%1) ((!(%1[0])) || (((%1[0]) == '\1') && (!(%1[1]))))
#endif

#define DOT_FILE_MAX_PROPERTIES (50)
#define DOT_FILE_MAX_FILE_PATHS (12)
#define DOT_FILE_MAX_SPECIFIERS (10)
#define DOT_FILE_MAX_LINE_LENGHT (256)
#define f. dot_ 

/*
f.open(const filepath[], bool:forcecase=false)
f.set(indexfilepath, const properties[], const specifiers[], {Float,_}:...)
f.get(indexfilepath, const properties[], const specifiers[], {Float,_}:...)
f.out(indexfilepath, bool:forcecase=false)
*/

enum DOT_FILE_MANAGER
{
    DOT_FIE_DIR[128],
    DOT_FILE_KEYS,
    DOT_FILE_SIZE
};

enum DOT_FILE_DATA
{
    DOT_FIE_INPUT[24],
    DOT_FILE_OUTPUT[12],
    DOF_FILE_SPECIFIERS[DOT_FILE_MAX_SPECIFIERS]
};

static DotFileManager[DOT_FILE_MAX_FILE_PATHS][DOT_FILE_MANAGER];
static DotFileData[DOT_FILE_MAX_FILE_PATHS][DOT_FILE_MAX_PROPERTIES][DOT_FILE_DATA];

stock dot_open(const filepath[]/*, bool:forcecase=false*/)
{
	if(strfind(filepath, ".") == -1 ) return 0;

	new srchvacancy=0;
	for (; srchvacancy != DOT_FILE_MAX_FILE_PATHS; srchvacancy++)
	{		
		if(!isnull(DotFileManager[srchvacancy][DOT_FIE_DIR])
			&&!strcmp(filepath, DotFileManager[srchvacancy][DOT_FIE_DIR])) return srchvacancy + 1;
		if(!isnull(DotFileManager[srchvacancy][DOT_FIE_DIR])) continue;
		break;
	}
	if(srchvacancy == DOT_FILE_MAX_FILE_PATHS) return 0;
	
	new bool:bfexist = !!fexist(filepath);
	new File:dotfhandle = fopen(filepath);
	if(!dotfhandle) return 0;

	if(bfexist)
	{
		new strtmp[256], linecountertmp = 0, separatortmp = 0, eostmp;
		while(fread(dotfhandle, strtmp, 256))
		{
			separatortmp = strfind(strtmp, "=");
			if(separatortmp != -1)
			{
				strmid(DotFileData[srchvacancy][linecountertmp][DOT_FIE_INPUT], strtmp, 0, separatortmp, 24);
				eostmp = strfind(strtmp, "\r");
				if(eostmp == -1)
				{
					eostmp = strfind(strtmp, "\n");
					if(eostmp == -1)
					{
						eostmp = strlen(strtmp);
					}
				}
				strmid(DotFileData[srchvacancy][linecountertmp][DOT_FILE_OUTPUT], strtmp, separatortmp + 1, eostmp, 24);
			}
			linecountertmp ++;
			if(linecountertmp != DOT_FILE_MAX_PROPERTIES) continue;
			break;
		}		
		DotFileManager[srchvacancy][DOT_FILE_KEYS] = linecountertmp;
		printf("keys = %i", DotFileManager[srchvacancy][DOT_FILE_KEYS]);
	}
	fclose(dotfhandle);
	DotFileManager[srchvacancy][DOT_FIE_DIR][0] = EOS;
	strcat(DotFileManager[srchvacancy][DOT_FIE_DIR], filepath, 128);
	return srchvacancy + 1;
}

stock dot_out(fileindex, bool:forcecase=false)
{
	fileindex--;
	if(!(0 <= fileindex <= DOT_FILE_MAX_FILE_PATHS) || (isnull(DotFileManager[fileindex][DOT_FIE_DIR]))) return 0;

	new x = 0, maxlinestmp = DotFileManager[fileindex][DOT_FILE_KEYS];

	if(forcecase)
	{
		for(;x != maxlinestmp; x++)
		{
			DotFileData[fileindex][x][DOT_FIE_INPUT][0] = EOS;
			DotFileData[fileindex][x][DOT_FILE_OUTPUT][0] = EOS;
		} 
	}
	else
	{
		new File:fthandle = fopen(DotFileManager[fileindex][DOT_FIE_DIR], io_write);
		for(;x != maxlinestmp; x++)
		{
			printf("input (%s) = output (%s)", DotFileData[fileindex][x][DOT_FIE_INPUT], DotFileData[fileindex][x][DOT_FILE_OUTPUT]);
			printf("x=%i, maxlinestmp=%i", x, maxlinestmp);
			fwrite(fthandle, DotFileData[fileindex][x][DOT_FIE_INPUT]);
			fwrite(fthandle, "=");
			fwrite(fthandle,  DotFileData[fileindex][x][DOT_FILE_OUTPUT]);

			DotFileData[fileindex][x][DOT_FIE_INPUT][0] = EOS;
			DotFileData[fileindex][x][DOT_FILE_OUTPUT][0] = EOS;
			if(x + 1 == maxlinestmp) continue;
			fwrite(fthandle, "\r\n");
		}
		fclose(fthandle);
	}
	DotFileManager[fileindex][DOT_FILE_KEYS] = 0;
	DotFileManager[fileindex][DOT_FIE_DIR][0] = EOS;	
	return 1;
}

stock hack()
{
	strcat(DotFileData[0][5][DOT_FIE_INPUT], ".cuzin", 128);

	strcat(DotFileManager[0][DOT_FIE_DIR], ".txt", 128);
	DotFileManager[0][DOT_FILE_KEYS] = 1;
	print("hack on");
}

stock dot_set(fileindex, const key[], const datatype[], {Float,_}:...)
{
	fileindex--;
	if(!(0 <= fileindex <= DOT_FILE_MAX_FILE_PATHS) || (isnull(DotFileManager[fileindex][DOT_FIE_DIR]))) return 0;

	new findpos, maxkeys = DOT_FILE_MAX_PROPERTIES;
	if(!maxkeys) return 0;

	for (findpos = 0; findpos < maxkeys; findpos++)
	{
		if(!(!isnull(DotFileData[fileindex][findpos][DOT_FIE_INPUT])
			&&!strcmp(DotFileData[fileindex][findpos][DOT_FIE_INPUT], key))) continue;
		break;
	}
	if(findpos == maxkeys) 
	{
		findpos = DotFileManager[fileindex][DOT_FILE_KEYS];
		DotFileManager[fileindex][DOT_FILE_KEYS] ++;
		strcat(DotFileData[fileindex][findpos][DOT_FIE_INPUT], key, 128);
	}

	new numargstmp = numargs(), lengthtmp = strlen(datatype) + 3;

	if(numargstmp != lengthtmp) return 0;

	DotFileData[fileindex][findpos][DOT_FILE_OUTPUT][0] = EOS;
	
	new strtmp2[128];
	for (new dataset = 3; dataset < numargstmp; dataset++)
	{
		strtmp2[0] = EOS;
		switch(datatype[dataset-3])
		{
			case 's', 'S': 
			{
				new chartmp[2];
				for(new x; getarg(dataset, x) != 0; x++)
		       	{
		            format(chartmp, 2, "%c", getarg(dataset, x));
		            strcat(strtmp2, chartmp, 128);
		        }	
			}
			case 'i','I':
			{
				format(strtmp2, 32, "%i", getarg(dataset));
			}
			case 'f','F':
			{
				format(strtmp2, 32, "%f", getarg(dataset));
			}
			case 'b','B':
			{
				format(strtmp2, 3, "%02d", getarg(dataset));
			}
		}
		strcat(DotFileData[fileindex][findpos][DOT_FILE_OUTPUT], strtmp2, 128);
		if(dataset + 1 == numargstmp) continue;
		strcat(DotFileData[fileindex][findpos][DOT_FILE_OUTPUT], ";", 128);
	}
	printf("fileindex=%i]findpos=%i] [%s]=[%s]", fileindex, findpos, DotFileData[fileindex][findpos][DOT_FIE_INPUT], DotFileData[fileindex][findpos][DOT_FILE_OUTPUT]);
	return 1;
}

stock dot_get(fileindex, const key[], const datatype[], {Float,_}:...)
{
	fileindex--;
	if(!(0 <= fileindex <= DOT_FILE_MAX_FILE_PATHS) || (isnull(DotFileManager[fileindex][DOT_FIE_DIR])) || (isnull(key)))  return 0;

	new findpos, lenghttmp = strlen(DotFileData[fileindex][findpos][DOT_FIE_INPUT]);
	if(!maxkeys) return 0;

	for (findpos = 0; findpos < DOT_FILE_MAX_PROPERTIES; findpos++)
	{
		if((strfind(DotFileData[fileindex][findpos][DOT_FIE_INPUT], key, true) != lenghttmp)) continue;
		break;
	}
	if(findpos == maxkeys) return 0;
	
	new numargstmp = numargs(), lengthtmp = strlen(datatype) + 3;

	if(numargstmp != lengthtmp) return 0;
	
	new strtmp2[128];

	strcat(strtmp2, DotFileData[fileindex][findpos][DOT_FILE_OUTPUT], 128);

	for (new dataset = 3; dataset < numargstmp; dataset++)
	{
		switch(datatype[dataset-3])
		{
			case 's', 'S': 
			{
				new chartmp[2];
				for(new x; getarg(dataset, x) != 0; x++)
		       	{
		            format(chartmp, 2, "%c", getarg(dataset, x));
		            strcat(strtmp2, chartmp, 128);
		        }	
			}
			case 'i','I':
			{
				format(strtmp2, 32, "%i", getarg(dataset));
			}
			case 'f','F':
			{
				format(strtmp2, 32, "%f", getarg(dataset));
			}
			case 'b','B':
			{
				format(strtmp2, 3, "%02d", getarg(dataset));
			}
		}
		strcat(DotFileData[fileindex][findpos][DOT_FILE_OUTPUT], strtmp2, 128);
		if(dataset + 1 == numargstmp) continue;
		strcat(DotFileData[fileindex][findpos][DOT_FILE_OUTPUT], ";", 128);
	}	
}