// Sound network
SinOsc sin => dac;

// GLOBAL VARIABLES //
// Variable for track duration
now + 30::second => time duration;
440 => int note; 
// Set volume
.5 => sin.gain; 

// MAIN PROGRAM
for (0 => int i; i < 4; i++) {
    composition();
}

// Function composition
fun void composition() {
    for (note => int i; i < 540; 20 +=> i) { 
    <<< "time left:", (duration - now) / second >>>;
    // Set frequency
    i => sin.freq;
    <<<"First note: "+i>>>;
    // Advance time
    250::ms => now;
    
    i => int newNoteTwo;
    while(newNoteTwo > note) {
        // Set frequency
        newNoteTwo => sin.freq;
        <<<"Second note: "+newNoteTwo>>>;
        // Update value
        20 -=> newNoteTwo;
        // Advance time
        260::ms => now;
    }
    
    newNoteTwo => int newNoteThird;
    while (newNoteThird < 480) {
        // Set frequency 
        newNoteThird => sin.freq;
        <<<"Third note: "+newNoteThird>>>;
        // Update value
        30 +=> newNoteThird;
        // Advance time
        270::ms => now;
    }
  }
}
