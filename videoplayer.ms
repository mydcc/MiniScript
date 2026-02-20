// ========================================================
// VIDEOPLAYER MASTER-SCRIPT
// ========================================================
// Dieses Skript dient als Vorlage für 15 "Gehirn-Cubes" (N1-5, B1-5, P1-5).
// Jeder Cube hält die Logik für einen Zustandswechsel oder eine Aktion.
// ========================================================

// ########################################################
// GRUPPE N (NEXT) - LOGIK FÜR DAS WEITERSCHALTEN
// ########################################################

// --- CUBE Next 1: Wechsel von Video 1 zu Video 2 ---
fromID = 1
toID = 2

executeVideoSwitch = function(fID, tID)
    position = "70.2, 12.9, -222"
    visible = "0.01, 22, 35"
    hidden = "0, 0, 0"
    btn_visible = "0.2, 0.2, 0.001"
    btn_hidden = "0, 0, 0"
    urls = ["https://nft.fra1.cdn.digitaloceanspaces.com/bo/Erinnerung_1987.mp4", "https://nft.fra1.cdn.digitaloceanspaces.com/bo/Medley.mp4", "https://nft.fra1.cdn.digitaloceanspaces.com/bo/So_sind_wir.mp4", "https://nft.fra1.cdn.digitaloceanspaces.com/bo/Nichts_ist_fuer_die_Ewigkeit.mp4", "https://nft.fra1.cdn.digitaloceanspaces.com/bo/Wilde_Jungs.mp4"]
    if fID > 0 then
        objFrom = "Video(" + fID + ")"
        playVideo objFrom, urls[fID-1], "loop", 1
        networkCommand objFrom, "scaleObject", hidden
        networkCommand "btn_next(" + fID + ")", "scaleObject", btn_hidden
        networkCommand "btn_back(" + fID + ")", "scaleObject", btn_hidden
        networkCommand "btnPlay(" + fID + ")", "scaleObject", btn_hidden
    end if
    objTo = "Video(" + tID + ")"
    networkCommand objTo, "moveObject", position
    networkCommand objTo, "scaleObject", visible
    playVideo objTo, urls[tID-1], "loop", 1
    networkCommand "btn_next(" + tID + ")", "scaleObject", btn_visible
    networkCommand "btn_back(" + tID + ")", "scaleObject", btn_visible
    networkCommand "btnPlay(" + tID + ")", "scaleObject", btn_visible
end function
executeVideoSwitch(fromID, toID)


// --- CUBE Next 2: Wechsel von Video 2 zu Video 3 ---
fromID = 2
toID = 3

executeVideoSwitch = function(fID, tID)
    position = "70.2, 12.9, -222"
    visible = "0.01, 22, 35"
    hidden = "0, 0, 0"
    btn_visible = "0.2, 0.2, 0.001"
    btn_hidden = "0, 0, 0"
    urls = ["https://nft.fra1.cdn.digitaloceanspaces.com/bo/Erinnerung_1987.mp4", "https://nft.fra1.cdn.digitaloceanspaces.com/bo/Medley.mp4", "https://nft.fra1.cdn.digitaloceanspaces.com/bo/So_sind_wir.mp4", "https://nft.fra1.cdn.digitaloceanspaces.com/bo/Nichts_ist_fuer_die_Ewigkeit.mp4", "https://nft.fra1.cdn.digitaloceanspaces.com/bo/Wilde_Jungs.mp4"]
    if fID > 0 then
        objFrom = "Video(" + fID + ")"
        playVideo objFrom, urls[fID-1], "loop", 1
        networkCommand objFrom, "scaleObject", hidden
        networkCommand "btn_next(" + fID + ")", "scaleObject", btn_hidden
        networkCommand "btn_back(" + fID + ")", "scaleObject", btn_hidden
        networkCommand "btnPlay(" + fID + ")", "scaleObject", btn_hidden
    end if
    objTo = "Video(" + tID + ")"
    networkCommand objTo, "moveObject", position
    networkCommand objTo, "scaleObject", visible
    playVideo objTo, urls[tID-1], "loop", 1
    networkCommand "btn_next(" + tID + ")", "scaleObject", btn_visible
    networkCommand "btn_back(" + tID + ")", "scaleObject", btn_visible
    networkCommand "btnPlay(" + tID + ")", "scaleObject", btn_visible
