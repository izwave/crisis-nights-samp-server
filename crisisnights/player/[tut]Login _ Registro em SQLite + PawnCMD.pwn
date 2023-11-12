/*
    Filterscript criado por Cleyson Stein.
    https://forum.sa-mp.com/showthread.php?t=646479
    Criei para estudo do SQLite e depois resolvi implementar e postar.
    Bom proveito !!

*/

// == Includes
#include <a_samp>
#include <sscanf2>
#include <Pawn.CMD>


// == Defines
#define DIALOG_REGISTRO     1512
#define DIALOG_LOGIN        1513
#define DIALOG_SENHA         1514
#define DIALOG_NOME            1515


// == Cores
#define VERMELHO                0xFF030FFF
#define LARANJA                 0xF97804FF
#define AZUL_CLARO              0x00C2ECFF
#define CINZA                   0xCECECEFF



// == Variaveis globais
new CMD_ADMIN_DONO = 1;

enum pInfo
{
    IDdb,
    Nome[24],
    IP[26],
    Senha[20],
    Level,
    Dinheiro,
    Skin,
    Matou,
    Morreu,
    Admin,
    Vip,
    bool:Liberado,
    bool:Logado
};
new PlayerInfo[MAX_PLAYERS][pInfo];

// == Sql
new DB:Database, DB_Query[1000];

// == Script
public OnFilterScriptInit()
{
    ConectarDB();
    return 1;
}

public OnFilterScriptExit()
{
    db_close(Database);
    return 1;
}

public OnPlayerConnect(playerid)
{
    GetPlayerName(playerid, PlayerInfo[playerid][Nome], 24);
    GetPlayerIp(playerid, PlayerInfo[playerid][IP], 26); 
    
    new DBResult:Result, Dialog[240]; 
    format(DB_Query, sizeof(DB_Query), "SELECT * FROM CONTAS WHERE NOME = '%s'", PlayerInfo[playerid][Nome]);
    Result = db_query(Database, DB_Query);
    
    if(db_num_rows(Result))
    {
        db_get_field_assoc(Result, "SENHA", PlayerInfo[playerid][Senha], 20);
        
        format(Dialog, sizeof(Dialog),"{F8F8FF}Bem vindo(a) ao servidor {058AFF}%s{F8F8FF}\n\nVocê ja tem uma conta registrada\n\nDigite sua senha para logar\n\nStatus: {1E90FF}Registrado{F8F8FF}\n\nIP: {058AFF}%s", PlayerInfo[playerid][Nome], PlayerInfo[playerid][IP]);
        ShowPlayerDialog(playerid, DIALOG_LOGIN, DIALOG_STYLE_PASSWORD, "LOGIN", Dialog, "Logar", "Cancelar");
        
        } else {
        
        format(Dialog, sizeof(Dialog),"{F8F8FF}Bem vindo(a) ao servidor {058AFF}%s{F8F8FF}\n\nVocê não tem uma conta registrada\n\nDigite uma senha para registrar\n\nStatus: {058AFF}Não registrado{F8F8FF}\n\nIP: {058AFF}%s", PlayerInfo[playerid][Nome], PlayerInfo[playerid][IP]);
        ShowPlayerDialog(playerid, DIALOG_REGISTRO, DIALOG_STYLE_PASSWORD, "REGISTRO", Dialog, "Registrar", "Cancelar");
    }
    db_free_result(Result);
    return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
    SalvarDB(playerid);
    return 1;
}

