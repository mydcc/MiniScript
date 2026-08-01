m = {
	1: "Who is the sheriff in town, bitch?",
	2: "10 Years",
	3: "Fuck Trump!",
	4: "You can go to jail, bump.",
	5: "ZACK POW BÄNG",
	6: "wtf",
	7: "welcome",
	8: "hello",
	9: "9",
	10: "10",
	11: "11",
	12: "12",
}
object1 = "sheriff_albert_lion"
object2 = "click_sheriff"
x = 32
y = 0
z = -222
while true
	r = round(rnd * 4) + 1
	r2 = round(rnd * 10)
	aniObject(
		object1,
		r,
		"oneshot",
		1)
	moveObject(
		object1,
		x + r * r2,
		y,
		z + r * r2)
	moveObject(
		object2,
		x + r * r2,
		y,
		z + r * r2)
	wait 5
	// 
	r = round(rnd * 12) + 1
	camY = 4.5
	mtime = 2
	role = "ver ynice sheriff named Patrick, in Berlin City"
	sr = "random"
	sound = round(rnd * 50)
	gpt = "true"
	code = ""
	ttp = "true"
	makeNPC(
		object2,
		camY,
		mtime,
		role,
		m[r],
		m[r],
		m[r],
		m[r],
		m[r],
		sr,
		sound,
		gpt,
		code,
		ttp)
	if time > 20 then break
end while