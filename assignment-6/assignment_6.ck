
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
    .5 => triangleWaveOne.gain;
    // Goes forward
    for (0 => int i; i < notes.cap(); i++) {
        <<<notes[i]>>>;
        Math.mtof(notes[i]) => triangleWaveOne.freq;
        190::ms => now;
    }
        
    0 => triangleWaveOne.gain;
}

fun void playWaveTwo() {
    TriOsc triangleWaveTwo => dac;
    .5 => triangleWaveTwo.gain;
    // Goes backward
    for (notes.cap() => int i; i > 0; 1-=>i) {
        <<<notes[i-1]>>>;
        Math.mtof(notes[i-1]) => triangleWaveTwo.freq;
        190::ms => now;
       }
        
    0 => triangleWaveTwo.gain;
}

// MAIN PROGRAM
//playWaveOne();
playWaveTwo();












