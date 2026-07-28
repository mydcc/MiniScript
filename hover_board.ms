wait 2
object1 = "hover_board"
object2 = "hover1"
object3 = "hover2"
object4 = "hover3"
object5 = "hover4"

bx = -9.2
by = 0.2
bz = 12
h1x = -8.8
h1y = 0.5
h1z = 12
h2x = -9.6
h2y = 0.5
h2z = 12
h3x = -9.2
h3y = 0.5
h3z = 12.6
h4x = -9.2
h4y = 0.25
h4z = 12

hover1Data = "" + h1x + "," + h1y + "," + (h1z) + "," + 0.01
networkCommand object2, "moveObject", hover1Data
hover2Data = "" + h2x + "," + h2y + "," + (h2z) + "," + 0.01
networkCommand object3, "moveObject", hover2Data
hover3Data = "" + h3x + "," + h3y + "," + (h3z - 0.4) + "," + 1
networkCommand object4, "moveObject", hover3Data
wait 1
boardData = "" + bx + "," + by + "," + (bz -24) + "," + 12
networkCommand object1, "moveObject", boardData
hover1Data = "" + h1x + "," + h1y + "," + (h1z -24) + "," + 12
networkCommand object2, "moveObject", hover1Data
hover2Data = "" + h2x + "," + h2y + "," + (h2z -24) + "," + 12
networkCommand object3, "moveObject", hover2Data
hover3Data = "" + h3x + "," + h3y + "," + (h3z -24.4) + "," + 12
networkCommand object4, "moveObject", hover3Data
hover4Data = "" + h4x + "," + h4y + "," + (h4z -24) + "," + 12
networkCommand object5, "moveObject", hover4Data

wait 14
boardData = "" + bx + "," + by + "," + bz + "," + 0.01
networkCommand object1, "moveObject", boardData
hover1Data = "" + h1x + "," + (h1y - 0.75) + "," + h1z + "," + 0.01
networkCommand object2, "moveObject", hover1Data
hover2Data = "" + h2x + "," + (h2y - 0.75) + "," + h2z + "," + 0.01
networkCommand object3, "moveObject", hover2Data
hover3Data = "" + h3x + "," + h3y + "," + h3z + "," + 0.01
networkCommand object4, "moveObject", hover3Data
hover4Data = "" + h4x + "," + h4y + "," + h4z + "," + 0.01
networkCommand object5, "moveObject", hover4Data

wait 14