
new XeDuaP[MAX_PLAYERS] = INVALID_VEHICLE_ID;
new Float:LastPostDX[MAX_PLAYERS][3],LastInterior[MAX_PLAYERS],LastVW[MAX_PLAYERS];
new bool:OpenDuaXe = false;
CMD:duaxeopen(playerid,params[] ) {
    if(PlayerInfo[playerid][pAdmin] > 2) {
        if(OpenDuaXe == true) {
            OpenDuaXe = false;
            SendClientMessageToAll(-1, "[*] He thong dua xe da bi Admin khoa .");
        }
        else if(OpenDuaXe == false) {
            OpenDuaXe = true;
            SendClientMessageToAll(-1, "[*] He thong dua xe da duoc Admin Mo[/duaxe id gia tien].");
        }
    }
    return 1;
}
CMD:duaxe(playerid,params[]) {
    new giveplayerid,giatien,string[129];
    if (PlayerInfo[playerid][pJailTime] > 0)
    {
        SendClientMessageEx(playerid,COLOR_GREY,"Ban khong the su dung dien thoai khi dang o trong tu.");
        return 1;
    }
    if(PlayerTied[playerid] != 0 || PlayerCuffed[playerid] != 0)
    {
        SendClientMessageEx(playerid,COLOR_GREY,"Ban khong the su dung dien thoai.");
        return 1;
    }
    if(GetPVarInt(playerid, "Injured") == 1)
    {
        SendClientMessageEx(playerid, COLOR_GREY, "   Khong the sai lenh khi bi thuong!");
        return 1;
    }
    if(GetPVarType(playerid, "PlayerCuffed") || GetPVarType(playerid, "Injured") || GetPVarType(playerid, "IsFrozen")) {
           return SendClientMessage(playerid, COLOR_GRAD2, "Ban khong the lam dieu do vao luc nay!");
    }
    if(sscanf(params, "ii", giveplayerid, giatien))
        return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /duaxe [nguoi dua xe] [gia tien cuoc]");
    if(giatien < 1 || giatien > 20000) return SendClientMessageEx(playerid, COLOR_GREY, "Gia tien phai tu 1-20.000");
    if(GetPVarInt(playerid, "DangDuaXe") == 1) return SendClientMessage(playerid,-1,"Dang dua xe");
    if(giveplayerid == playerid)
        return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong the ban credits cho chinh minh.");
    if(GetPVarInt(playerid, "Dang_MoiDuaXe") == 1) return SendClientMessage(playerid,-1,"Ban dang moi 1 nguoi khac roi");
    else if(GetPVarType(giveplayerid, "LoiMoiDuaXe"))
        return SendClientMessageEx(playerid, COLOR_GREY, "Nguoi nay da duoc moi dua xe roi.");
    SetPVarInt(giveplayerid,"LoiMoiDuaXe",1);
    SetPVarInt(giveplayerid,"NguoiMoiDuaXe",playerid);
    SetPVarInt(giveplayerid,"OfferMoiDuaXe",giatien);
    SetPVarInt(playerid,"Dang_MoiDuaXe",1);
    SetPVarInt(playerid,"Dang_NguoiMoiDuaXe",giveplayerid);
    SetPVarInt(playerid,"Dang_OfferMoiDuaXe",giveplayerid);
    format(string, 129, "[DUA XE] %s da moi ban dua xe voi gia cuoc la: %s | /chapnhanduaxe de dua xe", GetPlayerNameEx(playerid),number_format(giatien));
    SendClientMessageEx(giveplayerid, -1, string);
    format(string, 129, "[DUA XE] Ban da moi %s dua xe voi gia cuoc la: %s", GetPlayerNameEx(giveplayerid),number_format(giatien));
    SendClientMessageEx(playerid, -1, string);
    return 1;
}
hook OnPlayerDeath(playerid) {
    if(GetPVarInt(playerid,"DangDuaXe") == 1) {
        TogglePlayerControllable(playerid, 1);
        KillEMSQueue(playerid);
        ClearAnimations(playerid);
        SetPlayerHealth(playerid, 100);
        new playerduaxe;
        playerduaxe = GetPVarInt(playerid, "NguoiDuaXe");
        FinishDuaXeCrash(playerid,playerduaxe);
    }
}
hook OnPlayerDisconnect(playerid, reason) {
    if(GetPVarInt(playerid,"DangDuaXe") == 1) {
        new playerduaxe;
        playerduaxe = GetPVarInt(playerid, "NguoiDuaXe");
        FinishDuaXeCrash(playerid,playerduaxe);
    }
}
CMD:chapnhanduaxe(playerid,params[]) {
    if(GetPVarInt(playerid, "DangDuaXe") == 1) return SendClientMessage(playerid,-1,"Dang dua xe");
    if(GetPVarInt(playerid,"LoiMoiDuaXe") != 1) return SendClientMessage(playerid,-1,"Ban khong co ai moi dua xe");
    StartDuaXe(playerid,GetPVarInt(playerid,"NguoiMoiDuaXe"),GetPVarInt(playerid,"OfferMoiDuaXe"));
    return 1;
}
StartDuaXe(player1,player2,giatien) {
    GetPlayerPos(player1, LastPostDX[player1][0],LastPostDX[player1][1],LastPostDX[player1][2]);
    GetPlayerPos(player2, LastPostDX[player2][0],LastPostDX[player2][1],LastPostDX[player2][2]);
    
    LastInterior[player1] = GetPlayerInterior(player1);
    LastVW[player1] = GetPlayerVirtualWorld(player1);
    LastInterior[player2] = GetPlayerInterior(player2);
    LastVW[player2] = GetPlayerVirtualWorld(player2);


    XeDuaP[player1] = CreateVehicle(522, -1393.9960,-217.5891,1050.6823,355.2848, 1, 1