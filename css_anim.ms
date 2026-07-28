// -----------------------------------------------------------
// KONFIGURATION
// -----------------------------------------------------------
worldScale = 0.015 
timeSpeed = 1.0 
baseUnit = 0.1
sunRad = 72    
rFactor = 2

// -----------------------------------------------------------
// EINSTELLUNGEN FÜR UMLAUFBAHNEN (PATHS)
// (Die Linien, auf denen die Planeten laufen)
// -----------------------------------------------------------
pathScaleFix = 1.0       // Größen-Korrektur für Bahnen
pathRotation = [90, 0, 0] // Rotation für Bahnen (90=flach liegend)
pathHeight = 1.0         // Dicke der Linie (Y-Achse)

// -----------------------------------------------------------
// EINSTELLUNGEN FÜR PLANETEN-RINGE
// (Saturn-Ringe, Uranus-Ringe, etc.)
// -----------------------------------------------------------
ringScaleFix = 1.0       // Größen-Korrektur für Ringe
ringRotation = [90, 0, 0] // Rotation für Ringe (Anpassen falls sie senkrecht stehen)
ringHeight = 1.0         // Dicke der Ringe

// -----------------------------------------------------------
// HELPER FUNKTIONEN
// -----------------------------------------------------------

applySize = function(objName, cssRadius)
	if cssRadius == null then return
	realSize = cssRadius * 2 * worldScale
	scaleObject objName, realSize, realSize, realSize
end function

// Skalierung für ORBIT-PFADE
applyPathSize = function(objName, cssRadius)
	if cssRadius == null then return
	diameter = cssRadius * 2 * worldScale * pathScaleFix
	// Pfade skalieren wir nur in X und Z (Breite/Tiefe), Y bleibt fix
	scaleObject objName, diameter, pathHeight, diameter
end function

// Skalierung für PLANETEN-RINGE (Neu & Getrennt)
applyRingSize = function(objName, cssRadius)
	if cssRadius == null then return
	diameter = cssRadius * 2 * worldScale * ringScaleFix
	// Ringe skalieren wir auch flach
	scaleObject objName, diameter, ringHeight, diameter
end function

makePlanet = function(name, orbSeconds, cssOrbitRad, cssSizeRad, moonList=null, ringList=null)
	p = {}
	p.name = name
	p.period = orbSeconds * baseUnit
	p.radius = (cssOrbitRad * rFactor) + sunRad
	p.size = cssSizeRad
	p.moons = moonList
	p.rings = ringList
	
	applySize name, cssSizeRad
	
	// Erstelle die Bahn (Orbit-Linie) mit PATH-Einstellungen
	pathName = name + "-path"
	applyPathSize pathName, p.radius 
	// Bahn fix auf 0,0,0 (Sonne) und Path-Rotation
	moveObject pathName, 0, 0, 0 
	rotateObject pathName, pathRotation[0], pathRotation[1], pathRotation[2]
	
	return p
end function

makeMoon = function(name, orbSeconds, orbitRad, cssSizeRad)
	m = {}
	m.name = name
	m.period = orbSeconds * baseUnit
	m.radius = orbitRad
	m.size = cssSizeRad
	applySize name, cssSizeRad
	return m
end function

makeRing = function(name, cssSizeRad)
	r = {}
	r.name = name
	r.size = cssSizeRad
	
	// Nutze jetzt die RING-Spezifischen Einstellungen
	applyRingSize name, cssSizeRad
	rotateObject name, ringRotation[0], ringRotation[1], ringRotation[2]
	
	return r
end function

// -----------------------------------------------------------
// SYSTEM INITIALISIERUNG
// -----------------------------------------------------------

applySize "sun", sunRad
moveObject "sun", 0, 0, 0

system = []
// 1. Mercury
system.push makePlanet("mer", 8.8, 6, 1.75)
// 2. Venus
system.push makePlanet("ven", 22.5, 9, 2.75)
// 3. Earth
moonsEarth = [makeMoon("lune", 2.7, 7, 1)]
system.push makePlanet("ear", 36.5, 15, 3.5, moonsEarth)
// 4. Mars
moonsMars = [makeMoon("pho", 1.5, 7, 0.5), makeMoon("dem", 2.0, 9, 0.5)]
system.push makePlanet("mar", 68.7, 23, 3.0, moonsMars)

// 5. Jupiter
jupR = 35
moonsJup = []
moonsJup.push makeMoon("io", 2.0, jupR + 4, 1)
moonsJup.push makeMoon("eur", 3.5, jupR + 6, 1)
moonsJup.push makeMoon("gan", 7.0, jupR + 10, 1)
moonsJup.push makeMoon("cal", 16.5, jupR + 18, 1)
ringsJup = [makeRing("spot", 6)] 
system.push makePlanet("jup", 433.2, 78, 35.0, moonsJup, ringsJup)

// 6. Saturn
ringsSat = []
ringsSat.push makeRing("f-ring", 66.5)
ringsSat.push makeRing("a-ring", 59.5)
ringsSat.push makeRing("b-ring", 52.0)
ringsSat.push makeRing("c-ring", 47.5)
system.push makePlanet("sat", 1075.9, 145, 29.0, null, ringsSat)

// 7. Uranus
ringsUra = [makeRing("e-ring", 38)]
system.push makePlanet("ura", 3068.7, 288, 13.0, null, ringsUra)
// 8. Neptune
ringsNep = [makeRing("spot_nep", 4)] 
system.push makePlanet("nep", 6019, 450, 12.0, null, ringsNep)
// 9. Pluto
system.push makePlanet("plu", 9046.5, 587, 1.5)

// -----------------------------------------------------------
// ANIMATIONS-LOOP
// -----------------------------------------------------------

getPos = function(t, p, r, cx, cz)
	angle = (t / p) * 2 * pi
	x = cx + cos(angle) * r * worldScale
	z = cz + sin(angle) * r * worldScale
	return [x, 0, z]
end function

t = 0

while true
	for p in system
		// 1. Planet bewegen
		posP = getPos(t, p.period, p.radius, 0, 0)
		moveObject p.name, posP[0], 0, posP[2]
		
		// 2. Ringe (folgen Planet EXAKT, kein Offset)
		if p.rings != null then
			for rObj in p.rings
				moveObject rObj.name, posP[0], 0, posP[2]
			end for
		end if
		
		// 3. Monde (kreisen um Planet)
		if p.moons != null then
			for m in p.moons
				posM = getPos(t, m.period, m.radius, posP[0]/worldScale, posP[2]/worldScale)
				moveObject m.name, posM[0], 0, posM[2]
			end for
		end if
	end for

	wait 0.01
	t = t + (0.01 * timeSpeed)
end while