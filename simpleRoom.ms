// --- Configuration ---

// Room ID, if you have multiple rooms
room_idx = 1

// Dimensions of the room
length = 6
width = 12
height = 4
thickness = 0.3

// Position of the room in the world
positionx = 2
positiony = 0
positionz = 6

// Rotation of the room. Keep x and z at 0 for a flat room, adjust y for rotation.
rotationx = 0
rotationy = 45  // Example rotation (adjustable)
rotationz = 0

// --- Object Definitions ---

// Objects to be created (Cubes and Spheres)
object1 = "Floor_"  + room_idx   // Floor
object2 = "Wall1_"  + room_idx // Wall 1
object3 = "Wall2_"  + room_idx  // Wall 2
object4 = "Wall3_"  + room_idx  // Wall 3
object5 = "topEntrance_"  + room_idx // Top Entrance
object6 = "lEntrance_"  + room_idx // Left Entrance
object7 = "rEntrance_"  + room_idx // Right Entrance
object8 = "Edge1_"  + room_idx // Edge 1
object9 = "Edge2_"  + room_idx // Edge 2
object10 = "Edge3_"  + room_idx // Edge 3
object11 = "Edge4_"  + room_idx // Edge 4

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
