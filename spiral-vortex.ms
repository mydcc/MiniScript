numCubes = 100
cubeBaseName = "Cube"
cubeScale = 0.05 // Uniform scaling for all cubes

// Vortex parameters
vortexCenterX = 0      // X-position of the vortex center
vortexCenterY = 2      // Y-position of the vortex center
vortexCenterZ = 0      // Z-position of the vortex center
initialRadius = 2      // Radius of the outermost part of the spiral
spiralTightness = 0.5  // How quickly the spiral tightens towards the center (higher = tighter)
verticalSpiralHeight = 0.1 // How much the spiral rises/falls per rotation
rotationSpeed = 5    // Speed of the vortex rotation (radians per second)
inOutSpeed = 0.3       // Speed at which cubes move in/out of the vortex (for pulsation)
pulsationAmplitude = 4 // Amplitude of the in/out pulsation

cubeNames = []
for i in range(1, numCubes)
    cubeNames.push(cubeBaseName + i)
end for

// Initial scaling of all cubes
for i in range(0, numCubes - 1)
    currentCubeName = cubeNames[i]
    scaleObject currentCubeName, cubeScale, cubeScale, cubeScale...dius for this cube
        // Spiral gets tighter towards the "end" of the cube list (higher i)
        // Add pulsation for in/out movement
        currentRadius = initialRadius - (i * spiralTightness / numCubes) * initialRadius
        currentRadius = currentRadius + pulsationAmplitude * pulsationFactor // Add pulsation

        // Calculate the effective angle including overall rotation
        effectiveAngle = angleOffset + totalRotation

        // Calculate X and Z positions based on polar coordinates
        finalPosX = vortexCenterX + currentRadius * cos(effectiveAngle)
        finalPosZ = vortexCenterZ + currentRadius * sin(effectiveAngle)

        // Calculate Y position for vertical spiral
        finalPosY = vortexCenterY + (i * verticalSpiralHeight) % (numCubes * verticalSpiralHeight) // Loop vertical position

        // Move the cube to the calculated position
        moveObject currentCubeName, finalPosX, finalPosY, finalPosZ
//yield
    end for
wait 0.0001
end while
