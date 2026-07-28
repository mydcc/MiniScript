jetskiObject = "jetski"
standObject = "jetski_stand"

removeCollider jetskiObject

baseY = 1
amplitude = 0.2
frequency = 1
shakeAmplitude = 2

while true
    verticalMovement = sin(time * frequency)
    y = baseY + amplitude * verticalMovement
    
    moveObject jetskiObject, 42, y, 2
    moveObject standObject, 41.8, y - 0.2, 3
    
    angle = shakeAmplitude * sin(time * frequency * 2)
    
    rotateObject jetskiObject, angle, 76, -angle
    rotateObject standObject, angle, 76, -angle
    
    wait 0.01
end while

/////////

yachtObject = "yacht"
actionObject1 = "action1"
actionObject2 = "action2"

baseY = 12.0
amplitude = 0.2
frequency = 0.5
shakeAmplitude = 1.0

while true
    verticalWave = sin(time * frequency)
    yachtY = baseY + amplitude * verticalWave
    actionY = yachtY - 5.0
    
    angle = shakeAmplitude * sin(time * frequency * 2.0)
    
    moveObject yachtObject, 64, yachtY, 12
    moveObject actionObject1, 60, actionY, 4
    moveObject actionObject2, 58, actionY, 2.5
    
    rotateObject yachtObject, angle, 222, -angle
    rotateObject actionObject1, angle, 90, -angle
    rotateObject actionObject2, angle, 90, -angle
    
    wait 0.01
end while