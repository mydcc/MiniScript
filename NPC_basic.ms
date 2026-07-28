m = {1: "My Message 1", 2: "My Message 2", 3: "My Message 3", 4: "My Message 4",5: "My Message 5", 6: "My Message 6", 7:"My Message 7", 8: "My Message 8", 9: "My Message 9", 10:"My Message 10", 11:"My Message 11", 12:"My Message 12"}
object1 = "MyNPCObject"
x = 1
y = 0
z = -1
while true
    r = round(rnd*4)+1
    r2 = round(rnd*10)
    aniObject object1, r , "oneshot", 1
    moveObject object1, x + r*r2, y, z + r*r2
    wait 5
    //
    r= round(rnd*12) + 1
    camY = 1
    mtime = 2
    role= ""
    sr = "random"
    sound = round(rnd*50)
    gpt = "false"
    code = ""
    ttp = "true"
    makeNPC object1, camY, mtime, role, m[r], m[r], m[r], m[r], m[r], sr, sound, gpt, code, ttp
    if time > 10 then break
end while

