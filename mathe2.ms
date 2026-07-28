sx = 32
sy = 4
thick = 0.1

x = 20
y = 2
z = 44
b = -45
for i in range(8)
object1 = "wall(" + i + ")"
object4 = "backwall(" + i + ")"
object3 = "sidewall(" + i  + ")"
object6 = "frontwall(" + i + ")"
moveObject object1, x, y, z
moveObject object3, 4, y, z - 1
moveObject object4, 36, 2, b
moveObject object6, 4, 3.5, z - 5
scaleObject object6, 6, 1, 0.01
b = b + 12
scaleObject object1, 32, 4, thick
z = z - 12
end for

z = 46
for i in range(9, 18)
object2 = "wall(" + i + ")"
object5 = "sidewall(" + i + ")"
moveObject object2, x, y, z
moveObject object5, 4, 2, z -11
scaleObject object2, 32, 4, thick
z = z - 12
end for