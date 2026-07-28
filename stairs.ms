numCubes = 100
cubeBaseName = "Cube"
cubeScale = 0.25 // Uniform scaling for all cubes

// Staircase parameters
staircaseCenterX = 0 // X-position of the staircase center
staircaseCenterY = 0 // Y-position of the staircase base (ground)
staircaseCenterZ = 0 // Z-position of the staircase center

cubesPerStepWidth = 10 // Number of cubes per step width
cubesPerStepDepth = 1 // Number of cubes per step depth
singleCubeWidthMode = false // NEW PARAMETER: If true, each step will be only 1 cube wide, regardless of cubesPerStepWidth

// Calculations based on parameters
cubesPerStep = cubesPerStepWidth * cubesPerStepDepth // Number of cubes per step
numSteps = numCubes / cubesPerStep // Total number of steps

// Check if the number of cubes fits the staircase structure
if numCubes % cubesPerStep != 0 then
    zInStep = floor(cubeIndexInStep / cubesPerStepWidth)

    // Calculate the final X-position of the cube
    // Center the width of the step around staircaseCenterX
    finalPosX = staircaseCenterX + (xInStep - (effectiveStepWidth - 1) / 2) * spacing

    // Calculate the final Y-position of the cube
    // Each step rises by stepHeightUnit, and the cube is lifted to its center
    finalPosY = staircaseCenterY + (stepIndex * stepHeightUnit) + (cubeScale / 2)

    // Calculate the final Z-position of the cube
    // Each step moves forward by stepDepthUnit, and cubes are placed within the depth
    // Center the depth of the step around staircaseCenterZ
    finalPosZ = staircaseCenterZ + (stepIndex * stepDepthUnit) + (zInStep - (cubesPerStepDepth - 1) / 2) * spacing

    // Move the cube to its calculated position
    moveObject currentCubeName, finalPosX, finalPosY, finalPosZ
end for
