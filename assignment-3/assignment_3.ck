// GLOBAL VARIABLES //
// Sound network
TriOsc triangleWaveOne;
TriOsc triangleWaveTwo;
// Set volume
triangleWaveOne.gain;
triangleWaveTwo.gain;
// Array of notes
[64,83,13,55,59,77,79,81,78] @=> int notes[];

// Functions
fun void playWaveOne() {
    // Sound network
    TriOsc triangleWaveOne => dac;
    .5 => triangleWaveOne.gain; // Turn on the volume
    // Goes forward
    for (0 => int i; i < notes.cap(); i++) {
        <<<notes[i]>>>;
        Math.mtof(notes[i]) => triangleWaveOne.freq;
        190::ms => now;
    }
        
    0 => triangleWaveOne.gain; // Turn off the volume
}

fun void playWaveTwo() {
    TriOsc triangleWaveTwo => dac;
    .5 => triangleWaveTwo.gain; // Turn on the volume
    // Goes backward
    for (notes.cap() => int i; i > 0; 1-=>i) {
        <<<notes[i-1]>>>;
        Math.mtof(notes[i-1]) => triangleWaveTwo.freq;
        190::ms => now;
       }
        
    0 => triangleWaveTwo.gain; // Turn off the volume
}

fun void sequencerOne() {
    TriOsc triangleWaveOne => dac;
    .5 => triangleWaveOne.gain;
    0 => int counter;
    while (counter < 10) {
        counter%10 => int beat;
        // index 0-3
        if (beat == 0 || beat == 2) { 
            Math.mtof(notes[3]) => triangleWaveOne.freq;
            190::ms => now;
        }
        
        if (beat == 1 || beat == 3) {
            Math.mtof(notes[2]) => triangleWaveOne.freq;
            190::ms => now;
        }
        
        if (beat == 2 || beat == 4) {
            Math.mtof(notes[1]) => triangleWaveOne.freq;
            190::ms => now;
        }
        
        if (beat == 3 || beat == 5) {
            Math.mtof(notes[0]) => triangleWaveOne.freq;
            190::ms => now;
        }
        
        // index 4-8
        if (beat == 4 || beat == 6) { 
            
            if (beat == 6) {
                Math.mtof(notes[5]) => triangleWaveOne.freq;
                190::ms => now;
            } else {
                Math.mtof(notes[4]) => triangleWaveOne.freq;
                190::ms => now;
            }
            
        }
        
        if (beat == 5 || beat == 7) {
            Math.mtof(notes[6]) => triangleWaveOne.freq;
            190::ms => now;
        }
        
        if (beat == 6 || beat == 8) {
            Math.mtof(notes[7]) => triangleWaveOne.freq;
            190::ms => now;
        }
        
        if (beat == 7 || beat == 9) {
            Math.mtof(notes[8]) => triangleWaveOne.freq;
            190::ms => now;
        } 
        counter++;
    }   
    0 => triangleWaveOne.gain;    
}

// MAIN PROGRAM
sequencerOne();
playWaveOne();
playWaveTwo();












