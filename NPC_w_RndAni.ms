a ={0:"2", 1:"9", 2:"6", 3:"3", 4:"10"}
b ={0:5, 1:6, 2:5, 3:3, 4:3}
r = round(rnd*4)
aniObject "dog", a[r], "oneshot", 1
//
m = {1: "Woof! Good day, adventurer! Ready for new discoveries?", 2: "Have you ever thought about how many balls could be hidden in this world?", 3: "Are you in search of a puzzle? I've got one for you: What has four legs in the morning, two legs at noon, and three legs in the evening?", 4: "I've heard of a magical lake that grants wishes. Perhaps we'll find it together!",5: "You're my favorite human companion. But could you conjure up a few more bones?"}

object1 = "dog"
camY = 0.5
mtime = 4
role= ""
sr = "random"
sound = "6"
gpt = "false"
code = ""
ttp = "true"
makeNPC object1, camY, mtime, role, m[1], m[2], m[3], m[4], m[5], sr, sound, gpt, code, ttp

wait b[r]
aniObject "dog", "1", "oneshot", 0.5


///////////////////
object1 = "lp_cowboy"
aniObject object1, "1", "oneshot", 1
wait
message = {
    1: "Kid, zieh den Hut, die Schule ist ein Ritt. Zeig, was du kannst, es zahlt sich aus.",
    2: "Ein Cowboy fällt mal hin, doch er steht auf. Lerne, Kid, das ist dein Weg.",
    3: "Feuer im Herzen, das zählt. Nutze es, Kid, die Schule ist dein Gold.",
    4: "Die Schule dein Saloon, mach was draus. Kluge Köpfe siegen im Leben.",
    5: "Hab keine Angst vorm Colt der Wahrheit, Kid. Sei ehrlich, steh für dich ein.",
    6: "Respekt, Kid, ist dein bester Ritt. Lern die Regeln, sie sind dein Kompass.",
    7: "Tricks und Kniffe, Kid, zahlen sich aus. Hör zu, lern, sei ein schlauer Cowboy.",
    8: "Frag den Alten, er kennt den Trail. Sein Rat, Kid, ist Gold wert.",
    9: "Staub hält dich nicht auf, Kid. Ziele hoch, der Himmel ist dein Ziel.",
    10: "Halt dich fest, Kid, der Ritt ist wild. Bleib stark, die Schule testet dich.",
    11: "Dein Kopf, Kid, ist dein bester Colt. Denk klug, so gewinnst du jedes Spiel.",
    12: "Die Prärie des Wissens, Kid, ist weit. Reite los, erkunde, sei ein Pionier.",
    13: "Reite, Kid, dein Ziel wartet. Nutze die Schule, sie ist dein Startpunkt.",
    14: "Mut, Kid, macht den Cowboy aus. Sei tapfer, geh deinen eigenen Weg.",
    15: "Auch der Schnellste braucht Pause, Kid. Lerne, wann du rasten musst.",
    16: "Hör auf den Wind, Kid, er zeigt dir Wege. Sei aufmerksam, das Leben lehrt.",
    17: "Jeder Tag, Kid, ist ein neuer Ritt. Nutz die Zeit, mach was draus.",
    18: "Bau dir dein Fort, Kid, Stein für Stein. Fleiß zahlt sich aus, sei ein Baumeister.",
    19: "Ein Held steht auf, Kid. Sei stark, lass dich nie unterkriegen.",
    20: "Sei ein Cowboy, Kid, und lebe groß. Die Schule ist dein erster großer Ritt.",
    21: "Kid, die Schule ist dein erster Trail. Geh ihn mit Mut, es lohnt sich am Ende.",
    22: "Auch der beste Cowboy lernt dazu. Sei offen, Kid, Wissen macht dich stark.",
    23: "Dein Geist, Kid, ist wie ein wildes Pferd. Zähm ihn, und du reitest zum Erfolg.",
    24: "Die Schule ist wie ein Lagerfeuer, Kid. Wärme dich am Wissen anderer.",
    25: "Ein Cowboy ohne Plan ist verloren. Setz dir Ziele, Kid, erreiche sie mit Stolz.",
    26: "Sei wie der Adler, Kid. Schau weit, erkenn die Chancen, ergreife sie dann.",
    27: "Die Regeln sind wie die Grenzen der Ranch, Kid. Halt dich dran, bleib auf dem Pfad.",
    28: "Manchmal ist Schweigen Gold, Kid. Hör zu, lern, wann du reden musst.",
    29: "Ein guter Cowboy hilft dem Schwachen, Kid. Sei fair, gemeinsam sind wir stark.",
    30: "Jeder Fehler, Kid, ist eine Lektion. Nutz sie, um besser zu werden, glaub an dich.",
    31: "Die Schule ist dein Kompass, Kid. Er zeigt dir den Weg zum großen Ritt.",
    32: "Sei ein Pionier, Kid. Entdecke Neues, hab keine Angst vor unbekannten Wegen.",
    33: "Deine Worte sind wie Kugeln, Kid. Wähl sie weise, sie treffen ihr Ziel.",
    34: "Geduld, Kid, ist das beste Lasso. Fang deine Träume mit ruhiger Hand ein.",
    35: "Ein wahrer Cowboy steht zu seinen Taten, Kid. Übernimm Verantwortung, sei ehrlich.",
    36: "Die Schule ist ein wilder Fluss, Kid. Lern schwimmen, so bleibst du obenauf.",
    37: "Dein Lächeln, Kid, ist wie die Sonne. Es wärmt und erhellt jeden Tag.",
    38: "Sei ein Fels in der Brandung, Kid. Lass dich nicht von Stürmen unterkriegen.",
    39: "Ein guter Cowboy teilt sein Wissen, Kid. Hilf anderen, so wirst du selbst reicher.",
    40: "Die Schule ist dein Spiegel, Kid. Sie zeigt dir, wer du bist und wer du sein kannst."}

r = round(rnd*message.len - 1) + 1 
//NPC Start
camY = 5
mtime = 4
role= ""
sr = "random"
sound = "6"
gpt = "false"
code = ""
ttp = "true"
makeNPC object1, camY, mtime, role, message[r], message[r], message[r], message[r], message[r], sr, sound, gpt, code, ttp
//NPC Ende
wait 4
aniObject object1, "1", "oneshot", 0.5