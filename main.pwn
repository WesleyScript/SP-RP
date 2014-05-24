//File created at 16:02 on 19/05/2014

#include "lib/a_samp"

#define hook%0(%1) stock%0(%1)
#define function%0(%1) stock%0(%1)
#define query%0(%1) forward%0(%1);public%0(%1)

#include "lib/plugins/sscanf"
#include "lib/plugins/mysql"
#include "lib/plugins/streamer"

#include "lib/extra/zcmd"

#include "main.p"

#include "game/server.p"
#include "game/interface.p"
#include "game/mysql.p"
#include "game/player.p"

AntiDeAMX()
{
    new a[][] =
    {
        "Unarmed (Fist)",
        "Brass K"
    };
    #pragma unused a

    new b;
    #emit load.pri b
    #emit stor.pri b 
}


main() { }

public OnGameModeInit()
{
    	AntiDeAMX();

	DisableInteriorEnterExits();
	EnableStuntBonusForAll(0);
	ManualVehicleEngineAndLights();
	
	Server_OnGameModeInit();

	return 1;
}

public OnGameModeExit()
{
	Server_OnGameModeExit();

	return 1;
}

public OnPlayerRequestClass(playerid, classid)
{
	Player_OnPlayerRequestClass(playerid, classid);

	return 0;
}

public OnPlayerConnect(playerid)
{
	Interface_OnPlayerConnect(playerid);
	Player_OnPlayerConnect(playerid);
	
	return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
	Player_OnPlayerDisconnect(playerid, reason);

	return 1;
}

public OnPlayerSpawn(playerid)
{
	return 1;
}

public OnPlayerDeath(playerid, killerid, reason)
{
	return 1;
}

public OnVehicleSpawn(vehicleid)
{
	return 1;
}

public OnVehicleDeath(vehicleid, killerid)
{
	return 1;
}

public OnPlayerText(playerid, text[])
{
	return 1;
}

public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{
	return 1;
}

public OnPlayerExitVehicle(playerid, vehicleid)
{
	return 1;
}

public OnPlayerStateChange(playerid, newstate, oldstate)
{
	return 1;
}

public OnPlayerEnterCheckpoint(playerid)
{
	return 1;
}

public OnPlayerLeaveCheckpoint(playerid)
{
	return 1;
}

public OnPlayerEnterRaceCheckpoint(playerid)
{
	return 1;
}

public OnPlayerLeaveRaceCheckpoint(playerid)
{
	return 1;
}

public OnRconCommand(cmd[])
{
	return 1;
}

public OnObjectMoved(objectid)
{
	return 1;
}

public OnPlayerObjectMoved(playerid, objectid)
{
	return 1;
}

public OnPlayerPickUpPickup(playerid, pickupid)
{
	return 1;
}

public OnVehicleMod(playerid, vehicleid, componentid)
{
	return 1;
}

public OnVehiclePaintjob(playerid, vehicleid, paintjobid)
{
	return 1;
}

public OnVehicleRespray(playerid, vehicleid, color1, color2)
{
	return 1;
}

public OnPlayerSelectedMenuRow(playerid, row)
{
	return 1;
}

public OnPlayerExitedMenu(playerid)
{
	return 1;
}

public OnPlayerInteriorChange(playerid, newinteriorid, oldinteriorid)
{
	return 1;
}

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	return 1;
}

public OnRconLoginAttempt(ip[], password[], success)
{
	return 1;
}

public OnPlayerUpdate(playerid)
{
	return 1;
}

public OnVehicleStreamIn(vehicleid, forplayerid)
{
	return 1;
}

public OnVehicleStreamOut(vehicleid, forplayerid)
{
	return 1;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    Player_OnDialogResponse(playerid, dialogid, response, listitem, inputtext);

	return 0;
}

public OnPlayerClickPlayer(playerid, clickedplayerid, source)
{
	return 1;
}
