rakete = "fusion"
object2 = "fusion_orb"
start_x = -27
start_y = 0
start_z = 27
ziel_y = 50
bogen_weite = 0
flugzeit = 10
zeit_schritt = 0.001

for schritt in range(1, flugzeit / zeit_schritt)
    zeit = schritt * zeit_schritt
    fortschritt = zeit / flugzeit

    // Einfache parabelförmige Bewegung für y
    y = start_y + ziel_y * (4 * fortschritt - 4 * fortschritt^2)

    // Einfache Sinusfunktion für x
    x = start_x + bogen_weite * sin(pi * fortschritt)
    z = start_z

    moveObject rakete, x, y, z
    moveObject object2, x, y, z
    wait zeit_schritt
    if y <= start_y and zeit > flugzeit / 2 then break
end if
end for