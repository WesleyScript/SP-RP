//File created at 20:10 on 21/05/2014

hook Interface_OnPlayerConnect(playerid)
{
	//Textdraws
	PlayerInfo[playerid][td_Status] = CreatePlayerTextDraw(playerid, 632.000000, 1.749985, "Status Conta");
	PlayerTextDrawLetterSize(playerid, PlayerInfo[playerid][td_Status], 0.239499, 0.981664);
	PlayerTextDrawAlignment(playerid, PlayerInfo[playerid][td_Status], 3);
	PlayerTextDrawColor(playerid, PlayerInfo[playerid][td_Status], 65535);
	PlayerTextDrawSetShadow(playerid, PlayerInfo[playerid][td_Status], 0);
	PlayerTextDrawSetOutline(playerid, PlayerInfo[playerid][td_Status], 1);
	PlayerTextDrawBackgroundColor(playerid, PlayerInfo[playerid][td_Status], 255);
	PlayerTextDrawFont(playerid, PlayerInfo[playerid][td_Status], 2);
	PlayerTextDrawSetProportional(playerid, PlayerInfo[playerid][td_Status], 1);

	return 1;
}

hook Interface_OnPlayerDisconnect(playerid, reason)
{
	#pragma unused reason
	
	PlayerTextDrawDestroy(playerid, PlayerInfo[playerid][td_Status]);
	
	return 1;	
}