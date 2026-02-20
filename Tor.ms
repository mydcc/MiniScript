// ========================================================
// 1. INIT & KONFIGURATION
// ========================================================
xFieldMin = -108.7
xFieldMax = -91.3
zFieldMin = -212.72 // Torlinie Unten
zFieldMax = -187.3  // Torlinie Oben

// Tor-Begrenzungen (Netz-Tiefe)
zNetBottom = -213.2 
zNetTop = -186.8    

// Tor-Breite
goalXMin = -101
goalXMax = -99

yBall = 0.115
yTrigger = 0.5 

// DYNAMISCHE SCHUSSSTÄRKE
flightTime = rnd * 2 + 0.8 
camTime = flightTime - 0.5
if camTime < 0.2 then camTime = 0.2

// ZUFALLSGENERATOR (Zielberechnung)
targetX = (xFieldMin - 1) + rnd * ((xFieldMax + 1) - (xFieldMin - 1))
targetZ = (zFieldMin - 2) + rnd * ((zFieldMax + 2) - (zFieldMin - 2))

// --- TOR-NETZ BEGRENZUNG (Clamping) ---
if targetX >= goalXMin and targetX <= goalXMax then
	if targetZ < zNetBottom then
		targetZ = zNetBottom + (rnd * 0.3)
	end if
	if targetZ > zNetTop then
		targetZ = zNetTop - (rnd * 0.3)
	end if
end if

// Datenstrings vorbereiten
sBallMove = [targetX, yBall, targetZ, flightTime].join(",")
sTriggerMove = [targetX, yTrigger, targetZ, flightTime].join(",")
sBallRot = [rnd * 360, rnd * 360, rnd * 360, flightTime].join(",")

// ========================================================
// HILFSFUNKTIONEN
// ========================================================
triggerSound = function(name)
	networkCommand name, "scaleObject", "100, 100, 100, 0.001"
	wait 0.001
	networkCommand name, "scaleObject", "1, 1, 1, 0.001"
end function

getRandomMsg = function(headers, details)
	return headers[floor(rnd * headers.len)] + " " + details[floor(rnd * details.len)]
end function

setCam = function(posX, posY, posZ, rotX, rotY, rotZ)
	globals.camPos = [posX, posY, posZ, camTime].join(",")
	globals.camRot = [rotX, rotY, rotZ, camTime].join(",")
end function

// ========================================================
// 2. PHYSISCHE BEWEGUNG (Der Schuss)
// ========================================================
networkCommand "ball", "moveObject", sBallMove
networkCommand "ball", "rotateObject", sBallRot
networkCommand "ball_trigger", "moveObject", sTriggerMove
networkCommand "ball_orb(1)", "moveObject", sBallMove

triggerSound "ballSound_trigger"
triggerSound "ballRoll_trigger"

// ========================================================
// 3. LOGIK-PRÜFUNG
// ========================================================
isGoal = 0
isOut = 0
isCorner = 0
whichGoal = 0

inGoalRange = (targetX >= goalXMin and targetX <= goalXMax)
isZBoundary = (targetZ < zFieldMin or targetZ > zFieldMax)

if isZBoundary then
	if inGoalRange then
		isGoal = 1
		if targetZ > -200 then
			whichGoal = 2 
		else 
			whichGoal = 1
		end if
	else
		isOut = 1
		if rnd > 0.7 then 
			isCorner = 1
		end if
	end if
else if targetX < xFieldMin or targetX > xFieldMax then
	isOut = 1
end if

// ========================================================
// 4. EREIGNIS-BEHANDLUNG
// ========================================================
msg = ""

if isGoal then
	hGoal = ["TOOOOR!", "Was für ein Hammer!", "Unfassbar!", "Weltklasse!", "Direkt in den Winkel!"]
	dGoal = ["Was für ein Schuss!", "Der Torwart war machtlos.", "Einfach nur genial.", "Traumtor!"]
	msg = getRandomMsg(hGoal, dGoal)

	triggerSound "Goal" + str(whichGoal) + "Sound_trigger"
	customAvatarAnim "25", "oneshot"
	
	wait flightTime + 0.1
	makeNPC "woman_referee", 2, 5, "", msg, msg, msg, msg, msg, "random", "1", "false", "playerAnimCube", "true"
	
