// How to create a table with MiniScript.
// All you need is to place five cubes and name them “Table” and “TableLeg(1), TableLeg(n)”
// Set the parameters for your table.


// --- Configuration ---
// Table dimensions
w = 3.2     // Width
l = 1.7     // Length
h = 1.2     // Height
thick = 0.12  // Thickness

// Table position
posX = 20   // X position
posY = 0    // Y position
posZ = 10   // Z position

// Table rotation
rotY = 45   // Y rotation (degrees)

// Leg dimensions
legW = 0.12   // Leg width
legH = h      // Leg height
legD = 0.12   // Leg depth
legInset = 0.15 // How far in from the corner the leg is placed

// --- Pre-calculations ---
// Convert degrees to radians
toRad = function(deg)
    return deg * pi / -180
end function

rad = toRad(rotY)        // Rotation in radians
cosRot = cos(rad)       // Cosine of rotation
sinRot = sin(rad)       // Sine of rotation

// Half dimensions
halfW = w / 2
halfL = l / 2


// --- Functions ---
// Position, scale, and rotate object
transObj = function(name, pos, rotY, w, h, l)
    moveObject name, pos[0], pos[1], pos[2]    // Move the object
    rotateObject name, 0, rotY, 0              // Rotate around Y-axis
    scaleObject name, w, h, l                  // Scale the object
end function

// Calculate rotated point
rotatePoint = function(x, z, originX, originZ, cosA, sinA)
    relX = x - originX
    relZ = z - originZ
    newX = originX + relX * cosA - relZ * sinA
    newZ = originZ + relX * sinA + relZ * cosA
    return [newX, newZ]
end function

// Position table leg
posLeg = function(legNum, cornerOffset) // cornerOffset is [xOffset, zOffset] from corner
    // Calculate corner position
    cornerX = posX + cornerOffset[0]
    cornerZ = posZ + cornerOffset[1]

    // Rotate corner position
    rotatedCorner = rotatePoint(cornerX, cornerZ, posX, posZ, cosRot, sinRot)

    legPos = [rotatedCorner[0] , posY + legH / 2, rotatedCorner[1]] // Final leg position
    transObj "TableLeg(" + legNum + ")", legPos, rotY, legW, legH, legD // Transform the leg
end function

// --- Execution ---
// Table top
topPos = [posX, posY + h, posZ]  // Position of the table top
transObj "Table", topPos, rotY, w, thick, l  // Transform the table top

// Table legs
posLeg 1, [halfW - legInset, halfL - legInset]    // Leg 1: Front Right
posLeg 2, [halfW - legInset, -halfL + legInset]   // Leg 2: Back Right
posLeg 3, [-halfW + legInset, halfL - legInset]   // Leg 3: Front Left
posLeg 4, [-halfW + legInset, -halfL + legInset]  // Leg 4: Back Left