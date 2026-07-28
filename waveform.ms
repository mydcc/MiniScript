numCubes = 100
cubeBaseName = "Cube"
cubeScale = 0.2
cubeSpacing = 0.1

waveAmplitude = 0.5
waveFrequency = 5
waveSpeed = 2

cubeNames = []
for i in range(1, numCubes)
    cubeNames.push(cubeBaseName + i)
end for

for i in range(0, numCubes - 1)
    currentCubeName = cubeNames[i]
    scaleObject currentCubeName, cubeScale, cubeScale, cubeScale
end for

while true
    currentTime = time

    for i in range(0, numCubes - 1)
        currentCubeName = cubeNames[i]

        basePosX = i * (cubeScale + cubeSpacing)

        waveYOffset = waveAmplitude * sin(basePosX * waveFrequency + currentTime * waveSpeed)

        moveObject currentCubeName, basePosX, waveYOffset, 0
    end for

    yield
end while
