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
for frame in range(0, frames)

    angle = (frame / frames) * 360
    rotationY = angle
    rotationX = sin((frame / frames) * 2 * pi) * 90
    rotateObject "SunLight", rotationX, rotationY, 0
    currentColor = getSunColor(frame)
    setLightObject "Light1", currentColor, 1, "hard", 1
    wait 0.1
end for
