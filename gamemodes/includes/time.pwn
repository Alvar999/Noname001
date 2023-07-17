
#include <YSI\y_hooks>

new Text:TimePublic, Text:DatePublic;
new PlayerText:KC[MAX_PLAYERS];
new PlayerText:Cre[MAX_PLAYERS];
new PlayerText:KILL[MAX_PLAYERS];
new Text:PublicTD[3];

forward setTimePublic(playerid);

hook OnGameModeInit()
{
    SetTimer("setTimePublic",500,true);

	PublicTD[0] = TextDrawCreate(93.000000, 441.000000, "_");
	TextDrawFont(PublicTD[0], 1);
	TextDrawLetterSize(PublicTD[0], 0.208333, -0.299995);
	TextDrawTextSize(PublicTD[0], 148.500000, 40.500000);
	TextDrawSetOutline(PublicTD[0], 1);
	TextDrawSetShadow(PublicTD[0], 0);
	TextDrawAlignment(PublicTD[0], 2);
	TextDrawColor(PublicTD[0], 16777215);
	TextDrawBackgroundColor(PublicTD[0], 16777215);
	TextDrawBoxColor(PublicTD[0], 16777127);
	TextDrawUseBox(PublicTD[0], 1);
	TextDrawSetProportional(PublicTD[0], 1);
	TextDrawSetSelectable(PublicTD[0], 0);

	DatePublic = TextDrawCreate(267.000000, 378.000000, "2/09/2021");
	TextDrawFont(DatePublic, 1);
	TextDrawLetterSize(DatePublic, 0.600000, 2.000000);
	TextDrawTextSize(DatePublic, 400.000000, 17.000000);
	TextDrawSetOutline(DatePublic, 1);
	TextDrawSetShadow(DatePublic, 0);
	TextDrawAlignment(DatePublic, 1);
	TextDrawColor(DatePublic, -1);
	TextDrawBackgroundColor(DatePublic, 255);
	TextDrawBoxColor(DatePublic, 50);
	TextDrawUseBox(DatePublic, 0);
	TextDrawSetProportional(DatePublic, 1);
	TextDrawSetSelectable(DatePublic, 0);

	TimePublic = TextDrawCreate(278.000000, 405.000000, "12:50:31");
	TextDrawFont(TimePublic, 1);
	TextDrawLetterSize(TimePublic, 0.600000, 2.000000);
	TextDrawTextSize(TimePublic, 375.000000, -6.000000);
	TextDrawSetOutline(TimePublic, 1);
	TextDrawSetShadow(TimePublic, 0);
	TextDrawAlignment(TimePublic, 1);
	TextDrawColor(TimePublic, 16777215);
	TextDrawBackgroundColor(TimePublic, 255);
	TextDrawBoxColor(TimePublic, 50);
	TextDrawUseBox(TimePublic, 0);
	TextDrawSetProportional(TimePublic, 1);
	TextDrawSetSelectable(TimePublic, 0);

	PublicTD[1] = TextDrawCreate(34.000000, 441.000000, "_");
	TextDrawFont(PublicTD[1], 1);
	TextDrawLetterSize(PublicTD[1], 0.208333, -0.299995);
	TextDrawTextSize(PublicTD[1], 144.000000, 41.500000);
	TextDrawSetOutline(PublicTD[1], 1);
	TextDrawSetShadow(PublicTD[1], 0);
	TextDrawAlignment(PublicTD[1], 2);
	TextDrawColor(PublicTD[1], 16777215);
	TextDrawBackgroundColor(PublicTD[1], 16777215);
	TextDrawBoxColor(PublicTD[1], 16777127);
	TextDrawUseBox(PublicTD[1], 1);
	TextDrawSetProportional(PublicTD[1], 1);
	TextDrawSetSelectable(PublicTD[1], 0);

	PublicTD[2] = TextDrawCreate(155.000000, 441.000000, "_");
	TextDrawFont(PublicTD[2], 1);
	TextDrawLetterSize(PublicTD[2], 0.208333, -0.299995);
	TextDrawTextSize(PublicTD[2], 149.500000, 41.000000);
	TextDrawSetOutline(PublicTD[2], 1);
	TextDrawSetShadow(PublicTD[2], 0);
	TextDrawAlignment(PublicTD[2], 2);
	TextDrawColor(PublicTD[2], 16777215);
	TextDrawBackgroundColor(PublicTD[2], 16777215);
	TextDrawBoxColor(PublicTD[2], 16777127);
	TextDrawUseBox(PublicTD[2], 1);
	TextDrawSetProportional(PublicTD[2], 1);
	TextDrawSetSelectable(PublicTD[2], 0);

	SetTimer("setTimePublic",1000,true);
	return 1;
}


