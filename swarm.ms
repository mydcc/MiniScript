numCubes = 100
cubeBaseName = "Cube"
cubeScale = 0.25 // Einheitliche Skalierung für alle Würfel

// Bereich für die zufällige Bewegung
minX = -5
maxX = 5
minY = 0
maxY = 5
minZ = -5
maxZ = 5

// Geschwindigkeit der zufälligen Bewegung (wie schnell sich die Positionen ändern)
moveSpeed = 0.1

cubeNames = []
for i in range(1, numCubes)
    cubeNames.push(cubeBaseName + i)
end for

// Initiale Skalierung aller Würfel
for i in range(0, numCubes - 1)
    currentCubeName = cubeNames[i]
    scaleObject currentCubeName, cubeScale, cubeScale, cubeScale
end for

// Hauptanimationsschleife für die Schwärm-Bewegung
// Diese Schleife läuft unendlich für einen kontinuierlichen Effekt.
while true
    // currentTime wird hier nicht direkt für die Position verwendet,
    // sondern die Bewegung ist eher sprunghaft zufällig.
    // Man könnte currentTime auch nutzen, um eine sanftere Bewegung zu interpolieren.

    for i in range(0, numCubes - 1)
        currentCubeName = cubeNames[i]

        // Generiere zufällige neue Positionen innerhalb des definierten Bereichs
        // rnd(null) gibt eine Zufallszahl zwischen 0 (inklusive) und 1 (exklusive) zurück.
        // Die Formel: min + rnd() * (max - min) skaliert rnd() auf den gewünschten Bereich.
        newPosX = minX + rnd(null) * (maxX - minX)
        newPosY = minY + rnd(null) * (maxY - minY)
        newPosZ = minZ + rnd(null) * (maxZ - minZ)

        // Bewege den Würfel zu der neuen zufälligen Position
        moveObject currentCubeName, newPosX, newPosY, newPosZ
    end for

    // yield ist hier sehr wichtig, um die Animation flüssig zu halten.
    // Ohne yield würde das Skript so schnell wie möglich laufen und die Würfel würden "flimmern".
    yield
end while