public OnPlayerDeath(playerid, killerid, reason)
{
    PlayerInfo[playerid][Morreu]++;
    PlayerInfo[killerid][Matou]++;
    return 1;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    switch(dialogid)
    {
        case DIALOG_REGISTRO:
        {
            if(!response) return Kick(playerid);

            if(strlen(inputtext) < 4 || strlen(inputtext) > 20)
            {
                SendClientMessage(playerid, VERMELHO, "ERRO: A senha deve conter de 4 a 20 caracteres!");

                new Dialog[240]; 
                format(Dialog, sizeof(Dialog),"{F8F8FF}Bem vindo(a) ao servidor {058AFF}%s{F8F8FF}\n\nVocê não tem uma conta registrada\n\nDigite uma senha para registrar\n\nStatus: {058AFF}Não registrado{F8F8FF}\n\nIP: {058AFF}%s", PlayerInfo[playerid][Nome], PlayerInfo[playerid][IP]);
                ShowPlayerDialog(playerid, DIALOG_REGISTRO, DIALOG_STYLE_PASSWORD, "REGISTRO", Dialog, "Registrar", "Cancelar");

                } else {
                
                format(PlayerInfo[playerid][Senha], 20, inputtext);
                RegistrarDB(playerid);
            }
        }

        case DIALOG_LOGIN:
        {
            if(!response) return Kick(playerid); 
            
            if(!strcmp(PlayerInfo[playerid][Senha], inputtext, true, 20))
            { 
                CarregarDB(playerid);

                } else {
                
                new Dialog[240];
                SendClientMessage(playerid, VERMELHO, "ERRO: Senha incorreta !");
                format(Dialog, sizeof(Dialog),"{F8F8FF}Bem vindo(a) ao servidor {058AFF}%s{F8F8FF}\n\nVocê ja tem uma conta registrada\n\nDigite sua senha para logar\n\nStatus: {1E90FF}Registrado{F8F8FF}\n\nIP: {058AFF}%s", PlayerInfo[playerid][Nome], PlayerInfo[playerid][IP]);
                ShowPlayerDialog(playerid, DIALOG_LOGIN, DIALOG_STYLE_PASSWORD, "LOGIN", Dialog, "Logar", "Cancelar");
            }
        }
        
        case DIALOG_SENHA:
        {
             if(!response) return 1;
            if(strlen(inputtext) < 4 || strlen(inputtext) > 20)
            {
                SendClientMessage(playerid, VERMELHO, "ERRO: A senha deve conter de 4 a 20 caracteres!");
                ShowPlayerDialog(playerid, DIALOG_SENHA, DIALOG_STYLE_PASSWORD, "Digite uma senha:", "Digite sua nova senha abaixo\n\nObs: Ela deve conter no mínimo 4 e no máximo 16 caracteres.", "Trocar", "Voltar");

                } else {

                format(PlayerInfo[playerid][Senha], 20, inputtext);

                new String[75];
                format(String, sizeof(String), "ADMIN: Sua senha foi alterada com sucesso, nova senha: %s", PlayerInfo[playerid][Senha]);
                SendClientMessage(playerid, CINZA, String);
                return 1;
            }
            return 1;
        }

        case DIALOG_NOME:
        {
            if(!response) return 1;
            if(strlen(inputtext) > 24)
            {
                SendClientMessage(playerid, VERMELHO, "ERRO: Seu novo nome deve conter no maximo 24 caracteres.");
                ShowPlayerDialog(playerid, DIALOG_NOME, DIALOG_STYLE_PASSWORD, "Digite um novo nome:", "Digite seu novo nome abaixo\n\nObs: Ele deve conter no máximo 24 caracteres.", "Trocar", "Voltar");

                } else {
                
                SetPlayerName(playerid, inputtext);
                format(PlayerInfo[playerid][Nome], 20, inputtext);
                
                new String[75];
                format(String, sizeof(String), "ADMIN: Seu nome foi alterado com sucesso, novo nome: %s", PlayerInfo[playerid][Nome]);
                SendClientMessage(playerid, CINZA, String);
                return 1;
            }
        }
    }
    return 1;
}

ConectarDB()
{
    if((Database = db_open("Salvamento.db")) == DB:0)
    {
        SendRconCommand("exit");
        print("Falha ao se conectar a DataBase SQlite"); // DEBUG
        
        } else {
        
        print("Conectado com sucesso a DataBase SQlite."); // DEBUG
        
        format(DB_Query, sizeof(DB_Query), "");
        strcat(DB_Query, "CREATE TABLE IF NOT EXISTS CONTAS (");
        strcat(DB_Query, "ID INTEGER PRIMARY KEY AUTOINCREMENT,");
        strcat(DB_Query, "NOME TEXT DEFAULT '',");
        strcat(DB_Query, "IP TEXT DEFAULT '',");
        strcat(DB_Query, "SENHA TEXT DEFAULT '',");
        strcat(DB_Query, "LEVEL INTEGER DEFAULT 0,");
        strcat(DB_Query, "DINHEIRO INTEGER DEFAULT 0,");
        strcat(DB_Query, "SKIN INTEGER DEFAULT 0,");
        strcat(DB_Query, "MATOU INTEGER DEFAULT 0,");
        strcat(DB_Query, "MORREU INTEGER DEFAULT 0,");
        strcat(DB_Query, "ADMIN INTEGER DEFAULT 0,");
        strcat(DB_Query, "VIP INTEGER DEFAULT 0)");
        db_query(Database, DB_Query);
    }
    return 1;
}

