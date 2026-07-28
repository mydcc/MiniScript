numCubes = 100
cubeBaseName = "Cube"
cubeScale = 0.025 // Uniform scaling for all cubes

// Fountain parameters
fountainCenterX = 0      // X-position of the fountain's center
fountainCenterY = 0      // Y-position of the fountain's base
fountainCenterZ = 0      // Z-position of the fountain's center
initialUpwardVelocity = 8 // Initial upward velocity at launch
gravity = 9.8            // Downward acceleration (simulated gravity)
resetHeight = -2         // Y-position below which cubes reset to fountain base
horizontalSpreadFactor = 0.5 // Factor for horizontal launch speed

// Internal state for each cube:
// [launchTime, initialVelX, initialVelY, initialVelZ]
// initialVelY is always initialUpwardVelocity, but included for consistency.
cubeStates = []

// Initialize cube states and place them at the base
for i in range(0, numCubes - 1)
    // Stagger cube launches slightly to avoid synchronicity
    launchTime = -i * 0.05 
    
    // Random horizontal initial velocity for each cub...     
        // Check if cube needs to reset (falls below reset height)
        if newPosY < resetHeight then
            // Reset cube to fountain base
            newPosX = fountainCenterX
            newPosY = fountainCenterY
            newPosZ = fountainCenterZ
            
            // Generate new random horizontal initial velocities for the next jump
            newInitialVelX = (rnd(null) * 2 - 1) * horizontalSpreadFactor * (initialUpwardVelocity / 4)
            newInitialVelZ = (rnd(null) * 2 - 1) * horizontalSpreadFactor * (initialUpwardVelocity / 4)
            
            // Set launch time to current time for the new jump
            launchTime = currentTime
            
            // Update the cube's state
            cubeStates[i] = [launchTime, newInitialVelX, initialVelY, newInitialVelZ]
        end if
        
        // Move the cube to the calculated position
        moveObject currentCubeName, newPosX, newPosY, newPosZ
    end for
//wait 0.0002
end while
