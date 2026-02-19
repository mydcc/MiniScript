networkCommand "Name", "moveObject", "1, 1, 1, 1"
networkCommand "Name", "scaleObject", "1, 1, 1, 1"
networkCommand "Name", "rotateObject", "1, 1, 1, 1"

networkCommand "Name", "changeTexture", "https://metaverse.my-domain.com/my-content/"

networkCommand "Name", "moveObject", "1, 1, 1, 1"


//

object1 = "videoBall1"

x = 52
y = 1.2
z = -7

amplitude = 0.1
frequency = 0.1 

playVideo "videoBall1", "https://metaverse.my-domain.com/my-content/video/sphere_video6.mp4", "loop", 0

while true
r = round(rnd*1)
rotateObject "videoBall6", (time*5)*2, (time*15)*2, time*35

newY = y + amplitude * 1/cos(frequency * time)
newX = x + amplitude * 1/sin(frequency * time)

moveObject object1, newX, newY, z

moveObject object2, newX, newY, z
moveObject object3, newX -0.2, newY - .66, newY + 0.2

wait 0.01
if time > 60 then break
end while


networkCommand "button_hall-1", "moveObject", "50.2, 2.7, 7.6, 1"
networkCommand "button_hall-2", "moveObject", "50.8, 2.7, 7.6, 1"
networkCommand "button_soccer-field", "moveObject", "51.4, 2.7, 7.6, 1"
networkCommand "button_tennis-court", "moveObject", "52.6, 2.7, 7.6, 1"
networkCommand "button_hall-1", "scaleObject", "0.454, 0.198, 0.1, 1"
networkCommand "button_hall-2", "scaleObject", "0.468, 0.198, 0.1, 1"
networkCommand "button_soccer-field", "scaleObject", "0.796, 0.198, 0.1, 1"
networkCommand "button_tennis-court", "scaleObject", "0.858, 0.198, 0.1, 1"


wait 2

networkCommand "button_hall-1", "moveObject", "49.4, 2.7, 7.6, 1"
networkCommand "button_hall-2", "moveObject", "49.4, 2.7, 7.6, 1"
networkCommand "button_soccer-field", "moveObject", "49.4, 2.7, 7.6, 1"
networkCommand "button_tennis-court", "moveObject", "49.4, 2.7, 7.6, 1"
networkCommand "button_hall-1", "scaleObject", "0.001, 0.001, 0.001, 1"
networkCommand "button_hall-2", "scaleObject", "0.001, 0.001, 0.001, 1"
networkCommand "button_soccer-field", "scaleObject", "0.001, 0.001, 0.001, 1"
networkCommand "button_tennis-court", "scaleObject", "0.001, 0.001, 0.001, 1"


/// Nav Menu
navOpen = function()

object1 = "button_hall-1"
object2 = "button_hall-2"
object3 = "button_soccer-field"
object4 = "button_tennis-court"

x = 49.4
y = 2.7
z = 7.6
sx = 0.454
sy = 0.198
sz = 0.1

for i in range(0, 1, 0.01)
moveObject object4, x + i + 2.4, y , z
scaleObject object4, sx + 0.404, sy, sz
end for

for i in range(0,1, 0.01)
    moveObject object3, x + i + 1.4, y , z
    scaleObject object3, sx + 0.338, sy, sz
end for

for i in range(0, 1, 0.01)
    moveObject object2, x + i + 0.6, y , z
    scaleObject object2, sx + 0.14, sy, sz
end for
    
for i in range(0, 1, 0.01)
    moveObject object1, x + i, y , z
    scaleObject object1, sx, sy, sz
end for

end function

navClose = function()

object1 = "button_hall-1"
object2 = "button_hall-2"
object3 = "button_soccer-field"
object4 = "button_tennis-court"

x = 49.4
y = 2.7
z = 7.6
sx = 0.01
sy = 0.01
sz = 0.01


for j in range (10)
    r = round(rnd*3)
    if r == 0 then
        for i in range(0, 1, 0.01)
        moveObject object1, x - i, y , z
        scaleObject object1, sx, sy, sz
        end for
    else if r == 1 then
        for i in range(0, 1, 0.01)
            moveObject object2, x - i + 0.6, y , z
            scaleObject object2, sx, sy, sz
        end for
    else if r == 2 then
        for i in range(0,1, 0.01)
            moveObject object3, x - i + 1.4, y , z
            scaleObject object3, sx, sy, sz
        end for
    else if r == 3 then
        for i in range(0, 1, 0.01)
            moveObject object4, x + i + 2.4, y , z
            scaleObject object4, sx, sy, sz
        end for
    end if
end for
end function

random = (rnd)
if random >0.2 then
    navOpen
else if random < 0.2 then
    navClose
end if