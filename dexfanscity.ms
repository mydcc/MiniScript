moveObject "house(1)", px, py, pz
rotateObject "house(1)", rx, ry, rz
scaleObject "house(1)", sx, sy, sz

moveObject "house(2)", px, py, pz
rotateObject "house(2)", rx, ry, rz
scaleObject "house(2)", sx, sy, sz

moveObject "house(3)", px, py, pz
rotateObject "house(3)", rx, ry, rz
scaleObject "house(3)", sx, sy, sz


// Define the House class
House = {
  // Initialize the house with a map of properties
  init = function(properties)
    self.name = properties.name
    self.px = properties.px
    self.py = properties.py
    self.pz = properties.pz
    self.rx = properties.rx
    self.ry = properties.ry
    self.rz = properties.rz
    self.sx = properties.sx
    self.sy = properties.sy
    self.sz = properties.sz
  end function,

  // Method to apply the transformations to the house
  transform = function()
    moveObject self.name, self.px, self.py, self.pz
    rotateObject self.name, self.rx, self.ry, self.rz
    scaleObject self.name, self.sx, self.sy, self.sz
  end function
}

// Define houses with their properties using maps
houses = [
  { name: "house(1)", px: 1, py: 0, pz: 4, rx: 0, ry: 0, rz: 0, sx: 1, sy: 1, sz: 1 },
  { name: "house(2)", px: 5, py: 2, pz: 6, rx: 45, ry: 0, rz: 0, sx: 1.2, sy: 1.2, sz: 1.2 },
  { name: "house(3)", px: 3, py: 1, pz: 3, rx: 90, ry: 0, rz: 0, sx: 0.8, sy: 0.8, sz: 0.8 }
]

// Create instances of the House class and apply transformations
for i in houses
  house = new House
  house.init(i)
  house.transform()
end for

/////MediaPLayer
song = [
    "https://bln.fra1.cdn.digitaloceanspaces.com/bo/bo_e.mp4",
    "https://bln.fra1.cdn.digitaloceanspaces.com/bo/bo_wj.mp4",
    "https://bln.fra1.cdn.digitaloceanspaces.com/bo/bo_frankfurt2001.mp4",
    "https://bln.fra1.cdn.digitaloceanspaces.com/bo/bo_nifde.mp4",
    "https://bln.fra1.cdn.digitaloceanspaces.com/bo/bo_medley.mp4"]
r = round(rnd*2) + 1
playVideo "Video(" + r + ")", song[r], "oneshot", 1

//
px = 70;py = 14;pz = -222;
sx = 0.1;sy = 20;sz = 33
play = 1; stop = play - 1
object = "Video(" + play + ")"


for i in range(1,3)
if i == play then
scaleObject object, sx + 2, sy + 2, sz + 2
runObjectCode "Video(1)"

else if i != play then
scaleObject "Video(" + i + ")", sx/2, sy/2, sz/2
end if
end for

playVideo = function ()