//File created at 17:01 on 20/05/2014

function MySQL_ConnectDB()
{
	MySQL_ConnectionHandle = mysql_connect("localhost", "root", "sprp", "");
	mysql_log(LOG_ALL, LOG_TYPE_HTML);

	return 1;
}

function MySQL_CloseDB()
{
	mysql_close(MySQL_ConnectionHandle);

	return 1;
}

function MySQL_CreateTables()
{
	new
	    table_Players[256];
	    
	mysql_format(MySQL_ConnectionHandle, table_Players, sizeof(table_Players),
					"CREATE TABLE IF NOT EXISTS `players`(\
					`ID` INT(11) AUTO_INCREMENT NOT NULL,\
					`Name` VARCHAR(24) NOT NULL,\
					`Password` VARCHAR(128) NOT NULL,\
					PRIMARY KEY(`ID`))");
					
	mysql_tquery(MySQL_ConnectionHandle, table_Players, "", "");

	return 1;
}


query r@Player_Start(playerid)
{
	new
	    numRows = cache_num_rows(),
		string_Dialog[256];

	format(string_Dialog, sizeof(string_Dialog), "{FF0000}Bem Vindo{FF0000}!\n\nVocê ainda não possui uma conta no Sao Paulo RP!\nConta: {FFFFFF}%s\n\n{FF0000}Digite uma {FFFFFF}senha {FF0000}abaixo!", PlayerInfo[playerid][player_Name]);
	    
	if (numRows)
	{
	    PlayerTextDrawSetString(playerid, PlayerInfo[playerid][td_Status], "~g~Conta verificada! Efetue seu login...");
	}
	else
	{
	    PlayerTextDrawSetString(playerid, PlayerInfo[playerid][td_Status], "~r~Conta inexistente! Registre-se abaixo...");
		ShowPlayerDialog(playerid, DIALOG_REGISTER, DIALOG_STYLE_INPUT, "{FFFFFF}Registro", string_Dialog, "Registrar", "");
	}

	return 1;
}
