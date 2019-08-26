
// TECHNO SONG

// Author: Elohim Guevara

// Sound chain 
Gain master => Pan2 panning => dac;
SndBuf clap => master;
SndBuf cowbell => master;
SndBuf hihat => master;
SndBuf kick => master;
SndBuf snare => master;
SndBuf2 stereo => master;


// Variable for track duration
now + 30::second => time duration;
// Set gain
.4 => master.gain;
// Declare pan position value
float panPosition;

// Load soundfiles into sndbuf and sndbuf2
me.dir() + "/audio/clap_01.wav" => clap.read;
me.dir() + "/audio/cowbell_01.wav" => cowbell.read;
me.dir() + "/audio/hihat_03.wav" => hihat.read;
me.dir() + "/audio/kick_04.wav" => kick.read;
me.dir() + "/audio/snare_02.wav" => snare.read;
me.dir() + "/audio/stereo_fx_04.wav" => stereo.read;

// Set all playheads to end so no sound is made
clap.samples() => clap.pos;
clap.samples() => int numSamplesClap;
cowbell.samples() => cowbell.pos;
cowbell.samples() => int numSamplesCowbell;
hihat.samples() => hihat.pos;
kick.samples() => kick.pos;
snare.samples() => snare.pos;
stereo.samples() => stereo.pos;

// MAIN PROGRAM
if (true) {
    for (0 => int i; i < 6; i++) {
        sequencer();
    }
}

// Function sequencer
fun void sequencer() {
    0 => int counter;
    while (counter < 12) {
        counter%12 => int beat;
        if (beat == 0 || beat == 11) { // Block 1
            
            0 => clap.pos;
            .5 => clap.rate;
            // Initialize pan position value to right channel
            1.0 => float panPosition;
            panPosition => panning.pan; 
            
            if (beat == 11) {    
                // Set playhead position
                numSamplesClap => clap.pos;
                // Set rate -negative for reverse 
                -1.0 => clap.rate;
            }
            // Advance time
            250::ms => now;
        }
        
        if (beat == 1 || beat == 10) { // Block 2
            
            0 => hihat.pos;
            .5 => hihat.rate;
            
            0 => kick.pos;
            .6 => kick.rate;
            
            0 => snare.pos;
            .6 => snare.rate;
            panPosition => panning.pan;
            // Advance time
            250::ms => now;
        }
        
        if (beat == 2 || beat == 9) { // Block 3
            
            0 => stereo.pos;
            1.7 => stereo.rate;
            if (beat == 9) {
                Math.random2f(.5, 1.2) => stereo.rate;
            }
            // Advance time
            250::ms => now;
        }
        
        if (beat == 3 || beat == 8) { // Block 4
            
            0 => kick.pos;
            .6 => kick.rate;
            // Advance time
            1000::ms => now;
            
            0 => cowbell.pos;
            .3 => cowbell.rate;
            // Advance time
            250::ms => now;
        }
        
        if (beat == 4 || beat == 7) { // Block 5
            
            0 => snare.pos;
            .6 => snare.rate;
            if (beat == 4) {
                Math.random2f(.8, 1.2) => snare.rate;
            }
            // Advance time
            250::ms => now;
        }
        
        if (beat == 5 || beat == 6) { // Block 6
            
            0 => cowbell.pos;
            .3 => cowbell.rate;
            // Initialize pan position value to left channel
            -1.0 => float panPosition;
            panPosition => panning.pan; 
            
            if (beat == 6) {    
                // Set playhead position
                numSamplesCowbell => clap.pos;
                // Set rate -negative for reverse 
                -1.0 => cowbell.rate;
            }
            // Advance time
            250::ms => now;
        }
        <<< "Counter: ", counter, "Beat: ", beat >>>;
        counter++;
    }
    <<< "time left:", (duration - now) / second >>>;
}





