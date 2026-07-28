numCubes = 100
cubeBaseName = "Cube"
cubeScale = 0.25 // Uniform scaling for all cubes

// Explosion/Implosion parameters
centerPosX = 0         // X-position of the central point
centerPosY = 2         // Y-position of the central point
centerPosZ = 0         // Z-position of the central point
maxExplosionDistance = 8 // Maximum distance cubes spread from the center
animationDuration = 3  // Duration of one phase (explode or implode)
animationSpeed = 1     // Overall animation speed
totalCycleDuration = 5 * animationDuration // Total duration of a cycle (explode->implode)

cubeNames = []
for i in range(1, numCubes)
    cubeNames.push(cubeBaseName + i)
end for

// List to store unique random directions for each cube
explosionDirections = []

// Initial scaling of all cubes and calculation of static explosion directions
for i in range(0, numCubes - 1)
    currentCubeName = cubeNames[i]
    scaleObject currentCubeName, cubeScale, cubeScale, cubeScale

    // Generate a random direction ...or = 0
    if phaseTime < animationDuration then
        // Phase 1: Explode (interpFactor from 0 to 1)
        interpFactor = phaseTime / animationDuration
    else
        // Phase 2: Implode (interpFactor from 1 to 0)
        interpFactor = 1 - ((phaseTime - animationDuration) / animationDuration)
    end if

    for i in range(0, numCubes - 1)
        currentCubeName = cubeNames[i]
        currentDirection = explosionDirections[i]

        // Calculate current distance from center based on interpFactor
        currentDistance = maxExplosionDistance * interpFactor

        // Calculate final position by moving along the random direction from the center
        finalPosX = centerPosX + currentDirection[0] * currentDistance
        finalPosY = centerPosY + currentDirection[1] * currentDistance // This is line 66
        finalPosZ = centerPosZ + currentDirection[2] * currentDistance

        moveObject currentCubeName, finalPosX, finalPosY, finalPosZ
    end for

    yield
end while
