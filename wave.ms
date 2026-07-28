numCubes = 100
cubeBaseName = "Cube"
cubeScale = 0.25 // Uniform scaling for all cubes

// Grid parameters
gridSizeX = 10   // Number of cubes along X-axis
gridSizeZ = 10   // Number of cubes along Z-axis
spacing = 0.5    // Spacing between cubes in the grid

// Wave parameters
waveAmplitude = 1.0 // Maximum height of the wave
waveFrequency = 0.8 // How dense the waves are (higher value = more waves)
waveSpeed = 2.0     // Speed at which the wave propagates
waveDirectionX = 1.0 // X-component of wave propagation direction (e.g., 1 for along X)
waveDirectionZ = 0.0 // Z-component of wave propagation direction (e.g., 0 for no Z-component)
gridBaseY = 0.5     // Base Y-position of the grid

cubeNames = []
for i in range(1, numCubes)
    cubeNames.push(cubeBaseName + i)
end for

// Initial scaling of all cubes
for i in range(0, numCubes - 1)
    currentCubeName = cubeNames[i]
    scaleObject currentCubeName, cubeScale, cubeScale, cubeScale
end for

// Main animation loop for the 3D grid w...me = cubeNames[i]

        // Calculate row and column in the grid
        row = floor(i / gridSizeX)
        col = i % gridSizeX

        // Calculate base X and Z positions for the grid (centered around 0,0)
        basePosX = (col - (gridSizeX - 1) / 2) * spacing
        basePosZ = (row - (gridSizeZ - 1) / 2) * spacing

        // Calculate the position along the wave direction
        // This determines where the cube is in the wave cycle
        wavePos = (basePosX * waveDirectionX + basePosZ * waveDirectionZ) * waveFrequency

        // Calculate the Y-offset for the wave movement
        // sin() creates the wave shape, currentTime makes it propagate
        waveYOffset = waveAmplitude * sin(wavePos + currentTime * waveSpeed)

        // Set the new position of the cube
        // X and Z are fixed grid positions, Y is dynamically adjusted by the wave
        moveObject currentCubeName, basePosX, gridBaseY + waveYOffset, basePosZ
    end for
    wait 0.001
    // yield
end while
