// -----------------------------------------------------------
// CONFIGURATION
// -----------------------------------------------------------
startPos = [220, 0, -720]
targetHeight = 1500   
horizontalDrift = -720 // right (Gravity Turn)
rocketName1 = "fusion"
rocketName2 = "rocket_orb"
dt = 0.01

// -----------------------------------------------------------
// PHYSICS FUNCTIONS
// -----------------------------------------------------------

// Calculates position based on time t (0.0 to 1.0)
// Implements a 'Gravity Turn': vertical first, then curving
getTrajectory = function(t, start, h, d)
	// Y-Axis: Quadratic acceleration (t^2) simulates constant thrust fighting gravity
	// Replaced ^ with direct multiplication to avoid string parsing issues
	accelY = t * t 
	
	// X-Axis: Quartic acceleration (t^4) starts SLOWER than Y.
	// This ensures the rocket goes up first, then starts drifting later.
	// Calculated as t * t * t * t
	accelX = t * t * t * t
	
	newY = h * accelY
	newX = start[0] + (d * accelX)
	
	// Vibration: High frequency noise causing 'shuddering' at launch
	// Modified formula as requested: Starts at 0 and increases slightly
	shakeIntensity = 0.1 * (0 - t)
	shake = (rnd - 0.5) * shakeIntensity
	
	return [newX + shake, newY, start[2] + shake]
end function

// Calculates the rotation angle based on movement vector
// This ensures the rocket points exactly where it is flying
getAngle = function(dx, dy)
	// atan returns radians, we convert to degrees: rad * (180/pi)
	// We invert the result (-) because positive rotation is usually left/CCW
	return -atan(dx, dy) * (180 / pi)
end function

// -----------------------------------------------------------
// MAIN LOOP
// -----------------------------------------------------------

t = 0
// We need to track previous position to calculate rotation vector
lastX = startPos[0]
lastY = 0

while t < 1
	// 1. Calculate new position
	pos = getTrajectory(t, startPos, targetHeight, horizontalDrift)
	currX = pos[0]
	currY = pos[1]
	
	// 2. Calculate Rotation based on Flight Path Vector
	// We only rotate if we have moved vertically to avoid division by zero or jitter at start
	if currY > 1 then
		deltaX = currX - lastX
		deltaY = currY - lastY
		// Calculate angle and apply rotation around Z axis
		flightAngle = getAngle(deltaX, deltaY)
		rotateObject rocketName1, 0, 0, flightAngle
		rotateObject rocketName2, 0, 0, flightAngle
	end if

	// 3. Apply Movement
	moveObject rocketName1, currX, currY, pos[2]
	moveObject rocketName2, currX, currY, pos[2]
	
	// 4. Update history for next frame
	lastX = currX
	lastY = currY
	
	wait dt
	
	// Increment time (acceleration is handled by the getTrajectory formulas)
	t = t + 0.005 
end while

// -----------------------------------------------------------
// RESET
// -----------------------------------------------------------
wait 2
// Reset position and rotation for the next run
moveObject rocketName1, startPos[0], startPos[1], startPos[2]
moveObject rocketName2, startPos[0], startPos[1], startPos[2]
rotateObject rocketName1, 0, 0, 0
rotateObject rocketName2, 0, 0, 0