RegistrarDB(playerid)
{
    new str[80];
    format(DB_Query, sizeof(DB_Query), "INSERT INTO CONTAS (NOME, IP, SENHA) VALUES ");
    format(str, sizeof(str), "('%s',", PlayerInfo[playerid][Nome]);     strcat(DB_Query, str);
    format(str, sizeof(str), "'%s',", PlayerInfo[playerid][IP]);         strcat(DB_Query, str);
    format(str, sizeof(str), "'%s')", PlayerInfo[playerid][Senha]);     strcat(DB_Query, str);
    db_query(Database, DB_Query);
    
    new DBResult:Result;
    format(DB_Query, sizeof(DB_Query), "SELECT ID FROM CONTAS WHERE NOME = '%s'", PlayerInfo[playerid][Nome]);
    Result = db_query(Database, DB_Query);
    if(db_num_rows(Result))
    {
        PlayerInfo[playerid][IDdb] = db_get_field_assoc_int(Result, "ID");
    }
    db_free_result(Result);
    
    PlayerInfo[playerid][Level] = 10;
    PlayerInfo[playerid][Dinheiro] = 1000;
    PlayerInfo[playerid][Skin] = 50;
    PlayerInfo[playerid][Logado] = true;
    SetPlayerScore(playerid, PlayerInfo[playerid][Level]);
    GivePlayerMoney(playerid, PlayerInfo[playerid][Dinheiro]);
    SetSpawnInfo(playerid, 0, PlayerInfo[playerid][Skin], 1958.33, 1343.12, 15.36, 269.15, 0, 0, 0, 0, 0, 0 );
    return 1;
}

CarregarDB(playerid)
{
    new DBResult:Result;
    format(DB_Query, sizeof(DB_Query), "SELECT * FROM CONTAS WHERE NOME = '%s'", PlayerInfo[playerid][Nome]);
    Result = db_query(Database, DB_Query);
    if(db_num_rows(Result))
    {
        PlayerInfo[playerid][IDdb] = db_get_field_assoc_int(Result, "ID");
        PlayerInfo[playerid][Level] = db_get_field_assoc_int(Result, "LEVEL");
        PlayerInfo[playerid][Dinheiro] = db_get_field_assoc_int(Result, "DINHEIRO");
        PlayerInfo[playerid][Skin] = db_get_field_assoc_int(Result, "SKIN");
        PlayerInfo[playerid][Matou] = db_get_field_assoc_int(Result, "MATOU");
        PlayerInfo[playerid][Morreu] = db_get_field_assoc_int(Result, "MORREU");
        PlayerInfo[playerid][Admin] = db_get_field_assoc_int(Result, "ADMIN");
        PlayerInfo[playerid][Vip] = db_get_field_assoc_int(Result, "VIP");
    }
    db_free_result(Result);
    
    PlayerInfo[playerid][Logado] = true;
    SetPlayerScore(playerid, PlayerInfo[playerid][Level]);
    GivePlayerMoney(playerid, PlayerInfo[playerid][Dinheiro]);
    SetSpawnInfo(playerid, 1, PlayerInfo[playerid][Skin], 1958.33, 1343.12, 15.36, 269.15, 0, 0, 0, 0, 0, 0 );
    return 1;
}

SalvarDB(playerid)
{
    if(PlayerInfo[playerid][Logado] == false) return 1;
    
    new str[64];
    format(DB_Query, sizeof(DB_Query), "");
    strcat(DB_Query, "UPDATE CONTAS SET ");
    
    format(str, 64, "IP = '%s',", PlayerInfo[playerid][IP]);                 strcat(DB_Query, str);
    format(str, 64, "NOME = '%s',", PlayerInfo[playerid][Nome]);             strcat(DB_Query, str);
    format(str, 64, "SENHA = '%s',", PlayerInfo[playerid][Senha]);          strcat(DB_Query, str);
    format(str, 64, "LEVEL = '%d',", PlayerInfo[playerid][Level]);              strcat(DB_Query, str);
    format(str, 64, "DINHEIRO = '%d',", PlayerInfo[playerid][Dinheiro]);     strcat(DB_Query, str);
    format(str, 64, "SKIN = '%d',", PlayerInfo[playerid][Skin]);             strcat(DB_Query, str);
    format(str, 64, "MATOU = '%d',", PlayerInfo[playerid][Matou]);             strcat(DB_Query, str);
    format(str, 64, "MORREU = '%d',", PlayerInfo[playerid][Morreu]);         strcat(DB_Query, str);
    format(str, 64, "ADMIN = '%d',", PlayerInfo[playerid][Admin]);             strcat(DB_Query, str);
    format(str, 64, "VIP = '%d'", PlayerInfo[playerid][Vip]);                 strcat(DB_Query, str);
    format(str, 64, " WHERE ID = '%d'", PlayerInfo[playerid][IDdb]);             strcat(DB_Query, str);
    db_query(Database, DB_Query);
    
    PlayerInfo[playerid][Logado] = false;
    return 1;
}

forward Kickar(playerid);
public Kickar(playerid) return Kick(playerid);

