numCubes = 100
cubeBaseName = "Cube"
cubeScale = 0.25 // Uniform scaling for all cubes

// Dimensions of the larger cuboid made of smaller cubes
cuboidDimX = 4 // Number of cubes along X-axis
cuboidDimY = 5 // Number of cubes along Y-axis
cuboidDimZ = 5 // Number of cubes along Z-axis

// Ensure total cubes match the cuboid dimensions
// if cuboidDimX * cuboidDimY * cuboidDimZ != numCubes then
//     // This check is important if you want exact matching
//     // For this script, we assume numCubes = 100 and 4x5x5
// end if

// Spacing between individual cubes in the cuboid
spacing = cubeScale + 0.01 // Small gap between cubes

// Center position of the entire cuboid
centerPosX = 0
centerPosY = cubeScale / 2 // Place on the ground if cuboidDimY is odd, or slightly above
centerPosZ = 0

cubeNames = []
for i in range(1, numCubes)
    cubeNames.push(cubeBaseName + i)
end for

// Initial scaling of all cubes
for i in range(0, numCubes - 1)
    currentCubeName = cubeNames[i]
    scaleObject currentCubeName, cubeScale, cubeScale, cubeScale
end for

// Arrange cubes in a 3D grid (cuboid)
for i in range(0, numCubes - 1)
    currentCubeName = cubeNames[i]

    // Calculate 3D index (x, y, z) for the current cube
    // The order of dimensions matters for consistent indexing
    zIdx = floor(i / (cuboidDimX * cuboidDimY))
    remaining = i % (cuboidDimX * cuboidDimY)
    yIdx = floor(remaining / cuboidDimX)
    xIdx = remaining % cuboidDimX

    // Calculate position based on index and spacing
    // Subtract half of the total dimension to center the cuboid around (centerPosX, centerPosY, centerPosZ)
    posX = centerPosX + (xIdx - (cuboidDimX - 1) / 2) * spacing
    posY = centerPosY + (yIdx - (cuboidDimY - 1) / 2) * spacing
    posZ = centerPosZ + (zIdx - (cuboidDimZ - 1) / 2) * spacing

    moveObject currentCubeName, posX, posY, posZ
end for

// This is a static formation, so no animation loop is needed.
// If you wanted to animate its rotation or movement, you would add a while true loop here.
