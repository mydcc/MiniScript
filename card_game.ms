cards = ["s1", "s2", "s3", "s4", "s5", "s6", "s7", "s8", "s9", "s10", "s11", "s12", "s13", "d1", "d2", "d3", "d4", "d5", "d6", "d7", "d8", "d9", "d10", "d11", "d12", "d13", "h1", "h2", "h3", "h4", "h5", "h6", "h7", "h8", "h9", "h10", "h11", "h12", "h13", "c1", "c2", "c3", "c4", "c5", "c6", "c7", "c8", "c9", "c10", "c11", "c12", "c13"]
for i in range(0, 52, 0.1)
    x = (i / 13) * 1 + i % 13 -100
    z = (i / 13) * 1.6 - 256
    rotateObject cards[i], 0, -3+rnd*6, 0
    moveObject cards[i], x, 0.00142, z
end for
cards.shuffle
wait
for i in range(0, 52, 0.1)
    rotateObject cards[i], 0, - 1 + rnd * 2, 0
    moveObject cards[i], -100, i * 0.00142, -256
end for
wait 0.2
for i in range(0, 52, 0.1)
    rotateObject cards[i], 180, -1 + rnd * 2, 0
end for