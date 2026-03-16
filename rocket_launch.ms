// ==================================================
// ROCKET LAUNCH - OPTIMIZED & REALISTIC
// ==================================================

// @brief Konfiguration der Raketenteile und deren vertikaler Offsets.
rocketParts = ["fusion", "fusion_orb"]
partOffsets = {"fusion": 0, "fusion_orb": 18}

launchPadPos = [220, 0, -720]
targetAltitude = 1250
loopWaitTime = 0.02

// --- Helper Functions ---

// @brief Applikation der Raketenbewegung auf alle Komponenten.
// @param posX Basis-X-Koordinate.
// @param currentHeight Aktuelle physikalische Höhe.
// @param posZ Basis-Z-Koordinate.
// @param shakeIntensity Vibrationsstärke.
// @complexity O(n)
applyRocketMotion = function(posX, currentHeight, posZ, shakeIntensity=0)
    offsetX = (rnd() - 0.5) * shakeIntensity
    offsetZ = (rnd() - 0.5) * shakeIntensity
    for partName in rocketParts
        yPos = currentHeight + partOffsets[partName]
        moveObject partName, posX + offsetX, yPos, posZ + offsetZ
    end for
end function

// --- Initialization ---
altitude = launchPadPos[1]
velocity = 0
acceleration = 0.4    // Initial thrust
maxVelocity = 30.0
maxShake = 3.5

wait 1

// --- Ascent Phase (Acceleration) ---
while altitude < targetAltitude
    // Physics Update
    velocity = velocity + acceleration
    if velocity > maxVelocity then velocity = maxVelocity
    altitude = altitude + velocity
    
    // Dynamic Vibration: Strongest at liftoff, decreases with altitude
    currentShake = (1 - (altitude / targetAltitude)) * maxShake
    if currentShake < 0 then currentShake = 0
    
    applyRocketMotion launchPadPos[0], altitude, launchPadPos[2], currentShake
    wait loopWaitTime
    
    // Thrust Adjustment: Increase thrust after clearing the launch tower
    if altitude > 10 and acceleration < 0.8 then acceleration = acceleration + 0.05
    
    // Smooth Deceleration: Begin braking before reaching target altitude
    if altitude > targetAltitude * 0.85 then 
        acceleration = -0.5
        velocity = velocity * 0.95
    end if
end while

wait 2

// --- Descent Phase (Return & Landing) ---
velocity = 0
acceleration = 0.2 // Simulated gravity for controlled descent

while altitude > launchPadPos[1]
    // Physics Update: Increase descent speed
    velocity = velocity + acceleration
    
    // SOFT LANDING: Trigger retro-thrust below 200 units
    if altitude < 200 then
        acceleration = -0.15 // Stronger counter-thrust (braking)
        if velocity > 1.2 then 
            velocity = velocity * 0.85 // More aggressive speed reduction
        end if
        
        // Terminal velocity for final touchdown should be very slow
        if velocity < 0.3 then velocity = 0.3
    end if
    
    altitude = altitude - velocity
    
    // Landing Vibration: Simulates landing thrusters near the ground
    landingShake = 0
    if altitude < 200 then landingShake = 1.0 // Stronger visual engine feedback
    
    applyRocketMotion launchPadPos[0], altitude, launchPadPos[2], landingShake
    wait loopWaitTime
    
    // Safety Stop: Precision touchdown
    if altitude <= launchPadPos[1] + 0.5 then break
end while

// --- Mission Completion ---
applyRocketMotion launchPadPos[0], launchPadPos[1], launchPadPos[2], 0