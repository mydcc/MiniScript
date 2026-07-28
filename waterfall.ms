numCubes = 100
cubeBaseName = "Cube"
cubeScale = 0.25 // Einheitliche Skalierung für alle Würfel

// Fall-Parameter
startHeight = 10       // Start-Y-Position, von der die Würfel fallen
groundLevel = 0        // Y-Position, bei der die Würfel zurückgesetzt werden
fallSpeed = 1          // Grundgeschwindigkeit des Falls
randomness = 0.5       // Zufälligkeit der Fallgeschwindigkeit

// Initialisierung der Würfelnamen-Liste
cubeNames = []
for i in range(1, numCubes)
    cubeNames.push(cubeBaseName + i)
end for

// Initiale Skalierung aller Würfel
for i in range(0, numCubes - 1)
    currentCubeName = cubeNames[i]
    scaleObject currentCubeName, cubeScale, cubeScale, cubeScale
end for

// Hauptanimationsschleife für die Fall-Bewegung
// Diese Schleife läuft unendlich für einen kontinuierlichen Effekt.
while true
    currentTime = time

    for i in range(0, numCubes - 1)
        currentCubeName = cubeNames[i]

        // Jede Kugel erhält eine leicht zufällige Fallgeschwindigkeit
        effectiveFallSpeed = fallSpeed + rnd(null) * randomness

        // Berechnung der neuen Y-Position
        // Die Würfel fallen kontinuierlich nach unten
        newPosY = startHeight - (currentTime * effectiveFallSpeed) % (startHeight - groundLevel)

        // Würfel an die berechnete Position verschieben
        // Die X- und Z-Positionen bleiben statisch bei 0 für eine vertikale Säule
        moveObject currentCubeName, 0, newPosY, 0
    end for

    // yield // Dieses Statement bleibt entfernt, wie gewünscht
end while
