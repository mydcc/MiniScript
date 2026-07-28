numCubes = 100
cubeBaseName = "Cube"
cubeScale = 0.25 // Uniform scaling for all cubes

// Grid Parameters (Start/End Position)
gridSize = 10 // 10x10 Grid
initialSpacing = 0.5 // Spacing between cubes in the grid
gridYPos = 0.5 // Fixed Y-position of the grid

// Sphere Parameters (Target Formation)
sphereRadius = 4 // Radius of the sphere formation
sphereYPos = 2   // Y-position of the sphere formation

// Animation Parameters
animationDuration = 5 // Duration of an animation phase (Grid to Sphere or Sphere to Grid)
animationSpeed = 1    // Overall animation speed

cubeNames = []
for i in range(1, numCubes)
    cubeNames.push(cubeBaseName + i)
end for

// Initial scaling of all cubes
for i in range(0, numCubes - 1)
    currentCubeName = cubeNames[i]
    scaleObject currentCubeName, cubeScale, cubeScale, cubeScale
end for

// Main animation loop for the sphere formation
while true
    currentTime = time

    // Phase Calculation: Switch between Grid -> Sphere and Sphere -> Grid
    // Modulo 2 * animationDuration to divide time into phases
    phaseTime = currentTime * animationSpeed % (2 * animationDuration)

    // Interpolation factor (from 0 to 1 and back)
    // If phaseTime < animationDuration: Grid to Sphere (factor from 0 to 1)
    // If phaseTime >= animationDuration: Sphere to Grid (factor from 1 to 0)
    interpFactor = 0
    if phaseTime < animationDuration then
        interpFactor = phaseTime / animationDuration
    else
        interpFactor = 1 - ((phaseTime - animationDuration) / animationDuration)
    end if

    for i in range(0, numCubes - 1)
        currentCubeName = cubeNames[i]

        // 1. Grid Start Position (independent of expansion)
        row = floor(i / gridSize)
        col = i % gridSize
        gridPosX = (col - (gridSize - 1) / 2) * initialSpacing
        gridPosZ = (row - (gridSize - 1) / 2) * initialSpacing

        // 2. Sphere Target Position
        // Even distribution of cubes on a sphere surface
        // (Approximation: Fibonacci grid or spiral arrangement on sphere)
        // Here, a simple spiral arrangement for 100 points on a sphere
        goldenAngle = pi * (3 - sqrt(5)) // Golden angle in radians
        y = 1 - (i / (numCubes - 1)) * 2 // Y from 1 to -1
        radiusAtY = sqrt(1 - y*y) * sphereRadius
        angle = goldenAngle * i

        spherePosX = radiusAtY * cos(angle)
        spherePosY = y * sphereRadius
        spherePosZ = radiusAtY * sin(angle)

        // Interpolation between grid and sphere position
        // lerp = linear interpolation
        finalPosX = gridPosX * (1 - interpFactor) + spherePosX * interpFactor
        finalPosY = gridYPos * (1 - interpFactor) + spherePosY * interpFactor
        finalPosZ = gridPosZ * (1 - interpFactor) + spherePosZ * interpFactor

        moveObject currentCubeName, finalPosX, finalPosY, finalPosZ
    end for

    // yield // This statement remains removed, as requested
end while