end function
executeVideoSwitch(fromID, toID)


// --- CUBE Next 3: Wechsel von Video 3 zu Video 4 ---
fromID = 3
toID = 4

executeVideoSwitch = function(fID, tID)
    position = "70.2, 12.9, -222"
    visible = "0.01, 22, 35"
    hidden = "0, 0, 0"
    btn_visible = "0.2, 0.2, 0.001"
    btn_hidden = "0, 0, 0"
    urls = ["https://nft.fra1.cdn.digitaloceanspaces.com/bo/Erinnerung_1987.mp4", "https://nft.fra1.cdn.digitaloceanspaces.com/bo/Medley.mp4", "https://nft.fra1.cdn.digitaloceanspaces.com/bo/So_sind_wir.mp4", "https://nft.fra1.cdn.digitaloceanspaces.com/bo/Nichts_ist_fuer_die_Ewigkeit.mp4", "https://nft.fra1.cdn.digitaloceanspaces.com/bo/Wilde_Jungs.mp4"]
    if fID > 0 then
        objFrom = "Video(" + fID + ")"
        playVideo objFrom, urls[fID-1], "loop", 1
        networkCommand objFrom, "scaleObject", hidden
        networkCommand "btn_next(" + fID + ")", "scaleObject", btn_hidden
        networkCommand "btn_back(" + fID + ")", "scaleObject", btn_hidden
        networkCommand "btnPlay(" + fID + ")", "scaleObject", btn_hidden
    end if
    objTo = "Video(" + tID + ")"
    networkCommand objTo, "moveObject", position
    networkCommand objTo, "scaleObject", visible
    playVideo objTo, urls[tID-1], "loop", 1
    networkCommand "btn_next(" + tID + ")", "scaleObject", btn_visible
    networkCommand "btn_back(" + tID + ")", "scaleObject", btn_visible
    networkCommand "btnPlay(" + tID + ")", "scaleObject", btn_visible
end function
executeVideoSwitch(fromID, toID)


// --- CUBE Next 4: Wechsel von Video 4 zu Video 5 ---
fromID = 4
toID = 5

executeVideoSwitch = function(fID, tID)
    position = "70.2, 12.9, -222"
    visible = "0.01, 22, 35"
    hidden = "0, 0, 0"
    btn_visible = "0.2, 0.2, 0.001"
    btn_hidden = "0, 0, 0"
    urls = ["https://nft.fra1.cdn.digitaloceanspaces.com/bo/Erinnerung_1987.mp4", "https://nft.fra1.cdn.digitaloceanspaces.com/bo/Medley.mp4", "https://nft.fra1.cdn.digitaloceanspaces.com/bo/So_sind_wir.mp4", "https://nft.fra1.cdn.digitaloceanspaces.com/bo/Nichts_ist_fuer_die_Ewigkeit.mp4", "https://nft.fra1.cdn.digitaloceanspaces.com/bo/Wilde_Jungs.mp4"]
    if fID > 0 then
        objFrom = "Video(" + fID + ")"
        playVideo objFrom, urls[fID-1], "loop", 1
        networkCommand objFrom, "scaleObject", hidden
        networkCommand "btn_next(" + fID + ")", "scaleObject", btn_hidden
        networkCommand "btn_back(" + fID + ")", "scaleObject", btn_hidden
        networkCommand "btnPlay(" + fID + ")", "scaleObject", btn_hidden
    end if
    objTo = "Video(" + tID + ")"
    networkCommand objTo, "moveObject", position
    networkCommand objTo, "scaleObject", visible
    playVideo objTo, urls[tID-1], "loop", 1
    networkCommand "btn_next(" + tID + ")", "scaleObject", btn_visible
    networkCommand "btn_back(" + tID + ")", "scaleObject", btn_visible
    networkCommand "btnPlay(" + tID + ")", "scaleObject", btn_visible
