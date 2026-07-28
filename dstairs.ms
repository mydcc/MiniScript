numCubes = 100
cubeBaseName = "Cube"

totalStaircaseHeight = 2.0
totalStaircaseWidth = 1.0
numSteps = 10

staircaseCenterX = 0
staircaseCenterY = 0
staircaseCenterZ = 0

cubeScaleY = totalStaircaseHeight / numSteps
if cubeScaleY <= 0 then cubeScaleY = 0.01

cubesInXPerStep = 5
if cubesInXPerStep < 1 then cubesInXPerStep = 1

cubeScaleX = totalStaircaseWidth / cubesInXPerStep
if cubeScaleX <= 0 then cubeScaleX = 0.01

cubesInYPerStep = 1

cubesPerLayer = cubesInXPerStep * cubesInYPerStep
cubesInZPerStep = floor(numCubes / (numSteps * cubesPerLayer))
if cubesInZPerStep < 1 then cubesInZPerStep = 1

cubeScaleZ = cubeScaleY

spacingX = cubeScaleX
spacingY = cubeScaleY
spacingZ = cubeScaleZ

cubeNames = []
for i in range(1, numCubes)
    cubeNames.push(cubeBaseName + i)
end for

for i in range(0, numCubes - 1)
    currentCubeName = cubeNames[i]
    scaleObject currentCubeName, cubeScaleX, cubeScaleY, cubeScaleZ
end for

for i in range(0, numCubes - 1)
    currentCubeName = cubeNames[i]

    cubesPerConceptualStep = cubesInXPerStep * cubesInYPerStep * cubesInZPerStep
    if cubesPerConceptualStep == 0 then cubesPerConceptualStep = 1

    stepIndex = floor(i / cubesPerConceptualStep)

    cubeIndexInConceptualStep = i % cubesPerConceptualStep

    zInConceptualStep = floor(cubeIndexInConceptualStep / (cubesInXPerStep * cubesInYPerStep))
    remainingInConceptualStep = cubeIndexInConceptualStep % (cubesInXPerStep * cubesInYPerStep)
    yInConceptualStep = floor(remainingInConceptualStep / cubesInXPerStep)
    xInConceptualStep = remainingInConceptualStep % cubesInXPerStep

    finalPosX = staircaseCenterX + (xInConceptualStep - (cubesInXPerStep - 1) / 2) * spacingX

    finalPosY = staircaseCenterY + (stepIndex * cubeScaleY) + (yInConceptualStep * spacingY) + (cubeScaleY / 2)

    finalPosZ = staircaseCenterZ + (stepIndex * (cubesInZPerStep * cubeScaleZ)) + (zInConceptualStep * spacingZ) + (cubeScaleZ / 2)

    moveObject currentCubeName, finalPosX, finalPosY, finalPosZ
end for