hook OnPlayerConnect(playerid)
{
	KC[playerid] = CreatePlayerTextDraw(playerid, 13.000000, 426.000000, "KC: 40000");
	PlayerTextDrawFont(playerid, KC[playerid], 2);
	PlayerTextDrawLetterSize(playerid, KC[playerid], 0.143997, 1.248000);
	PlayerTextDrawTextSize(playerid, KC[playerid], 54.500000, 38.500000);
	PlayerTextDrawSetOutline(playerid, KC[playerid], 1);
	PlayerTextDrawSetShadow(playerid, KC[playerid], 0);
	PlayerTextDrawAlignment(playerid, KC[playerid], 1);
	PlayerTextDrawColor(playerid, KC[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, KC[playerid], 110);
	PlayerTextDrawBoxColor(playerid, KC[playerid], 255);
	PlayerTextDrawUseBox(playerid, KC[playerid], 1);
	PlayerTextDrawSetProportional(playerid, KC[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, KC[playerid], 0);

	Cre[playerid] = CreatePlayerTextDraw(playerid, 73.000000, 426.000000, "CRE: 5000");
	PlayerTextDrawFont(playerid, Cre[playerid], 2);
	PlayerTextDrawLetterSize(playerid, Cre[playerid], 0.144997, 1.248998);
	PlayerTextDrawTextSize(playerid, Cre[playerid], 113.500000, -20.500000);
	PlayerTextDrawSetOutline(playerid, Cre[playerid], 1);
	PlayerTextDrawSetShadow(playerid, Cre[playerid], 0);
	PlayerTextDrawAlignment(playerid, Cre[playerid], 1);
	PlayerTextDrawColor(playerid, Cre[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, Cre[playerid], 255);
	PlayerTextDrawBoxColor(playerid, Cre[playerid], 255);
	PlayerTextDrawUseBox(playerid, Cre[playerid], 1);
	PlayerTextDrawSetProportional(playerid, Cre[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, Cre[playerid], 0);

	KILL[playerid] = CreatePlayerTextDraw(playerid, 135.000000, 426.000000, "KILL: 0");
	PlayerTextDrawFont(playerid, KILL[playerid], 2);
	PlayerTextDrawLetterSize(playerid, KILL[playerid], 0.144997, 1.248998);
	PlayerTextDrawTextSize(playerid, KILL[playerid], 175.500000, 1.000000);
	PlayerTextDrawSetOutline(playerid, KILL[playerid], 1);
	PlayerTextDrawSetShadow(playerid, KILL[playerid], 0);
	PlayerTextDrawAlignment(playerid, KILL[playerid], 1);
	PlayerTextDrawColor(playerid, KILL[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, KILL[playerid], 110);
	PlayerTextDrawBoxColor(playerid, KILL[playerid], 255);
	PlayerTextDrawUseBox(playerid, KILL[playerid], 1);
	PlayerTextDrawSetProportional(playerid, KILL[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, KILL[playerid], 0);

	
	
	new stringcoin[128],stringkill[128],stringcre[128];
	format(stringcre, sizeof(stringcre), "CRE: %d",PlayerInfo[playerid][pCredits]);
	format(stringkill, sizeof(stringkill), "KC: %d",PlayerInfo[playerid][pKimCuong]);
	format(stringcoin, sizeof(stringcoin), "KILL: %d", PlayerInfo[playerid][pGiet]);
	
	PlayerTextDrawSetString(playerid, KILL[playerid],stringkill);
	PlayerTextDrawShow(playerid, KILL[playerid]);
	
	PlayerTextDrawSetString(playerid, Cre[playerid],stringcre);
	PlayerTextDrawShow(playerid, Cre[playerid]);
	
	PlayerTextDrawSetString(playerid, KC[playerid],stringcoin);
	PlayerTextDrawShow(playerid, KC[playerid]);
	
	//TextDrawShowForPlayer(playerid, Server);

	return 1;
}

hook OnPlayerUpdate(playerid)
{
	new stringcoin[128],stringkill[128],stringcre[128];
	format(stringcre, sizeof(stringcre), "CRE: %d",PlayerInfo[playerid][pCredits]);
	format(stringkill, sizeof(stringkill), "KC: %d",PlayerInfo[playerid][pKimCuong]);
	format(stringcoin, sizeof(stringcoin), "KILL: %d", PlayerInfo[playerid][pGiet]);

	PlayerTextDrawSetString(playerid, KILL[playerid],stringkill);
	PlayerTextDrawShow(playerid, KILL[playerid]);

	PlayerTextDrawSetString(playerid, Cre[playerid],stringcre);
	PlayerTextDrawShow(playerid, Cre[playerid]);

	PlayerTextDrawSetString(playerid, KC[playerid],stringcoin);
	PlayerTextDrawShow(playerid, KC[playerid]);

}

hook OnPlayerSpawn(playerid)
{
	TextDrawShowForPlayer(playerid, TimePublic), TextDrawShowForPlayer(playerid, DatePublic);
	for(new i; i<3; i++) TextDrawShowForPlayer(playerid, PublicTD[i]);
	return 1;
}

hook OnPlayerDisconnect(playerid, reason)
{
	TextDrawHideForPlayer(playerid, TimePublic), TextDrawHideForPlayer(playerid, DatePublic);
	PlayerTextDrawDestroy(playerid, KC[playerid]);
	PlayerTextDrawDestroy(playerid, Cre[playerid]);
	PlayerTextDrawDestroy(playerid, KILL[playerid]);
	return 1;
}


public setTimePublic(playerid)
{
	new string[256],year,month,day,hours,minutes,seconds;
	getdate(year, month, day), gettime(hours, minutes, seconds);
	format(string, sizeof string, "%d/%s%d/%s%d", day, ((month < 10) ? ("0") : ("")), month, (year < 10) ? ("0") : (""), year);
	TextDrawSetString(DatePublic, string);
	format(string, sizeof string, "%s%d:%s%d:%s%d", (hours < 10) ? ("0") : (""), hours, (minutes < 10) ? ("0") : (""), minutes, (seconds < 10) ? ("0") : (""), seconds);
	TextDrawSetString(TimePublic, string);
}
