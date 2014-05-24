//File created at 16:54 on 20/05/2014

hook Server_OnGameModeInit()
{
	SetGameModeText("SP-RP v0.1");
	SendRconCommand("hostname Sao Paulo RP (www.SaoPaulo-RP.tk)");
	SendRconCommand("mapname Sao Paulo");
	
	MySQL_ConnectDB();
	MySQL_CreateTables();
	
	return 1;
}

hook Server_OnGameModeExit()
{
	MySQL_CloseDB();
	
	for (new i; i < MAX_TEXT_DRAWS; ++i)
	{
	    TextDrawDestroy(Text: i);
	}
	
	return 1;
}
