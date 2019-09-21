// Sound network
SndBuf heartBeat => dac;

// Connect directory with path file and open sound file
me.dir() + "/audio/heartbeat.wav" => heartBeat.read;
// Set playhead to end so no sound is made
heartBeat.samples() => heartBeat.pos;

// Function
fun void heartOut() {
    1.0 => float volume;
    0 => int counter;
    while (counter < 10) {
        0 => heartBeat.pos;
        volume => heartBeat.gain;
        1000::ms => now;
        // Fade out
        0.1 -=> volume;
        counter++;
    }
}

// MAIN PROGRAM
heartOut();
