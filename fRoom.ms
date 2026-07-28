// --- Configuration ---
// Dimensions
length = 32
width = 10
height = 4
thickness = 0.1

// Positions
positionx = 20
positiony = 0
positionz = -33

// Rotations
rotationx = 0
rotationy = 90  // Example rotation (adjustable)
rotationz = 0

// --- Object Definitions ---

// Objects
object1 = "room1Floor"    // Floor
object2 = "room1Wall(1)"   // Wall 1
object3 = "room1Wall(2)"   // Wall 2
object4 = "room1Wall(3)"   // Wall 3
object5 = "room1Entrance(1)" // Top Entrance
object6 = "room1Entrance(2)" // Left Entrance
object7 = "room1Entrance(3)" // Right Entrance
object8 = "room1Edge(1)"
object9 = "room1Edge(2)"
object10 = "room1Edge(3)"
object11 = "room1Edge(4)"
object12 = "Voicechat1"
// --- Angle Calculation ---

// Angle in Radians
angle = rotationy * pi / 180

// Sine and Cosine
cos_angle = cos(angle)
sin_angle = sin(angle)

// --- Distance Calculations ---

// Distances
distance = width / 2
distance2 = length / 2

// --- Helper Functions ---

// Calculate X displacement based on distance and angle
calc_dx = function(dist, angle_cos)
  return dist * angle_cos
end function

// Calculate Z displacement based on distance and angle
calc_dz = function(dist, angle_sin)
  return dist * angle_sin
end function

// Object placement and scaling
place_object = function(obj, x, y, z, rotx, roty, rotz, scalex, scaley, scalez)
  moveObject obj, x, y, z
  rotateObject obj, rotx, roty, rotz
  scaleObject obj, scalex, scaley, scalez
end function

// --- Wall Positions Calculation ---
dx = calc_dx(distance, cos_angle)
dz = calc_dz(distance, sin_angle)
dx2 = calc_dx(distance2, sin_angle)
dz2 = calc_dz(distance2, cos_angle)

wallx = positionx
wally = positiony + height / 2
wallz = positionz

// --- Place Objects ---
// Floor
place_object(object1, positionx, positiony, positionz, rotationx, rotationy, rotationz, width, 0.001, length)

// Voicechat
place_object(object12, positionx, positiony + 0.125, positionz, rotationx, rotationy, rotationz, width, 0.25, length)

// Walls
place_object(object2, wallx - dx, wally, wallz + dz, rotationx, rotationy + 90, rotationz, length, height, thickness)
place_object(object3, wallx + dx, wally, wallz - dz, rotationx, rotationy + 90, rotationz, length, height, thickness)
place_object(object4, wallx + dx2, wally, wallz + dz2, rotationx, rotationy, rotationz, width, height, thickness)

// Entrance Walls
entrance_side_width = width * 0.382 / 2
entrance_top_width = width * 0.618
entrance_top_start_height_percentage = 0.382 / 2
entrance_top_height = height * entrance_top_start_height_percentage
entrance_top_start_height = height * entrance_top_start_height_percentage
entrance_side_offset = (entrance_top_width / 2) + (entrance_side_width / 2)

place_object(object5, wallx - dx2, positiony + height - entrance_top_start_height / 2, wallz - dz2, rotationx, rotationy, rotationz, entrance_top_width, entrance_top_height, thickness)
place_object(object6, wallx - dx2 - calc_dx(entrance_side_offset, cos_angle), positiony + height / 2, wallz - dz2 + calc_dz(entrance_side_offset, sin_angle), rotationx, rotationy, rotationz, entrance_side_width, height, thickness)
place_object(object7, wallx - dx2 + calc_dx(entrance_side_offset, cos_angle), positiony + height / 2, wallz - dz2 - calc_dz(entrance_side_offset, sin_angle), rotationx, rotationy, rotationz, entrance_side_width, height, thickness)
place_object(object8, wallx - dx2 - calc_dx(entrance_side_offset, cos_angle), positiony + height / 2, wallz - dz2 + calc_dz(entrance_side_offset, sin_angle), rotationx, rotationy, rotationz, thickness, height / 2, thickness)
place_object(object9, wallx - dx2 + calc_dx(entrance_side_offset, cos_angle), positiony + height / 2, wallz - dz2 - calc_dz(entrance_side_offset, sin_angle), rotationx, rotationy, rotationz, thickness, height / 2, thickness)

// Cylinders (Rounds at the Entrance)
place_object(object8, wallx - dx2 - calc_dx(entrance_side_offset + entrance_side_width / 2, cos_angle), positiony + height / 2, wallz - dz2 + calc_dz(entrance_side_offset + entrance_side_width / 2, sin_angle), rotationx, rotationy, rotationz, thickness, height / 2, thickness)
place_object(object9, wallx - dx2 + calc_dx(entrance_side_offset + entrance_side_width / 2, cos_angle), positiony + height / 2, wallz - dz2 - calc_dz(entrance_side_offset + entrance_side_width / 2, sin_angle), rotationx, rotationy, rotationz, thickness, height / 2, thickness)
place_object(object10, wallx + dx2 - calc_dx(entrance_side_offset + entrance_side_width / 2, cos_angle), positiony + height / 2, wallz + dz2 + calc_dz(entrance_side_offset + entrance_side_width / 2, sin_angle), rotationx, rotationy, rotationz, thickness, height / 2, thickness)
place_object(object11, wallx + dx2 + calc_dx(entrance_side_offset + entrance_side_width / 2, cos_angle), positiony + height / 2, wallz + dz2 - calc_dz(entrance_side_offset + entrance_side_width / 2, sin_angle), rotationx, rotationy, rotationz, thickness, height / 2, thickness)