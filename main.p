//File created at 19:16 on 19/05/2014

enum
{
	DIALOG_REGISTER,
	DIALOG_LOGIN
}

enum E_PLAYER_INFO
{
	player_Name[MAX_PLAYER_NAME],
	player_SID,
	
	player_Ip[16],
	player_MutedReason[128],
	
	bool:player_Muted,
	
	PlayerText:td_Status
}

new
	PlayerInfo[MAX_PLAYERS][E_PLAYER_INFO];
	
new
	SERVER_PLAYERS;
	
new
	MySQL_ConnectionHandle;
	
function SendChatMessage(playerid, Float:distance, color, message[])
{
	new
	    Float:player_Pos[3];
	    
	GetPlayerPos(playerid, player_Pos[0], player_Pos[1], player_Pos[2]);

	for (new i; i < SERVER_PLAYERS; ++i)
	{
	    if (IsPlayerInRangeOfPoint(i, distance, player_Pos[0], player_Pos[1], player_Pos[2]))
	    {
	        SendClientMessage(i, color, message);
	        continue;
	    }
	    else
	        continue;
	}

	return 1;
}