end function
executeVideoSwitch(fromID, toID)


// --- CUBE Next 5: Wechsel von Video 5 zurück zu Video 1 ---
fromID = 5
toID = 1

executeVideoSwitch = function(fID, tID)
    position = "70.2, 12.9, -222"
    visible = "0.01, 22, 35"
    hidden = "0, 0, 0"
    btn_visible = "0.2, 0.2, 0.001"
    btn_hidden = "0, 0, 0"
    urls = ["https://nft.fra1.cdn.digitaloceanspaces.com/bo/Erinnerung_1987.mp4", "https://nft.fra1.cdn.digitaloceanspaces.com/bo/Medley.mp4", "https://nft.fra1.cdn.digitaloceanspaces.com/bo/So_sind_wir.mp4", "https://nft.fra1.cdn.digitaloceanspaces.com/bo/Nichts_ist_fuer_die_Ewigkeit.mp4", "https://nft.fra1.cdn.digitaloceanspaces.com/bo/Wilde_Jungs.mp4"]
    if fID > 0 then
        objFrom = "Video(" + fID + ")"
        playVideo objFrom, urls[fID-1], "loop", 1
        networkCommand objFrom, "scaleObject", hidden
        networkCommand "btn_next(" + fID + ")", "scaleObject", btn_hidden
        networkCommand "btn_back(" + fID + ")", "scaleObject", btn_hidden
        networkCommand "btnPlay(" + fID + ")", "scaleObject", btn_hidden
    end if
    objTo = "Video(" + tID + ")"
    networkCommand objTo, "moveObject", position
    networkCommand objTo, "scaleObject", visible
    playVideo objTo, urls[tID-1], "loop", 1
    networkCommand "btn_next(" + tID + ")", "scaleObject", btn_visible
    networkCommand "btn_back(" + tID + ")", "scaleObject", btn_visible
    networkCommand "btnPlay(" + tID + ")", "scaleObject", btn_visible
end function
executeVideoSwitch(fromID, toID)


// ########################################################
// GRUPPE B (BACK) - LOGIK FÜR DAS RÜCKWÄRTS SCHALTEN
// ########################################################

// --- CUBE Back 1: Von Video 1 zurück zu Video 5 ---
fromID = 1
toID = 5

executeVideoSwitch = function(fID, tID)
    position = "70.2, 12.9, -222"
    visible = "0.01, 22, 35"
    hidden = "0, 0, 0"
    btn_visible = "0.2, 0.2, 0.001"
    btn_hidden = "0, 0, 0"
    urls = ["https://nft.fra1.cdn.digitaloceanspaces.com/bo/Erinnerung_1987.mp4", "https://nft.fra1.cdn.digitaloceanspaces.com/bo/Medley.mp4", "https://nft.fra1.cdn.digitaloceanspaces.com/bo/So_sind_wir.mp4", "https://nft.fra1.cdn.digitaloceanspaces.com/bo/Nichts_ist_fuer_die_Ewigkeit.mp4", "https://nft.fra1.cdn.digitaloceanspaces.com/bo/Wilde_Jungs.mp4"]
    if fID > 0 then
        objFrom = "Video(" + fID + ")"
        playVideo objFrom, urls[fID-1], "loop", 1
        networkCommand objFrom, "scaleObject", hidden
        networkCommand "btn_next(" + fID + ")", "scaleObject", btn_hidden
        networkCommand "btn_back(" + fID + ")", "scaleObject", btn_hidden
        networkCommand "btnPlay(" + fID + ")", "scaleObject", btn_hidden
    end if
    objTo = "Video(" + tID + ")"
    networkCommand objTo, "moveObject", position
    networkCommand objTo, "scaleObject", visible
    playVideo objTo, urls[tID-1], "loop", 1
    networkCommand "btn_next(" + tID + ")", "scaleObject", btn_visible
    networkCommand "btn_back(" + tID + ")", "scaleObject", btn_visible
    networkCommand "btnPlay(" + tID + ")", "scaleObject", btn_visible
