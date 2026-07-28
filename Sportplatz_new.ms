// ball-Code

y = 0.15
yb = 0.115
yballSpot = 4
xMin = -10
xMax = 10
zMin = -14
zMax = 14

rx = rnd * 360
ry = rnd * 360
rz = rnd * 360
t = rnd * 3 + 0.5
t2 = t - 0.5
x = xMin + rnd * (xMax - xMin)
z = zMin + rnd * (zMax - zMin)

sData = "" + x + "," + y + "," + z + "," + t
sDataB = "" + x + "," + yb + "," + z + "," + t
sDataBJump = "" + x + "," + yb + "," + z + "," + 0.1
rData = "" + rx + "," + ry + "," + rz + "," + t
networkCommand "ballSound_trigger", "scaleObject", "100, 100, 100, 0.001"
networkCommand "ballRoll_trigger", "scaleObject", "100, 100, 100, 0.001"
wait 0.001
networkCommand "ballSound_trigger", "scaleObject", "1, 1, 1, 0.001"
networkCommand "ballRoll_trigger", "scaleObject", "1, 1, 1, 0.001"

networkCommand "ball", "moveObject", sData
networkCommand "ball_trigger", "moveObject", sDataB

rndRotCam = round(rnd * 3)
if rndRotCam == 0 then
	xcam1 = x + 5
	ycam1 = 2
	zcam1 = z
	poscam1 = "" + xcam1 + "," + ycam1 + "," + zcam1 + "," + t2
	rotcam1 = "" + 10 + "," + 270 + "," + 0 + "," + t2
else if rndRotCam == 1 then
	xcam1 = x
	ycam1 = 2
	zcam1 = z + 5
	poscam1 = "" + xcam1 + "," + ycam1 + "," + zcam1 + "," + t2
	rotcam1 = "" + 10 + "," + 180 + "," + 0 + "," + t2
else if rndRotCam == 2 then
	xcam1 = x - 5
	ycam1 = 2
	zcam1 = z
	poscam1 = "" + xcam1 + "," + ycam1 + "," + zcam1 + "," + t2
	rotcam1 = "" + 10 + "," + 90 + "," + 0 + "," + t2
else if rndRotCam == 3 then
	xcam1 = x
	ycam1 = 2
	zcam1 = z - 5
	poscam1 = "" + xcam1 + "," + ycam1 + "," + zcam1 + "," + t2
	rotcam1 = "" + 10 + "," + 0 + "," + 0 + "," + t2
end if

networkCommand "cam1", "moveObject", poscam1
networkCommand "cam1", "rotateObject", rotcam1
wait t

if x < -8.75 then
	refereeData = "" + (x - rnd * 0.5) + "," + (0.6) + "," + (z - 1 + rnd * 2) + "," + rnd
	rotaterefereeData = "" + 0 + "," + (240 + rnd * 60) + "," + 0 + "," + 0.1
	networkCommand "woman_referee", "moveObject", refereeData
	networkCommand "woman_referee", "rotateObject", rotaterefereeData
	networkCommand "offsiteSound_trigger", "scaleObject", "100, 100, 100, 0.001"
	wait 0.001
	networkCommand "offsiteSound_trigger", "scaleObject", "1, 1, 1, 0.001"

else if x > 8.75 then
	refereeData = "" + (x - rnd * 0.5) + "," + (0.6) + "," + (z - 1 + rnd * 2) + "," + rnd
	rotaterefereeData = "" + 0 + "," + (60 + rnd * 60) + "," + 0 + "," + 0.1
	networkCommand "woman_referee", "moveObject", refereeData
	networkCommand "woman_referee", "rotateObject", rotaterefereeData
	networkCommand "offsiteSound_trigger", "scaleObject", "100, 100, 100, 0.001"
	wait 0.001
	networkCommand "offsiteSound_trigger", "scaleObject", "1, 1, 1, 0.001"

else if z < -12.75 then
	if x > 1 or x < -1 then
		refereeData = "" + (x - rnd * 0.5) + "," + (0.6) + "," + (z - 1 + rnd * 2) + "," + rnd
		rotaterefereeData = "" + 0 + "," + (150 + rnd * 60) + "," + 0 + "," + 0.1
		networkCommand "woman_referee", "moveObject", refereeData
		networkCommand "woman_referee", "rotateObject", rotaterefereeData
		networkCommand "offsiteSound_trigger", "scaleObject", "100, 100, 100, 0.001"
		wait 0.001
		networkCommand "offsiteSound_trigger", "scaleObject", "1, 1, 1, 0.001"
	else if x < 1 or x > -1 then
		networkCommand "Goal1Sound_trigger", "scaleObject", "100, 100, 100, 0.001"
		wait 0.001
		networkCommand "Goal1Sound_trigger", "scaleObject", "1, 1, 1, 0.001"
	end if
