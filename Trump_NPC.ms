quotes = {1: "I'd probably date you.", 2: "My fingers are long and beautiful, as, it has been well documented, are other parts of my body.", 3: "The nice thing about me is that I'm very rich.", 4: "Global warming was invented by and for the Chinese to make US manufacturing uncompetitive.", 5: "When Mexico sends its people, they don't send the best. They send people with a lot of problems and they bring those problems to us. They bring drugs. They bring crime. They're rapists... And some, I suppose, are good people.", 6: "I could shoot someone in the middle of 5th Avenue in New York and people would still vote for me", 7: "Do you know where the US headquarters of that bank is? In this building, in Trump Tower.", 8: "Waterboarding is still too harmless. I would be so brutal", 9: "I love China. The biggest bank in the world is from China.", 10: "I love China. People say, 'Oh, you don't like China?", 11: "Waterboarding is still too harmless. I would be so brutal", 12: "It really doesn't matter what the media says as long as you have a young and beautiful ass."}

// Global Identifiers
npc_id = "donald_trump"
cube_id = "trump_cube"

// Origin Coordinates
base_x = -64
base_y = 0.0
base_z = -256

// --- Main Execution Loop ---
while true
    // Deterministic Randomness for Vector Calculation
    val_r  = round(rnd * 8) + 2
    val_r2 = round(rnd * 10)
    val_rot = rnd * 360
    
    // Cache offset arithmetic to reduce ALU cycles
    offset = val_r * val_r2
    target_x = base_x + offset
    target_z = base_z + offset

    // Object Synchronization: Move & Rotate
    // Position updates applied to both primary and secondary descriptors
    aniObject npc_id, val_r, "oneshot", 1
    moveObject npc_id, target_x, base_y, target_z
    rotateObject npc_id, 0, val_rot, 0
    
    moveObject cube_id, target_x, base_y, target_z
    rotateObject cube_id, 0, val_rot, 0

    // Latency injection to synchronize with engine frame rate
    wait 5

    // Dialogue Generation
    // Using floor to ensure index is strictly 1-12
    quote_idx = floor(rnd * 12) + 1
    
    text = quotes[quote_idx]
    
    // NPC Parameter mapping
    config_cam_y   = 1.5
    config_mtime   = 2
    config_role    = ""
    config_sr      = "random"
    config_sound   = round(rnd * 50)
    config_gpt     = "false"
    config_code    = ""
    config_ttp     = "true"

    // Trigger NPC State change
    // Using spatial proximity triggers for interaction
    makeNPC cube_id, config_cam_y, config_mtime, config_role, text, text, text, text, text, config_sr, config_sound, config_gpt, config_code, config_ttp

    wait 5
    
    // Hard exit after 120s to prevent memory fragmentation in long-running sessions
    if time > 120 then break
end while