CMD:viraradmin(playerid, params[])
{
    if(!IsPlayerAdmin(playerid)) return SendClientMessage(playerid, VERMELHO, "ERRO, comando restrito a administradores RCON.");
    SendClientMessage(playerid, AZUL_CLARO, "ADMIN: Bem vindo a administração do servidor.");
    PlayerInfo[playerid][Admin] = 5;
    return 1;
}

CMD:daradmin(playerid, params[])
{
    new ID, nivel, String[128];
    if(sscanf(params, "ud", ID, nivel)) return SendClientMessage(playerid, CINZA, "ADMIN: Use /daradmin [ID] [nivel]");
    if(!IsPlayerConnected(ID)) return SendClientMessage(playerid, VERMELHO, "ERRO: ID invalido");

    format(String, sizeof(String), "O jogador {1B95E0}%s{00C2EC} é o mais novo admin do servidor!", PlayerInfo[ID][Nome]);
    SendClientMessageToAll(AZUL_CLARO, String);
    
    PlayerInfo[ID][Admin] = nivel;

    SendClientMessage(playerid, LARANJA, "ADMIN: Comando efetuado com sucesso !");
    return 1;
}

CMD:tiraradmin(playerid, params[])
{
    new ID, String[128];
    if(sscanf(params, "u", ID)) return SendClientMessage(playerid, CINZA, "ADMIN: Use /tirar [ID]");
    if(PlayerInfo[ID][Admin] == 0) return SendClientMessage(playerid, VERMELHO, "ERRO: Esse player não e admin!");
    if(!IsPlayerConnected(ID)) return SendClientMessage(playerid, VERMELHO, "ERRO: ID invalido");
    
    format(String, sizeof(String), "ADMIN: O Admin dono {1B95E0}%s{00C2EC} tirou o admin de {1B95E0}%s{00C2EC}", PlayerInfo[playerid][Nome], PlayerInfo[ID][Nome]);
    SendClientMessageToAll(AZUL_CLARO, String);
    
    PlayerInfo[ID][Admin] = 0;
    return 1;
}

CMD:liberar(playerid, params[])
{
    new ID;
    if(sscanf(params, "u", ID)) return SendClientMessage(playerid, CINZA, "ADMIN: Use /liberar [ID]");
    if(!IsPlayerConnected(ID)) return SendClientMessage(playerid, VERMELHO, "ERRO: ID invalido");

    SendClientMessage(ID, AZUL_CLARO, "ADMIN: Você esta liberado a trocar de senha/nome use /trocarsenha ou /trocarnome");

    PlayerInfo[ID][Liberado] = true;

    SendClientMessage(playerid, LARANJA, "ADMIN: Comando efetuado com sucesso !");
    return 1;
}

CMD:trocarsenha(playerid, params[])
{
    if(PlayerInfo[playerid][Liberado] == false) return SendClientMessage(playerid, VERMELHO, "ERRO: Para trocar senha você deve pedir permissão a um admin.");
    SendClientMessage(playerid, AZUL_CLARO, "ADMIN: Digite a nova senha a ser usada.");
    
    ShowPlayerDialog(playerid, DIALOG_SENHA, DIALOG_STYLE_PASSWORD, "Digite uma nova senha:", "Digite sua nova senha abaixo\n\nObs: Ela deve conter no mínimo 4 e no máximo 20 caracteres.", "Trocar", "Voltar");
    return 1;
}

CMD:trocarnome(playerid, params[])
{
    if(PlayerInfo[playerid][Liberado] == false) return SendClientMessage(playerid, VERMELHO, "ERRO: Para trocar nome você deve pedir permissão a um admin.");
    SendClientMessage(playerid, AZUL_CLARO, "ADMIN: Digite o novo nome a ser usado. Lembre-se de alterar no SAMP.");
    
    ShowPlayerDialog(playerid, DIALOG_NOME, DIALOG_STYLE_INPUT, "Digite um novo nome:", "Digite seu novo nome abaixo\n\nObs: Ele deve conter no máximo 24 caracteres.", "Trocar", "Voltar");
    return 1;
}

// ========  Comandos Admin Dono
flags:daradmin(CMD_ADMIN_DONO);
flags:tiraradmin(CMD_ADMIN_DONO);
flags:liberar(CMD_ADMIN_DONO);

public OnPlayerCommandPerformed(playerid, cmd[], params[], result, flags)
{
    if(result == -1)
    {
        SendClientMessage(playerid, VERMELHO, "ERRO, comando inexistente.");
        return 0;
    }
    return 1;
}


public OnPlayerCommandReceived(playerid, cmd[], params[], flags)
{
    if((flags & CMD_ADMIN_DONO) && PlayerInfo[playerid][Admin] > 5)
    {
        SendClientMessage(playerid, VERMELHO, "ERRO, comando restrito a administradores donos.");
         return 0;
    }
    return 1;
} 