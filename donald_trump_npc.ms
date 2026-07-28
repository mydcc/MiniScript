m = {1: "If Ivanka wasn't my daughter, I'd probably date her.", 2: "My fingers are long and beautiful, as, it has been well documented, are other parts of my body.", 3: "The nice thing about me is that I'm very rich.", 4: "Global warming was invented by and for the Chinese to make US manufacturing uncompetitive.",5: "When Mexico sends its people, they don't send the best. They send people with a lot of problems and they bring those problems to us. They bring drugs. They bring crime. They're rapists... And some, I suppose, are good people.", 6: "I could shoot someone in the middle of 5th Avenue in New York and people would still vote for me", 7:"Do you know where the US headquarters of that bank is? In this building, in Trump Tower.", 8: "Waterboarding is still too harmless. I would be so brutal", 9: "I love China. The biggest bank in the world is from China.", 10:"I love China. People say, 'Oh, you don't like China?", 11:"Waterboarding is still too harmless. I would be so brutal", 12:"It really doesn't matter what the media says as long as you have a young and beautiful ass."}

object1 = "donald_trump"
object2 = "trump_cube"
x = -64
y = 0.5
z = -256

while true
    r = round(rnd*8)+2
    r2 = round(rnd*10)
    rot = rnd*360
   
    aniObject object1, r , "oneshot", 1
    moveObject object1, x + r*r2, y, z + r*r2
    rotateObject object1, 0, rot, 0
   
    moveObject object2, x + r*r2, y, z + r*r2
    rotateObject object2, 0, rot, 0
  
    wait 5
    r3= round(rnd*12) + 1
    camY = 4.5
    mtime = 2
    role= ""
    sr = "random"
    sound = round(rnd*50)
    gpt = "true"
    code = ""
    ttp = "true"
    makeNPC object2, camY, mtime, role, m[r3], m[r3], m[r3], m[r3], m[r3], sr, sound, gpt, code, ttp

    if time > 10 then break
end while





