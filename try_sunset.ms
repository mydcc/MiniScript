radius = 100
frames = 96

sunColors = {
    0: "#040C2C",
    4: "#58506E",
    8: "#B2AAAE",
    12: "#FFE4C6",
    16: "#FFFACD",
    24: "#FFFFE0",
    32: "#FFFAF0",
    40: "#FFF8DC",
    48: "#FFEBCD",
    56: "#FFDEAD",
    64: "#F0E68C",
    72: "#FFB6C1",
    80: "#6A5ACD",
    95: "#000000"}

startTime = 0
endTime = 24
timeStep = 0.04
totalFrames = (endTime - startTime) / timeStep
angleStep = 1200 / totalFrames

getSunColor = function(step)
    step = step % frames
    closestStep = null
    for s in sunColors.indexes
        if closestStep == null or abs(s - step) < abs(closestStep - step) then
            closestStep = s
        end if
    end for
    return sunColors[closestStep]
end function

for frame in range(0, totalFrames,1)
    i = startTime + frame * timeStep
    angle = (i - startTime) * angleStep
    rotationY = - angle / 4
    rotationX = 90 - angle
    rotateObject "SunLight", rotationX, rotationY, 0
    currentColor = getSunColor(frame % frames)
    setLightObject "SunLight", "#FDFDB3", 1, "soft", 0.6
    wait 0.001
end for