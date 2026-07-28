worldScale = 0.05
// Initial speed value (dynamically changed in the loop)
timeSpeed = 0.025
baseUnit = 0.1
sunRad = 72
rFactor = 2

systemY = 2.0
spinFactor = 50.0

// PATH SETTINGS
pathScale = 1.0
basePathRot = 90 
pathHeight = 1.0

// RING & MOON SETTINGS
ringScale = 1.0
ringRotation = [90, 0, 0]
ringHeight = 0.01
moonScale = 1.5

// -----------------------------------------------------------
// HELPER FUNCTIONS
// -----------------------------------------------------------

applySize = function(objName, Radius)
	if Radius == null then return
	realSize = Radius * 2 * worldScale
	scaleObject objName, realSize, realSize, realSize
end function

applyPathSize = function(objName, Radius)
	if Radius == null then return
	diameter = Radius * 2 * worldScale * pathScale
	scaleObject objName, diameter, pathHeight, diameter
end function

applyRingSize = function(objName, Radius)
	if Radius == null then return
	diameter = Radius * 2 * worldScale * ringScale
	scaleObject objName, diameter, diameter, ringHeight
end function

applyMoonSize = function(objName, Radius)
	if Radius == null then return
	diameter = Radius * 2 * worldScale * moonScale
	scaleObject objName, diameter, diameter, diameter
end function

makePlanet = function(name, orbSeconds, OrbitRad, SizeRad, spinSpeed, inclination, moonList=null, ringList=null)
	p = {}
	p.name = name
	p.period = orbSeconds * baseUnit
	p.radius = (OrbitRad * rFactor) + sunRad
	p.size = SizeRad
	p.spinSpeed = spinSpeed
	p.inclination = inclination
	p.moons = moonList
	p.rings = ringList
	
	applySize name, SizeRad
	
	pathName = name + "-path"
	applyPathSize pathName, p.radius
	moveObject pathName, 0, systemY, 0
	
	// Tilt the path around the X-axis
	tilt = basePathRot - inclination
	rotateObject pathName, tilt, 0, 0
	
	return p
end function

makeMoon = function(name, orbSeconds, orbitRad, size, spinSpeed)
	m = {}
	m.name = name
	m.period = orbSeconds * baseUnit
	m.radius = orbitRad
	m.size = size
	m.spinSpeed = spinSpeed
	applyMoonSize name, size
	return m
end function

makeRing = function(name, SizeRad)
	r = {}
	r.name = name
	r.size = SizeRad
	applyRingSize name, SizeRad
	rotateObject name, ringRotation[0], ringRotation[1], ringRotation[2]
	return r
end function

// -----------------------------------------------------------
// INITIALIZATION
// -----------------------------------------------------------
applySize "sun", sunRad
moveObject "sun", 0, systemY, 0

system = []

// 1. MERCURY
system.push makePlanet("mer", 8.8, 6, 1.75, 0.017, 7.0)

// 2. VENUS
system.push makePlanet("ven", 22.5, 9, 2.75, -0.004, 3.4)

// 3. EARTH
moonsEarth = [makeMoon("lune", 2.7, 7, 1.0, 0.037)]
system.push makePlanet("ear", 36.5, 15, 3.5, 1.0, 0.0, moonsEarth)

// 4. MARS
moonsMars = [makeMoon("pho", 1.5, 7, 0.3, 3.1), makeMoon("dem", 2.0, 9, 0.2, 0.8)]
system.push makePlanet("mar", 68.7, 23, 3.0, 0.97, 1.85, moonsMars)

// 5. JUPITER
jupR = 35
moonsJup = []
moonsJup.push makeMoon("io", 2.0, jupR + 4, 1.2, 0.58)
moonsJup.push makeMoon("eur", 3.5, jupR + 6, 1.0, 0.28)
moonsJup.push makeMoon("gan", 7.0, jupR + 10, 1.8, 0.14)
moonsJup.push makeMoon("cal", 16.5, jupR + 18, 1.6, 0.06)
ringsJup = [makeRing("spot", 6)]
system.push makePlanet("jup", 433.2, 78, 35.0, 2.44, 1.3, moonsJup, ringsJup)

// 6. SATURN
ringsSat = []
ringsSat.push makeRing("f-ring", 66.5)
ringsSat.push makeRing("a-ring", 59.5)
ringsSat.push makeRing("b-ring", 52.0)
ringsSat.push makeRing("c-ring", 47.5)
system.push makePlanet("sat", 1075.9, 145, 29.0, 2.22, 2.5, null, ringsSat)

// 7. URANUS
ringsUra = [makeRing("e-ring", 38)]
system.push makePlanet("ura", 3068.7, 288, 13.0, -1.39, 0.8, null, ringsUra)

// 8. NEPTUNE
ringsNep = [makeRing("spot_nep", 4)]
system.push makePlanet("nep", 6019, 450, 12.0, 1.49, 1.8, null, ringsNep)

// 9. PLUTO
system.push makePlanet("plu", 9046.5, 587, 1.5, -0.15, 17.0)


// -----------------------------------------------------------
// 3D POSITION CALCULATION
// -----------------------------------------------------------
getPos3D = function(t, p, r, cx, cy, cz, inclination)
	angle = (t / p) * 2 * pi
	
	rawX = cos(angle) * r * worldScale
	rawZ = sin(angle) * r * worldScale
	
	// Convert degrees to radians
	incRad = inclination * (pi / 180)
	
	finalX = rawX
	finalY = -(rawZ * sin(incRad))
	finalZ = rawZ * cos(incRad)
	
	return [cx + finalX, cy + finalY, cz + finalZ]
end function

t = 0

while true
	for p in system
		// 1. Planet Orbit
		posP = getPos3D(t, p.period, p.radius, 0, systemY, 0, p.inclination)
		
		moveObject p.name, posP[0], posP[1], posP[2]
		
		spinAngle = (t * p.spinSpeed * spinFactor) % 360
		rotateObject p.name, 0, spinAngle, 0
		
		if p.rings != null then
			for rObj in p.rings
				moveObject rObj.name, posP[0], posP[1], posP[2]
			end for
		end if
		
		if p.moons != null then
			for m in p.moons
				// Calculate moon position relative to planet
				posM = getPos3D(t, m.period, m.radius, posP[0], posP[1], posP[2], 0)
				moveObject m.name, posM[0], posM[1], posM[2]
				
				moonSpin = (t * m.spinSpeed * spinFactor) % 360
				rotateObject m.name, 0, moonSpin, 0
			end for
		end if
	end for

	// TIME PULSE (NEW): Gentle breathing of the simulation speed
	// Base 0.025 +/- 0.02
	timeSpeed = 0.025 + sin(t * 20) * 0.02

	wait 0.01
	t = t + (0.01 * timeSpeed)
end while
// https://codepen.io/tadywankenobi/pen/QbWNGR/