numCubes = 100
cubeBaseName = "Cube"
cubeScale = 0.25 // Uniform scaling for all cubes

// Ring parameters
numRings = 4           // Number of concentric rings
baseRadius = 3         // Radius of the innermost ring
radiusIncrement = 1    // How much the radius increases per ring
ringYSpacing = 1       // Vertical spacing between rings
baseRotationSpeed = 0.5 // Base rotation speed for rings (radians per second)
speedIncrement = 0.2   // How much the rotation speed increases per ring

cubeNames = []
for i in range(1, numCubes)
    cubeNames.push(cubeBaseName + i)
end for

// Initial scaling of all cubes
for i in range(0, numCubes - 1)
    currentCubeName = cubeNames[i]
    scaleObject currentCubeName, cubeScale, cubeScale, cubeScale
end for

// Main animation loop for rotating rings
while true
    currentTime = time

    for i in range(0, numCubes - 1)
        currentCubeName = cubeNames[i]

        // Determine which ring the current cube belongs to
        ringIndex = i % numRings //...o the last ring
        else
            ringIndex = floor(i / cubesPerRing)
        end if
        
        // Calculate ring-specific parameters
        currentRingRadius = baseRadius + ringIndex * radiusIncrement
        currentRingYPos = ringIndex * ringYSpacing
        currentRingRotationSpeed = baseRotationSpeed + ringIndex * speedIncrement

        // Calculate the angle for the current cube within its ring
        // Distribute cubes evenly within their assigned ring
        angleInRing = (i % cubesPerRing) / cubesPerRing * 2 * pi 
        
        // Apply the ring's overall rotation
        effectiveAngle = angleInRing + (currentTime * currentRingRotationSpeed)

        // Calculate X and Z positions on the circle
        posX = currentRingRadius * cos(effectiveAngle)
        posZ = currentRingRadius * sin(effectiveAngle)

        // Move the cube to the calculated position
        moveObject currentCubeName, posX, currentRingYPos, posZ
    end for

    //  yield
end while