else if z > 12.75 then
	if x > 1 or x < -1 then
		refereeData = "" + (x - rnd * 0.5) + "," + (0.6) + "," + (z - 1 + rnd * 2) + "," + rnd
		rotaterefereeData = "" + 0 + "," + (330 + rnd * 60) + "," + 0 + "," + 0.1
		networkCommand "woman_referee", "moveObject", refereeData
		networkCommand "woman_referee", "rotateObject", rotaterefereeData
		networkCommand "offsiteSound_trigger", "scaleObject", "100, 100, 100, 0.001"
		wait 0.001
		networkCommand "offsiteSound_trigger", "scaleObject", "1, 1, 1, 0.001"
	else if x < 1 or x > -1 then
		networkCommand "Goal2Sound_trigger", "scaleObject", "100, 100, 100, 0.001"
		wait 0.001
		networkCommand "Goal2Sound_trigger", "scaleObject", "1, 1, 1, 0.001"
	end if
end if
// end of ball-Code

// Goal1-Sound Trigger
rx = 0
ry = rnd * 360
rz = 0
scaleObject(
	"referee",
	1,
	1,
	1)
moveObject(
	"referee",
	0 + rnd * 2,
	0,
	-10 + rnd * 2)
rotateObject(
	"referee",
	rx,
	ry,
	rz)
wait 1
r = round(rnd * 1) + 1
url = "https://my-content.chaarmi.org/sounds/referee/whistle-2_" + r + ".mp3"
playAudio(
	"Goal1Sound_trigger",
	url,
	"oneshot",
	1)
wait 5
networkCommand "ball", "moveObject", "0, 0.15, 0, 0.1"
networkCommand "ball_trigger", "moveObject", "0, 0.115, 0, 0.1"
wait 2
scaleObject(
	"referee",
	0,
	0,
	0)
// end of Goal1-Sound Trigger


// Goal2-Sound Trigger
rx = 0
ry = rnd * 360
rz = 0
scaleObject(
	"referee",
	1,
	1,
	1)
moveObject(
	"referee",
	0 + rnd * 2,
	0,
	10 + rnd * 2)
rotateObject(
	"referee",
	rx,
	ry,
	rz)
wait
r = round(rnd * 1) + 1
url = "https://my-content.chaarmi.org/sounds/referee/whistle-2_" + r + ".mp3"
playAudio(
	"Goal2Sound_trigger",
	url,
	"oneshot",
	1)
wait 5
networkCommand "ball", "moveObject", "0, 0.15, 0, 0.1"
networkCommand "ball_trigger", "moveObject", "0, 0.115, 0, 0.1"
wait 2
scaleObject(
	"referee",
	0,
	0,
	0)
// end of Goal2-Sound Trigger

// ballRoll-Trigger-Code
rx = rnd * 360
ry = rnd * 360
rz = rnd * 360
t = rnd * 3 + 0.5
while time <= t
	rotateObject(
		"ball",
		rx * time * t,
		ry * time * t,
		rz * time * t)
	wait 0.01
end while
// end of ballRoll-Trigger-Code

// FastFood-Click-Code
networkCommand "fast_food", "scaleObject", "0.5, 0.5, 0.5, 10"
wait 8
networkCommand "fast_food", "scaleObject", "0, 0, 0, 2"
while time <= 11
	rotateObject(
		"fast_food",
		0,
		time * time * time * 5,
		0)
	wait 0.01
end while
wait 30
networkCommand "fast_food", "scaleObject", "1, 1, 1, 1"
// end of FastFood-Click-Code

// grill_Chicken-Click-Code
object1 = "grill_chicken"
wait 0.2
networkCommand object1, "moveObject", "-16.15, 1.2, 2.6, 1"
wait
r = round(rnd * 50)
playSound r, "oneshot", "2D"
wait 0.2
networkCommand object1, "scaleObject", "0, 0, 0, 0.2"
wait
networkCommand object1, "moveObject", "-16.15, 1.08, 2.6, 1"
wait 10
networkCommand object1, "scaleObject", "0.2, 0.2, 0.2, 4"
// end of grill_Chicken-Click-Code

// breadRoll-Code
object1 = "bread_roll2"
wait 0.2
networkCommand object1, "moveObject", "-15.85, 1.42, 1.48, 1"
wait
r = round(rnd * 50)
playSound r, "oneshot", "2D"
wait 0.2
networkCommand object1, "scaleObject", "0, 0, 0, 0.2"
wait
networkCommand object1, "moveObject", "-15.85, 1.08, 1.48, 1"
wait 10
networkCommand object1, "scaleObject", "0.01, 0.01, 0.01, 4"
// end of breadRoll-Code

// toastbread-Code
object1 = "bread_roll2"
wait 0.2
networkCommand object1, "moveObject", "-15.85, 1.42, 1.48, 1"
wait
r = round(rnd * 50)
playSound r, "oneshot", "2D"
wait 0.2
networkCommand object1, "scaleObject", "0, 0, 0, 0.2"
wait
networkCommand object1, "moveObject", "-15.85, 1.08, 1.48, 1"
wait 10
networkCommand object1, "scaleObject", "0.01, 0.01, 0.01, 4"
// end of toastbread-Code