else if isOut then
	triggerSound "offsiteSound_trigger"

	if isZBoundary then
		if isCorner then
			hOut = ["Ecke!", "Abgefälscht!", "Eckball!"]
			dOut = ["Der Verteidiger war noch dran.", "Das gibt eine Ecke.", "Chance für einen Standard!"]
		else
			hOut = ["Abstoß!", "Toraus!", "Knapp am Pfosten vorbei!"]
			dOut = ["Das war eng.", "Nächstes Mal mehr Zielwasser.", "Fast ein Treffer!"]
		end if
	else
		hOut = ["Seitenaus!", "Einwurf!", "Ball im Aus!"]
		dOut = ["Da fehlt die Präzision.", "Wieder im Spiel aufbauen.", "Konzentration!"]
	end if
	msg = getRandomMsg(hOut, dOut)

	// WARTE BIS BALL ANGEKOMMEN IST
	wait flightTime + 0.2

	if isZBoundary then
		if isCorner then
			cx = -108.5
			if targetX > -100 then cx = -91.5
			cz = -212.5
			if targetZ > -200 then cz = -187.5
			
			targetPosBall = [cx, yBall, cz, 1.0].join(",")
			targetPosTrigger = [cx, yTrigger, cz, 1.0].join(",")
		else
			cz = -208
			if targetZ > -200 then cz = -191
			
			targetPosBall = [-100, yBall, cz, 1.0].join(",")
			targetPosTrigger = [-100, yTrigger, cz, 1.0].join(",")
		end if
		
		networkCommand "ball", "moveObject", targetPosBall
		networkCommand "ball_orb(1)", "moveObject", targetPosBall
		networkCommand "ball_trigger", "moveObject", targetPosTrigger
	end if

	refX = targetX + (rnd * 2 - 1)
	if refX < -110 then refX = -110
	if refX > -89 then refX = -89
	sRefData = [refX, 0.0, targetZ, 1.5].join(",")
	
	networkCommand "woman_referee", "moveObject", sRefData
	networkCommand "woman_referee", "rotateObject", "0, " + str(rnd * 360) + ", 0, 0.1"
	
	wait 1.6
	makeNPC "woman_referee", 2, 5, "", msg, msg, msg, msg, msg, "random", "2", "false", "playerAnimCube", "true"

else
	if rnd < 0.25 then
		hField = ["Guter Schuss!", "Im Spiel!", "Weiter geht's!"]
		dField = ["Schöner Ball.", "Der bleibt heiß!", "Gute Technik."]
		msg = getRandomMsg(hField, dField)
		
		wait flightTime + 0.1
		makeNPC "woman_referee", 2, 5, "", msg, msg, msg, msg, msg, "random", "3", "false", "playerAnimCube", "true"
	end if
end if

// ========================================================
// 5. KAMERA-LOGIK
// ========================================================
rndCam = floor(rnd * 3) 
if isGoal then
	rndCam = 3 
else if isCorner then
	rndCam = 4
else if isOut and isZBoundary then
	rndCam = 1 + floor(rnd * 2)
end if

if rndCam == 0 then
	setCam -80, 15, -200, 25, 270, 0
else if rndCam == 1 then
	setCam targetX + 10, 2, targetZ, 0, 270, 0
else if rndCam == 2 then
	zOff = 10
	if isOut and isZBoundary then zOff = 15
	setCam targetX + 5, 5, targetZ + zOff, 15, 210, 0
else if rndCam == 3 then
	if whichGoal == 1 then
		setCam -100, 2, -205, 10, 180, 0
	else
		setCam -100, 2, -195, 10, 0, 0
	end if
else
	cx = -108.5
	if targetX > -100 then cx = -91.5
	cz = -212.5
	if targetZ > -200 then cz = -187.5
	setCam cx + 4, 3, cz + 4, 20, 225, 0
end if

networkCommand "MainCamera", "moveObject", camPos
networkCommand "MainCamera", "rotateObject", camRot