end function
executeVideoSwitch(fromID, toID)


// --- CUBE Back 2: Von Video 2 zurück zu Video 1 ---
fromID = 2
toID = 1

executeVideoSwitch = function(fID, tID)
    position = "70.2, 12.9, -222"
    visible = "0.01, 22, 35"
    hidden = "0, 0, 0"
    btn_visible = "0.2, 0.2, 0.001"
    btn_hidden = "0, 0, 0"
    urls = ["https://nft.fra1.cdn.digitaloceanspaces.com/bo/Erinnerung_1987.mp4", "https://nft.fra1.cdn.digitaloceanspaces.com/bo/Medley.mp4", "https://nft.fra1.cdn.digitaloceanspaces.com/bo/So_sind_wir.mp4", "https://nft.fra1.cdn.digitaloceanspaces.com/bo/Nichts_ist_fuer_die_Ewigkeit.mp4", "https://nft.fra1.cdn.digitaloceanspaces.com/bo/Wilde_Jungs.mp4"]
    if fID > 0 then
        objFrom = "Video(" + fID + ")"
        playVideo objFrom, urls[fID-1], "loop", 1
        networkCommand objFrom, "scaleObject", hidden
        networkCommand "btn_next(" + fID + ")", "scaleObject", btn_hidden
        networkCommand "btn_back(" + fID + ")", "scaleObject", btn_hidden
        networkCommand "btnPlay(" + fID + ")", "scaleObject", btn_hidden
    end if
    objTo = "Video(" + tID + ")"
    networkCommand objTo, "moveObject", position
    networkCommand objTo, "scaleObject", visible
    playVideo objTo, urls[tID-1], "loop", 1
    networkCommand "btn_next(" + tID + ")", "scaleObject", btn_visible
    networkCommand "btn_back(" + tID + ")", "scaleObject", btn_visible
    networkCommand "btnPlay(" + tID + ")", "scaleObject", btn_visible
end function
executeVideoSwitch(fromID, toID)


// --- CUBE Back 3: Von Video 3 zurück zu Video 2 ---
fromID = 3
toID = 2

executeVideoSwitch = function(fID, tID)
    position = "70.2, 12.9, -222"
    visible = "0.01, 22, 35"
    hidden = "0, 0, 0"
    btn_visible = "0.2, 0.2, 0.001"
    btn_hidden = "0, 0, 0"
    urls = ["https://nft.fra1.cdn.digitaloceanspaces.com/bo/Erinnerung_1987.mp4", "https://nft.fra1.cdn.digitaloceanspaces.com/bo/Medley.mp4", "https://nft.fra1.cdn.digitaloceanspaces.com/bo/So_sind_wir.mp4", "https://nft.fra1.cdn.digitaloceanspaces.com/bo/Nichts_ist_fuer_die_Ewigkeit.mp4", "https://nft.fra1.cdn.digitaloceanspaces.com/bo/Wilde_Jungs.mp4"]
    if fID > 0 then
        objFrom = "Video(" + fID + ")"
        playVideo objFrom, urls[fID-1], "loop", 1
        networkCommand objFrom, "scaleObject", hidden
        networkCommand "btn_next(" + fID + ")", "scaleObject", btn_hidden
        networkCommand "btn_back(" + fID + ")", "scaleObject", btn_hidden
        networkCommand "btnPlay(" + fID + ")", "scaleObject", btn_hidden
    end if
    objTo = "Video(" + tID + ")"
    networkCommand objTo, "moveObject", position
    networkCommand objTo, "scaleObject", visible
    playVideo objTo, urls[tID-1], "loop", 1
    networkCommand "btn_next(" + tID + ")", "scaleObject", btn_visible
    networkCommand "btn_back(" + tID + ")", "scaleObject", btn_visible
    networkCommand "btnPlay(" + tID + ")", "scaleObject", btn_visible
