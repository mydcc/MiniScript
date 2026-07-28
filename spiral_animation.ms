numCubes = 100
cubeBaseName = "Cube"
cubeScale = 0.025 // Uniform scaling for all cubes

// Sphere formation parameters
sphereRadius = 1         // Radius of the sphere formation
sphereCenterX = 0        // X-position of the sphere's center
sphereCenterY = 2        // Y-position of the sphere's center
sphereCenterZ = 0        // Z-position of the sphere's center

// Rotation parameters for the entire sphere
rotationSpeedX = rnd     // Rotation speed around X-axis (radians per second)
rotationSpeedY = rnd*1.3     // Rotation speed around Y-axis (radians per second)
rotationSpeedZ = rnd*2    // Rotation speed around Z-axis (radians per second)

// Store initial positions on the sphere for each cube (relative to sphere center)
// These positions will then be rotated.
initialSpherePositions = []

cubeNames = []
for i in range(1, numCubes)
    cubeNames.push(cubeBaseName + i)
end for

// Calculate initial positions for all cubes on the sphere surface
// Using a spiral distribution method f...tters: Z-Y-X typically)
        // For simplicity, we'll apply rotations sequentially.
        // Rotation around X-axis (pitch)
        tempY = relY * cos(totalRotX) - relZ * sin(totalRotX)
        tempZ = relY * sin(totalRotX) + relZ * cos(totalRotX)
        relY = tempY
        relZ = tempZ

        // Rotation around Y-axis (yaw)
        tempX = relX * cos(totalRotY) + relZ * sin(totalRotY)
        tempZ = -relX * sin(totalRotY) + relZ * cos(totalRotY)
        relX = tempX
        relZ = tempZ

        // Rotation around Z-axis (roll)
        tempX = relX * cos(totalRotZ) - relY * sin(totalRotZ)
        tempY = relX * sin(totalRotZ) + relY * cos(totalRotZ)
        relX = tempX
        relY = tempY

        // Calculate final world position by adding sphere center
        finalPosX = sphereCenterX + relX
        finalPosY = sphereCenterY + relY
        finalPosZ = sphereCenterZ + relZ

        moveObject currentCubeName, finalPosX, finalPosY, finalPosZ
        yield
    end for
end while
