// Sound network
SndBuf heartBeat => dac;

// Connect directory with path file and open sound file
me.dir() + "/audio/heartbeat.wav" => heartBeat.read;
// Set playhead to end so no sound is made
heartBeat.samples() => heartBeat.pos;

// Function
fun void heartIn() {
    0.0 => float volume;
    0 => int counter;
    while (counter < 10) {
        0 => heartBeat.pos;
        volume => heartBeat.gain;
        1000::ms => now;
        // Fade in
        0.1 +=> volume;
        counter++;
    }
}

// MAIN PROGRAM 

// Play the sound
0 => heartBeat.pos;
// Advanced time
500::ms => now;

// No sound
.6::second => now;

// Play the sound
0 => heartBeat.pos;
// Advanced time
500::ms => now;

// No sound
.6::second => now;

heartIn();