end function
executeVideoSwitch(fromID, toID)


// --- CUBE Back 4: Von Video 4 zurück zu Video 3 ---
fromID = 4
toID = 3

executeVideoSwitch = function(fID, tID)
    position = "70.2, 12.9, -222"
    visible = "0.01, 22, 35"
    hidden = "0, 0, 0"
    btn_visible = "0.2, 0.2, 0.001"
    btn_hidden = "0, 0, 0"
    urls = ["https://nft.fra1.cdn.digitaloceanspaces.com/bo/Erinnerung_1987.mp4", "https://nft.fra1.cdn.digitaloceanspaces.com/bo/Medley.mp4", "https://nft.fra1.cdn.digitaloceanspaces.com/bo/So_sind_wir.mp4", "https://nft.fra1.cdn.digitaloceanspaces.com/bo/Nichts_ist_fuer_die_Ewigkeit.mp4", "https://nft.fra1.cdn.digitaloceanspaces.com/bo/Wilde_Jungs.mp4"]
    if fID > 0 then
        objFrom = "Video(" + fID + ")"
        playVideo objFrom, urls[fID-1], "loop", 1
        networkCommand objFrom, "scaleObject", hidden
        networkCommand "btn_next(" + fID + ")", "scaleObject", btn_hidden
        networkCommand "btn_back(" + fID + ")", "scaleObject", btn_hidden
        networkCommand "btnPlay(" + fID + ")", "scaleObject", btn_hidden
    end if
    objTo = "Video(" + tID + ")"
    networkCommand objTo, "moveObject", position
    networkCommand objTo, "scaleObject", visible
    playVideo objTo, urls[tID-1], "loop", 1
    networkCommand "btn_next(" + tID + ")", "scaleObject", btn_visible
    networkCommand "btn_back(" + tID + ")", "scaleObject", btn_visible
    networkCommand "btnPlay(" + tID + ")", "scaleObject", btn_visible
end function
executeVideoSwitch(fromID, toID)


// --- CUBE Back 5: Von Video 5 zurück zu Video 4 ---
fromID = 5
toID = 4

executeVideoSwitch = function(fID, tID)
    position = "70.2, 12.9, -222"
    visible = "0.01, 22, 35"
    hidden = "0, 0, 0"
    btn_visible = "0.2, 0.2, 0.001"
    btn_hidden = "0, 0, 0"
    urls = ["https://nft.fra1.cdn.digitaloceanspaces.com/bo/Erinnerung_1987.mp4", "https://nft.fra1.cdn.digitaloceanspaces.com/bo/Medley.mp4", "https://nft.fra1.cdn.digitaloceanspaces.com/bo/So_sind_wir.mp4", "https://nft.fra1.cdn.digitaloceanspaces.com/bo/Nichts_ist_fuer_die_Ewigkeit.mp4", "https://nft.fra1.cdn.digitaloceanspaces.com/bo/Wilde_Jungs.mp4"
    ]
    if fID > 0 then
        objFrom = "Video(" + fID + ")"
        playVideo objFrom, urls[fID-1], "loop", 0
        networkCommand objFrom, "scaleObject", hidden
        networkCommand "btn_next(" + fID + ")", "scaleObject", btn_hidden
        networkCommand "btn_back(" + fID + ")", "scaleObject", btn_hidden
        networkCommand "btnPlay(" + fID + ")", "scaleObject", btn_hidden
    end if
    objTo = "Video(" + tID + ")"
    networkCommand objTo, "moveObject", position
    networkCommand objTo, "scaleObject", visible
    playVideo objTo, urls[tID-1], "loop", 1
    networkCommand "btn_next(" + tID + ")", "scaleObject", btn_visible
    networkCommand "btn_back(" + tID + ")", "scaleObject", btn_visible
    networkCommand "btnPlay(" + tID + ")", "scaleObject", btn_visible
end function
executeVideoSwitch(fromID, toID)


// ########################################################
// GRUPPE P (PLAY) - FUNKTIONALITÄT ZUM ABSPIELEN
// ########################################################

