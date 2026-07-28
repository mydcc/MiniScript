// Zitate-Sammlung (Mehrzeilig für bessere Kompatibilität)
quotes = []
quotes.push "I'd probably date you."
quotes.push "My fingers are long and beautiful."
quotes.push "The nice thing about me is that I'm very rich."
quotes.push "Global warming was invented by and for the Chinese."
quotes.push "When Mexico sends its people, they don't send the best."
quotes.push "I could shoot someone in the middle of 5th Avenue."
quotes.push "Do you know where the US headquarters of that bank is?"
quotes.push "Waterboarding is still too harmless. I would be so brutal."
quotes.push "I love China. The biggest bank in the world is from China."
quotes.push "I love China. People say, 'Oh, you don't like China?'"
quotes.push "I will build a great wall - and nobody builds walls better than me."
quotes.push "It really doesn't matter what the media says."

// Global Identifiers
npc_id = "donald_trump"
cube_id = "trump_cube"

// Origin Coordinates
base_x = -112
base_y = 0.5
base_z = -334

// Startzeit festhalten (für korrekten Abbruch nach 120s)
start_time = time

// 1. Initial Position Reset
moveObject(npc_id, base_x, base_y, base_z)
moveObject(cube_id, base_x, base_y, base_z)
wait 1

while true
	// Zufallsbewegung
	val_anim = floor(rnd * 6) + 2
	offset_x = (rnd * 120) - 10
	offset_z = (rnd * 120) - 10
	val_rot = rnd * 360

	target_x = base_x + offset_x
	target_z = base_z + offset_z

	// Bewegung ausführen
	aniObject(npc_id, val_anim, "oneshot", 1)
	moveObject(npc_id, target_x, base_y, target_z)
	rotateObject(npc_id, 0, val_rot, 0)
	moveObject(cube_id, target_x, base_y, target_z)
	rotateObject(cube_id, 0, val_rot, 0)

	wait 5

	// Zitat-Auswahl (Dynamisch auf Listenlänge)
	quote_idx = floor(rnd * quotes.len)
	text = quotes[quote_idx]
	c_cam_y = 1.5
	c_mtime = 2
	c_role = ""
	c_sr = "random"
	c_gpt = "false"
	c_code = ""
	c_ttp = "true"
	c_sound = round(rnd * 50)

	makeNPC(cube_id, c_cam_y, c_mtime, c_role, text, text, text, text, text, c_sr, c_sound, c_gpt, c_code, c_ttp)

	wait 5

	// 2. Beenden nach 120 Sekunden relativer Laufzeit
	if time - start_time > 120 then
		moveObject(npc_id, base_x, base_y, base_z)
		moveObject(cube_id, base_x, base_y, base_z)
		break
	end if
end while