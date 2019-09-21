// Sound network
Sitar sitar => dac;

0 => int counter;
while (counter < 12) {
    // Sitar control parameters
    Math.random2(156, 347) => sitar.freq; 
    sitar.noteOn(1);
    Math.random2f(.10,.5)::second => now;
    sitar.noteOn(0);
    
    counter++;
}