// --- CUBE Play 1: Video 1 abspielen ---
videoID = 1

executePlay = function(vID)
    urls = ["https://nft.fra1.cdn.digitaloceanspaces.com/bo/Erinnerung_1987.mp4", "https://nft.fra1.cdn.digitaloceanspaces.com/bo/Medley.mp4", "https://nft.fra1.cdn.digitaloceanspaces.com/bo/So_sind_wir.mp4", "https://nft.fra1.cdn.digitaloceanspaces.com/bo/Nichts_ist_fuer_die_Ewigkeit.mp4", "https://nft.fra1.cdn.digitaloceanspaces.com/bo/Wilde_Jungs.mp4"]
    playVideo "Video(" + vID + ")", urls[vID-1], "loop", 1
end function
executePlay(videoID)


// --- CUBE Play 2: Video 2 abspielen ---
videoID = 2

executePlay = function(vID)
    urls = ["https://nft.fra1.cdn.digitaloceanspaces.com/bo/Erinnerung_1987.mp4", "https://nft.fra1.cdn.digitaloceanspaces.com/bo/Medley.mp4", "https://nft.fra1.cdn.digitaloceanspaces.com/bo/So_sind_wir.mp4", "https://nft.fra1.cdn.digitaloceanspaces.com/bo/Nichts_ist_fuer_die_Ewigkeit.mp4", "https://nft.fra1.cdn.digitaloceanspaces.com/bo/Wilde_Jungs.mp4"]
    playVideo "Video(" + vID + ")", urls[vID-1], "loop", 1
end function
executePlay(videoID)


// --- CUBE Play 3: Video 3 abspielen ---
videoID = 3

executePlay = function(vID)
    urls = ["https://nft.fra1.cdn.digitaloceanspaces.com/bo/Erinnerung_1987.mp4", "https://nft.fra1.cdn.digitaloceanspaces.com/bo/Medley.mp4", "https://nft.fra1.cdn.digitaloceanspaces.com/bo/So_sind_wir.mp4", "https://nft.fra1.cdn.digitaloceanspaces.com/bo/Nichts_ist_fuer_die_Ewigkeit.mp4", "https://nft.fra1.cdn.digitaloceanspaces.com/bo/Wilde_Jungs.mp4"]
    playVideo "Video(" + vID + ")", urls[vID-1], "loop", 1
end function
executePlay(videoID)


// --- CUBE Play 4: Video 4 abspielen ---
videoID = 4

executePlay = function(vID)
    urls = ["https://nft.fra1.cdn.digitaloceanspaces.com/bo/Erinnerung_1987.mp4", "https://nft.fra1.cdn.digitaloceanspaces.com/bo/Medley.mp4", "https://nft.fra1.cdn.digitaloceanspaces.com/bo/So_sind_wir.mp4", "https://nft.fra1.cdn.digitaloceanspaces.com/bo/Nichts_ist_fuer_die_Ewigkeit.mp4", "https://nft.fra1.cdn.digitaloceanspaces.com/bo/Wilde_Jungs.mp4"]
    playVideo "Video(" + vID + ")", urls[vID-1], "loop", 1
end function
executePlay(videoID)


// --- CUBE Play 5: Video 5 abspielen ---
videoID = 5

executePlay = function(vID)
    urls = ["https://nft.fra1.cdn.digitaloceanspaces.com/bo/Erinnerung_1987.mp4", "https://nft.fra1.cdn.digitaloceanspaces.com/bo/Medley.mp4", "https://nft.fra1.cdn.digitaloceanspaces.com/bo/So_sind_wir.mp4", "https://nft.fra1.cdn.digitaloceanspaces.com/bo/Nichts_ist_fuer_die_Ewigkeit.mp4", "https://nft.fra1.cdn.digitaloceanspaces.com/bo/Wilde_Jungs.mp4"]
    playVideo "Video(" + vID + ")", urls[vID-1], "loop", 1
end function
executePlay(videoID)
