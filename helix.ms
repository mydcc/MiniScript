numCubes = 100
cubeBaseName = "Cube"
cubeScale = 0.25 // Einheitliche Skalierung für alle Würfel

// Helix-Parameter
helixRadius = 2          // Radius der Helix
helixHeightIncrement = 0.1 // Vertikaler Abstand zwischen den Würfeln in der Helix
helixRotationSpeed = 1   // Geschwindigkeit der Helix-Rotation um die Y-Achse

cubeNames = []
for i in range(1, numCubes)
    cubeNames.push(cubeBaseName + i)
end for

// Initiale Skalierung aller Würfel
for i in range(0, numCubes - 1)
    currentCubeName = cubeNames[i]
    scaleObject currentCubeName, cubeScale, cubeScale, cubeScale
end for

startTime = time // Speichert die Startzeit der Animation

// Hauptanimationsschleife für die Helix-Bewegung
// Die Schleife läuft, solange die verstrichene Zeit weniger als 20 Sekunden beträgt.
while (time - startTime) < 20
    currentTime = time

    // Berechnung der aktuellen Rotation der gesamten Helix
    currentHelixRotation = currentTime * helixRotationSpeed

    for i in range(0, numCubes - 1)
        currentCubeName = cubeNames[i]

        // Berechnung des Winkels für den aktuellen Würfel in der Helix
        // 2 * pi für einen vollen Kreis
        angle = (i / numCubes) * 2 * pi + currentHelixRotation

        // Berechnung der X-, Y- und Z-Positionen für die Helix
        // X und Z basieren auf Sinus und Kosinus für die Kreisbewegung
        // Y inkrementiert linear für die spiralförmige Bewegung
        posX = helixRadius * cos(angle)
        posY = i * helixHeightIncrement
        posZ = helixRadius * sin(angle)

        // Würfel an die berechnete Position verschieben
        moveObject currentCubeName, posX, posY, posZ
    end for

    // yield // Dieses Statement wurde entfernt
end while
