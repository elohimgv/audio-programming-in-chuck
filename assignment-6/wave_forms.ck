// GLOBAL VARIABLES //
// Sound network
SinOsc sineWave;
TriOsc triangleWave;
// Set volume
sineWave.gain;
triangleWave.gain;
// Array of notes
[64,83,13,55,59,77,79,81,78] @=> int notes[];

// Functions
fun void playSineWave() {
    // Sound network
    SinOsc sineWave => dac;
    .5 => sineWave.gain; // Turn on the volume
    // Goes forward
    for (0 => int i; i < notes.cap(); i++) {
        <<<notes[i]>>>;
        Math.mtof(notes[i]) => sineWave.freq;
        190::ms => now;
    }
        
    0 => sineWave.gain; // Turn off the volume
}

fun void sequencerSineWave() {
    SinOsc sineWave => dac;
    .5 => sineWave.gain;
    0 => int counter;
    while (counter < 10) {
        counter%10 => int beat;
        // index 0-3
        if (beat == 0 || beat == 2) { 
            Math.mtof(notes[3]) => sineWave.freq;
            190::ms => now;
        }
        
        if (beat == 1 || beat == 3) {
            Math.mtof(notes[2]) => sineWave.freq;
            190::ms => now;
        }
        
        if (beat == 2 || beat == 4) {
            Math.mtof(notes[1]) => sineWave.freq;
            190::ms => now;
        }
        
        if (beat == 3 || beat == 5) {
            Math.mtof(notes[0]) => sineWave.freq;
            190::ms => now;
        }
        
        // index 4-8
        if (beat == 4 || beat == 6) { 
            
            if (beat == 6) {
                Math.mtof(notes[5]) => sineWave.freq;
                190::ms => now;
            } else {
                Math.mtof(notes[4]) => sineWave.freq;
                190::ms => now;
            }
            
        }
        
        if (beat == 5 || beat == 7) {
            Math.mtof(notes[6]) => sineWave.freq;
            190::ms => now;
        }
        
        if (beat == 6 || beat == 8) {
            Math.mtof(notes[7]) => sineWave.freq;
            190::ms => now;
        }
        
        if (beat == 7 || beat == 9) {
            Math.mtof(notes[8]) => sineWave.freq;
            190::ms => now;
        } 
        counter++;
    }   
    0 => sineWave.gain;    
}

fun void playTriangleWave() {
    TriOsc triangleWave => dac;
    .5 => triangleWave.gain; // Turn on the volume
    // Goes backward
    for (notes.cap() => int i; i > 0; 1-=>i) {
        <<<notes[i-1]>>>;
        Math.mtof(notes[i-1]) => triangleWave.freq;
        190::ms => now;
       }
        
    0 => triangleWave.gain; // Turn off the volume
}

fun void sequencerTriangleWave() {
    TriOsc triangleWave => dac;
    .5 => triangleWave.gain;
    0 => int counter;
    while (counter < 10) {
        counter%10 => int beat;
        // index 0-3
        if (beat == 0 || beat == 2) { 
            Math.mtof(notes[3]) => triangleWave.freq;
            190::ms => now;
        }
        
        if (beat == 1 || beat == 3) {
            Math.mtof(notes[2]) => triangleWave.freq;
            190::ms => now;
        }
        
        if (beat == 2 || beat == 4) {
            Math.mtof(notes[1]) => triangleWave.freq;
            190::ms => now;
        }
        
        if (beat == 3 || beat == 5) {
            Math.mtof(notes[0]) => triangleWave.freq;
            190::ms => now;
        }
        
        // index 4-8
        if (beat == 4 || beat == 6) { 
            
            if (beat == 6) {
                Math.mtof(notes[5]) => triangleWave.freq;
                190::ms => now;
            } else {
                Math.mtof(notes[4]) => triangleWave.freq;
                190::ms => now;
            }
            
        }
        
        if (beat == 5 || beat == 7) {
            Math.mtof(notes[6]) => triangleWave.freq;
            190::ms => now;
        }
        
        if (beat == 6 || beat == 8) {
            Math.mtof(notes[7]) => triangleWave.freq;
            190::ms => now;
        }
        
        if (beat == 7 || beat == 9) {
            Math.mtof(notes[8]) => triangleWave.freq;
            190::ms => now;
        } 
        counter++;
    }   
    0 => triangleWave.gain;    
}

// MAIN PROGRAM
sequencerSineWave();
sequencerTriangleWave();
playSineWave();
playTriangleWave();

//spork ~ sequencerSineWave();
//spork ~ sequencerTriangleWave();

// To keep parent shred alive, in order for children to alive
while(true) 1::second => now;
