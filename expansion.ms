numCubes = 100
cubeBaseName = "Cube"
cubeScale = 0.25 // Einheitliche Skalierung für alle Würfel

// Gitter-Parameter
gridSize = 10 // Annahme: 10x10 Gitter für 100 Würfel
initialSpacing = 0.35 // Initialer Abstand zwischen den Würfeln im Gitter

// Expansions-Parameter
expansionAmplitude = 2 // Maximale Ausdehnung vom initialen Abstand
expansionSpeed = 1     // Geschwindigkeit der Expansion/Kontraktion
gridYPos = 0.5         // Feste Y-Position des Gitters

cubeNames = []
for i in range(1, numCubes)
    cubeNames.push(cubeBaseName + i)
end for

// Initiale Skalierung aller Würfel
for i in range(0, numCubes - 1)
    currentCubeName = cubeNames[i]
    scaleObject currentCubeName, cubeScale, cubeScale, cubeScale
end for

// Hauptanimationsschleife für das expandierende/kontrahierende Gitter
while true
    currentTime = time

    // Berechnung des Expansionsfaktors
    // sin() + 1 normalisiert den Bereich auf 0 bis 2, /2 auf 0 bis 1
    // Dies wird dann mit der Amplitude multipliziert und zum initialen Abstand addiert.
    currentExpansionFactor = initialSpacing + expansionAmplitude * (sin(currentTime * expansionSpeed) + 1) / 2

    for i in range(0, numCubes - 1)
        currentCubeName = cubeNames[i]

        // Berechnung der Reihe und Spalte im Gitter
        row = floor(i / gridSize) // Ganzzahlige Division für die Reihe
        col = i % gridSize        // Modulo für die Spalte

        // Berechnung der X- und Z-Positionen basierend auf Gitter und Expansion
        // Zentrierung des Gitters um 0,0
        posX = (col - (gridSize - 1) / 2) * currentExpansionFactor
        posZ = (row - (gridSize - 1) / 2) * currentExpansionFactor

        // Würfel an die berechnete Position verschieben
        moveObject currentCubeName, posX, gridYPos, posZ
    end for

    // yield // Dieses Statement bleibt entfernt, wie gewünscht
end while
