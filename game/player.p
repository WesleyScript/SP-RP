//File created at 17:12 on 19/05/2014

hook Player_OnPlayerConnect(playerid)
{
	++SERVER_PLAYERS;

	SetPlayerColor(playerid, 0xFFFFFFAA);
	GetPlayerName(playerid, PlayerInfo[playerid][player_Name], MAX_PLAYER_NAME);
	GetPlayerIp(playerid, PlayerInfo[playerid][player_Ip], 16);
	
	for (new l; l < 30; ++l)
		SendClientMessage(playerid, 0xFFFFFFAA, "");
	
	Player_Start(playerid);
	
	return 1;
}

hook Player_OnPlayerDisconnect(playerid, reason)
{
	new
	    string_Reason[32],
		string_Send[128];
		
	--SERVER_PLAYERS;

	switch (reason)
	{
	    case 0: string_Reason = "Falha de conexão/Crash";
	    case 1: string_Reason = "Saiu";
	    case 2: string_Reason = "Kick/Ban";
	}

	format(string_Send, sizeof(string_Send), "O Jogador {FFFFFF}%s {FF0000}se desconectou! ({FFFFFF}%s{FF0000})", PlayerInfo[playerid][player_Name], string_Reason);
	SendChatMessage(playerid, 70.0, 0xFF0000AA, string_Send);
	
	for (new i; i < sizeof(PlayerInfo[]); ++i)
	    PlayerInfo[playerid][E_PLAYER_INFO: i] = 0;

	return 1;
}

hook Player_OnPlayerText(playerid, text[])
{
	new
		string_Text[128];
	
	if (strlen(text) > 100)
	{
		SendClientMessage(playerid, 0xFF0000AA, "Texto muito grande!");
		
		return 0;
	}
	
	if (PlayerInfo[playerid][player_Muted])
	{
		format(string_Text, sizeof(string_Text), "Você está calado, motivo: %s", PlayerInfo[playerid][player_MutedReason]);
		SendClientMessage(playerid, 0xFF0000AA, string_Text);
		
		return 0;
	}
	
	format(string_Text, sizeof(string_Text), "%s: %s", PlayerInfo[playerid][player_Name], text);
	SendChatMessage(playerid, 45.0, 0xC9C9C9AA, string_Text);
	
	return 1;
}

hook Player_OnPlayerRequestClass(playerid, classid)
{
	#pragma unused classid
	
	SpawnPlayer(playerid);

	return 0;
}

hook Player_OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	new
	    string_Dialog[256];

	switch (dialogid)
	{
	    case DIALOG_REGISTER:
	    {
	        new
	            string_Query[128];
	    
			format(string_Dialog, sizeof(string_Dialog), "{FF0000}Bem Vindo{FF0000}!\n\nVocê ainda não possui uma conta no Sao Paulo RP!\nConta: {FFFFFF}%s\n\n{FF0000}Digite uma {FFFFFF}senha {FF0000}abaixo!");

		    if (!response)
	        {
	            GameTextForPlayer(playerid, "~r~Voce precisa se registrar!", 2500, 6);
	            ShowPlayerDialog(playerid, DIALOG_REGISTER, DIALOG_STYLE_INPUT, "{FFFFFF}Registro", string_Dialog, "Registrar", "");
	            
	            return 0;
	        }
	        
	        if (strlen(inputtext) < 3 || strlen(inputtext) > 40)
	        {
	            GameTextForPlayer(playerid, "~r~Sua senha deve ter entre 3 e 40 caracteres!", 2500, 6);
	            ShowPlayerDialog(playerid, DIALOG_REGISTER, DIALOG_STYLE_INPUT, "{FFFFFF}Registro", string_Dialog, "Registrar", "");
	        
	            return 0;
	        }
	        
	        PlayerTextDrawSetString(playerid, PlayerInfo[playerid][td_Status], "Criando conta...");
	        
	        mysql_format(MySQL_ConnectionHandle, string_Query, sizeof(string_Query), "INSERT INTO `players`(`name`, `password`) VALUES ('%s', SHA1('%s'))", PlayerInfo[playerid][player_Name], inputtext);
			mysql_tquery(MySQL_ConnectionHandle, string_Query, "", "");
			
			PlayerTextDrawSetString(playerid, PlayerInfo[playerid][td_Status], "Conta criada!");
			SendClientMessage(playerid, 0x00FF00AA, "Conta criada com sucesso!");
			
			SetSpawnInfo(playerid, 98, 0, 2230.91, -1159.90, 25.52, 90.00, 0, 0, 0, 0, 0, 0);
			SpawnPlayer(playerid);
			
			return 1;
		}
	}

	return 1;
}

function Player_Start(playerid)
{
	new
	    string_Query[128];

	PlayerTextDrawSetString(playerid, PlayerInfo[playerid][td_Status], "Verificando seus dados...");
	PlayerTextDrawShow(playerid, PlayerInfo[playerid][td_Status]);
	
	mysql_format(MySQL_ConnectionHandle, string_Query, sizeof(string_Query), "SELECT * FROM `players` WHERE `name` = '%s'", PlayerInfo[playerid][player_Name]);
	mysql_tquery(MySQL_ConnectionHandle, string_Query, "r@Player_Start", "d", playerid);

	return 1;
}












