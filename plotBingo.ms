
// This script is designed to handle button selection and scaling in a 3D environment.
// It includes functions to manage button states, scale objects, and handle network commands.
// It also includes a function to run object code based on button selection.
// The script is structured to ensure that the buttons are properly scaled and positioned
// in the 3D space, and that the correct object code is executed based on the button pressed.
networkCommand "button2", "moveObject", "-2.1,0.95,-4.2,1"
wait
networkCommand "button2", "moveObject", "-2.1, 1, -4.2, 1"
runObjectCode "cCube2"


// This script is designed to create a bingo card with random numbers.
// It generates a 5x5 grid of numbers, with the center space marked as "FREE".
// The numbers are randomly selected from a range of 1 to 75, ensuring that there are no duplicates.
rnd = random(1, 75) //test it w/o below line    

title = "Chaarmi <mark>.Bingo.</mark> Card"
n1 = round(rnd*75)
n2 = round(rnd*75)
n3 = round(rnd*75)
n4 = round(rnd*75)
n5 = round(rnd*75)
n6 = round(rnd*75)
n7 = round(rnd*75)
n8 = round(rnd*75)
n9 = round(rnd*75)
n10 = round(rnd*75)
n11 = round(rnd*75)
n12 = round(rnd*75)
n13 = round(rnd*75)
n14 = round(rnd*75)
n15 = round(rnd*75)
n16 = round(rnd*75)
n17 = round(rnd*75)
n18 = round(rnd*75)
n19 = round(rnd*75)
n20 = round(rnd*75)
n21 = round(rnd*75)
n22 = round(rnd*75)
n23 = round(rnd*75)
n24 = round(rnd*75)
n25 = round(rnd*75)
message = n1 + "<size=22>  I  </size>" + n2 + "<size=22>  I  </size>" + n3 + "<size=22>  I  </size>" + n4 + "<size=22>  I  </size>" + n5 + "<size=42>                    </size>" + n6 + "<size=22>  I  </size>" + n7 + "<size=22>  I  </size>" + n8 + "<size=22>  I  </size>" + n9 + "<size=22>  I  </size>" + n10 + "<size=42>                    </size>" + n11 + "<size=22>  I  </size>" + n12 + "<size=22>  I  </size>" + "      " + "<size=22>  I  </size>" + n14 + "<size=22>  I  </size>" + n15 + "<size=42>                    </size>" + n16 + "<size=22>  I  </size>" + n17 + "<size=22>  I  </size>" + n18 + "<size=22>  I  </size>" + n19 + "<size=22>  I  </size>" + n20 + "<size=42>                    </size>" + n21 + "<size=22>  I  </size>" + n22 + "<size=22>  I  </size>" + n23 + "<size=22>  I  </size>" + n24 + "<size=22>  I  </size>" + n25 + "<size=42> </size>"
messageBox title, message


//Stand-Code

url = {0:"https://my-content.chaarmi.org/bingo/0.png",1:"https://my-content.chaarmi.org/bingo/1.png", 2:"https://my-content.chaarmi.org/bingo/2.png",3:"https://my-content.chaarmi.org/bingo/3.png", 4:"https://my-content.chaarmi.org/bingo/4.png",5:"https://my-content.chaarmi.org/bingo/5.png", 6:"https://my-content.chaarmi.org/bingo/6.png",7:"https://my-content.chaarmi.org/bingo/7.png", 8:"https://my-content.chaarmi.org/bingo/8.png",9:"https://my-content.chaarmi.org/bingo/9.png", 10:"https://my-content.chaarmi.org/bingo/10.png",11:"https://my-content.chaarmi.org/bingo/11.png", 12:"https://my-content.chaarmi.org/bingo/12.png",14:"https://nft.fra1.cdn.digitaloceanspaces.com/my-conten....fra1.cdn.digitaloceanspaces.com/my-content/bingo/66.png", 67:"https://my-content.chaarmi.org/bingo/67.png",68:"https://my-content.chaarmi.org/bingo/68.png", 69:"https://my-content.chaarmi.org/bingo/69.png",70:"https://my-content.chaarmi.org/bingo/70.png", 71:"https://my-content.chaarmi.org/bingo/71.png",72:"https://my-content.chaarmi.org/bingo/72.png", 73:"https://my-content.chaarmi.org/bingo/73.png",74:"https://my-content.chaarmi.org/bingo/74.png", 75:"https://my-content.chaarmi.org/bingo/75.png"}
t = {0:30, 1:40, 2:50}
while true
r = round(rnd*75)
r1 = round(rnd*2)
networkCommand "Cube", "changeTexture", url[r]
networkCommand "soundTrigger", "scaleObject", "20, 20, 20, 0.001"
wait 0.001
networkCommand "soundTrigger", "scaleObject", "1, 1, 1, 0.001"
wait t[r1]
end while

// Rotate the cube
// This script rotates the cube object continuously.
// The rotation speed is determined by the time variable, which is updated in each iteration of the loop.
while true
rotateObject "Cube", time*10, time*10, time*10 //this is the rotation speed
end while
// end of the script


// This script is designed to create a light show effect using a spot light object.
// It generates random colors and positions for the light, creating a dynamic and colorful display.

r = {0:0, 1:1, 2:2, 3:3, 4:4, 5:5, 6:6, 7:7, 8:8, 9:9, 10:"A", 11:"B", 12:"C", 13:"D", 14:"E", 15:"F"}
s = {0:0, 1:1, 2:2, 3:3, 4:4, 5:5, 6:6, 7:7, 8:8, 9:9, 10:"A", 11:"B", 12:"C", 13:"D", 14:"E", 15:"F"}
t = {0:0, 1:1, 2:2, 3:3, 4:4, 5:5, 6:6, 7:7, 8:8, 9:9, 10:"A", 11:"B", 12:"C", 13:"D", 14:"E", 15:"F"}
u = {0:0, 1:1, 2:2, 3:3, 4:4, 5:5, 6:6, 7:7, 8:8, 9:9, 10:"A", 11:"B", 12:"C", 13:"D", 14:"E", 15:"F"}
v = {0:0, 1:1, 2:2, 3:3, 4:4, 5:5, 6:6, 7:7, 8:8, 9:9, 10:"A", 11:"B", 12:"C", 13:"D", 14:"E", 15:"F"}
w = {0:0, 1:1, 2:2, 3:3, 4:4, 5:5, 6:6, 7:7, 8:8, 9:9, 10:"A", 11:"B", 12:"C", 13:"D", 14:"E", 15:"F"}

for i in range(20)
z = round(rnd+20)
k = round(rnd*15)
l = round(rnd*15)
m = round(rnd*15)
n = round(rnd*15)
o = round(rnd*15)
p = round(rnd*15)
color = "#" + r[k]+s[l]+t[m]+u[n]+v[o]+w[p]
t1 = round(rnd*2)
setLightObject "Spot4", color, 3, "soft", 1
rotateObject "Spot4",time*100, time*100, time*100
moveObject "Spot4", k/3, l/5, m/3
wait t1
end for

setLightObject "Spot4", "#FFFFFF", 3, "hard", 1
moveObject "Spot4", -4.2, 3.8, 2
rotateObject "Spot4", 56, 0, 0
// end of the script

// This script is designed to create a bouncing effect for an object in a 3D environment.
// It uses a sine wave function to create a smooth up-and-down motion.

x = 3.3
y = 2.4
z = 3.2
amp = 0.1
freq = 4
while time < 12
newY = y + amp * sin(freq * time)
moveObject "winner_sign", 3.8, newY, 3.2
wait 0.1
end while
moveObject "winner_sign", 3.8, 5, 3.2