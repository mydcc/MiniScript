n = 1000
radius = 5
goldenAngle = pi * (3 - sqrt(5))

for i in range(0, n - 1)
    y = 1 - (i / (n - 1)) * 2
    radiusAtY = sqrt(1 - y*y)
    
    theta = goldenAngle * i
    
    x = cos(theta) * radiusAtY
    z = sin(theta) * radiusAtY
    
    xPos = x * radius
    yPos = y * radius
    zPos = z * radius
    
    objName = "Cube(" + (i + 1) + ")"
    moveObject objName, xPos, yPos, zPos
    scaleObject objName, 0.2, 0.2, 0.2
end for
