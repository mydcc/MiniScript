obj = "Cube1"
s = 1.0; e = 2.5; dur = 0.3

// Compact Bezier calculation (Hardcoded for 0.61, 1.0)
// Formula: 3(1-t)^2*t*0.61 + 3(1-t)t^2*1.0 + t^3
getVal = function(t); i=1-t; return 3*i*i*t*0.61 + 3*i*t*t + t*t*t; end function

t = 0
while t < dur
	// Progress (0 to 1)
	k = getVal(t / dur)
	// Lerp directly here: start + diff * k
	sc = s + (e - s) * k
	scaleObject obj, sc, sc, sc
	wait 0.01
	t = t + 0.01
end while

// Ensure final state
scaleObject obj, e, e, e

// 
// Optimized Glitch Function (P1=-800, P2=800)
//
obj = "Ball1"
x0 = 0; y0 = 100; z0 = 0
dX = 0.01; dY = 0.002

// Factored math: 2400 * t * (1-t) * (2t - 1) + t^3 (ignored t^3 as negligible)
g = function(t); return 2400 * t * (1-t) * (2*t - 1); end function

t = 0
while true
	// Calculate offsets: X cycles 1s, Y cycles 0.5s
	// (t % 0.5) * 2 normalizes the 0.5s loop to 0..1 range
	offX = dX * g(t % 1)
	offY = dY * g((t % 0.5) * 2)
	
	moveObject obj, x0 + offX, y0 + offY, z0
	wait 0.01; t = t + 0.01
end while

//
//
//
