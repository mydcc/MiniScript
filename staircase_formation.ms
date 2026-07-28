numCubes = 100
cubeBaseName = "Cube"

staircaseStartX = 0
staircaseStartY = 0
staircaseStartZ = 0

staircaseEndX = 0
staircaseEndY = 4
staircaseEndZ = 10

staircaseOverallWidth = 1.0

numSteps = 100

effectiveTotalHeight = staircaseEndY - staircaseStartY
effectiveTotalDepth = staircaseEndZ - staircaseStartZ
effectiveTotalWidth = staircaseOverallWidth

// cubeScaleY: Height of individual cubes. Each step is 1 cube high.
cubeScaleY = effectiveTotalHeight / numSteps
if cubeScaleY <= 0 then cubeScaleY = 0.01

// cubesPerConceptualStep: Average number of cubes per step.
cubesPerConceptualStep = floor(numCubes / numSteps)
if cubesPerConceptualStep < 1 then cubesPerConceptualStep = 1

// cubesInXPerStep: How many cubes wide each step is.
cubesInXPerStep = floor(effectiveTotalWidth / cubeScaleY)
if cubesInXPerStep < 1 then cubesInXPerStep = 1

// Adjust cubesInXPerStep to not exceed the average cubes available per step.
if cubesInXPerStep > cubesPerConceptualStep then cubesInXPerStep = cubesPerConceptualStep

// cubesInZPerStep: How many cubes deep each step is.
// Since each step is 1 cube high (cubesInYPerStep is implicitly 1),
// cubesInZPerStep is calculated based on cubesPerConceptualStep and cubesInXPerStep.
cubesInZPerStep = floor(cubesPerConceptualStep / cubesInXPerStep)
if cubesInZPerStep < 1 then cubesInZPerStep = 1

// cubeScaleX: Actual width of individual cubes.
cubeScaleX = effectiveTotalWidth / cubesInXPerStep
if cubeScaleX <= 0 then cubeScaleX = 0.01

// cubeScaleZ: Actual depth of individual cubes.
cubeScaleZ = effectiveTotalDepth / (numSteps * cubesInZPerStep)
if cubeScaleZ <= 0 then cubeScaleZ = 0.01

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

    cubesPerConceptualStepActual = cubesInXPerStep * cubesInZPerStep // Simplified as cubesInYPerStep is implicitly 1
    if cubesPerConceptualStepActual == 0 then cubesPerConceptualStepActual = 1

    stepIndex = floor(i / cubesPerConceptualStepActual)

    cubeIndexInConceptualStep = i % cubesPerConceptualStepActual

    // Calculate 3D index (x, y, z) for the cube within its conceptual step
    zInConceptualStep = floor(cubeIndexInConceptualStep / cubesInXPerStep) // Simplified
    xInConceptualStep = cubeIndexInConceptualStep % cubesInXPerStep       // Simplified
    yInConceptualStep = 0 // Implicitly 0 as each step is 1 cube high

    finalPosX = staircaseStartX + (xInConceptualStep - (cubesInXPerStep - 1) / 2) * spacingX

    finalPosY = staircaseStartY + (stepIndex * cubeScaleY) + (yInConceptualStep * spacingY) + (cubeScaleY / 2)

    finalPosZ = staircaseStartZ + (stepIndex * (cubesInZPerStep * cubeScaleZ)) + (zInConceptualStep * spacingZ) + (cubeScaleZ / 2)

    moveObject currentCubeName, finalPosX, finalPosY, finalPosZ
end for
