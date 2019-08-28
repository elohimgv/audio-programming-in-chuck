// Sound chain - UGen's
Gain master => dac;
SndBuf clap => master;
SndBuf click => master;
SndBuf hihat => master;
SndBuf kick => master;
SndBuf snare => master;
SndBuf2 stereo => master;
SawOsc saw => Gain masterSaw => dac.chan(0);
SinOsc sin => Gain masterSin => dac.chan(1);

// Global variables
0.5 => master.gain;
0.0 => masterSaw.gain;
0.0 => masterSin.gain;

[1,0,1,0,1,0,1,0,1] @=> int clap_ptrn_1[];
[0,1,0,1,0,1,0,0,1] @=> int clap_ptrn_2[];
[0,0,1,0,0,1,0,0,1] @=> int click_ptrn_1[];
[1,1,0,1,1,0,1,1,0] @=> int click_ptrn_2[];
[1,1,1,0,0,1,1,1,0] @=> int hihat_ptrn_1[];
[0,0,0,1,1,0,0,1,1] @=> int hihat_ptrn_2[];
[1,1,1,1,1,0,0,1,1] @=> int kick_ptrn_1[];
[0,0,1,1,1,1,0,1,0] @=> int kick_ptrn_2[];
[0,1,1,0,0,0,1,1,0] @=> int snare_ptrn_1[];
[1,1,0,1,0,1,0,1,1] @=> int snare_ptrn_2[];

[0,1,0,1,0,1,0,1,0] @=> int sawOsc_ptrn_1[];
[1,0,1,0,1,0,1,0,1] @=> int sawOsc_ptrn_2[];
[0,1,0,1,0,1,0,1,0] @=> int sinOsc_ptrn_1[];
[1,0,1,0,1,0,1,0,1] @=> int sinOsc_ptrn_2[];


// Load soundfiles into sndbuf and sndbuf2
me.dir() + "/audio/clap_01.wav" => clap.read;
me.dir() + "/audio/click_05.wav" => click.read;
me.dir() + "/audio/hihat_03.wav" => hihat.read;
me.dir() + "/audio/kick_03.wav" => kick.read;
me.dir() + "/audio/snare_03.wav" => snare.read;
me.dir() + "/audio/stereo_fx_04.wav" => stereo.read;

// Set all playheads to end so no sound is made
clap.samples() => clap.pos;
click.samples() => click.pos;
hihat.samples() => hihat.pos;
kick.samples() => kick.pos;
snare.samples() => snare.pos;
stereo.samples() => stereo.pos;

// MAIN PROGRAM
while (true) {
    //granularized(110);
    // Procedural :: ABA form
    expressiveness(clap_ptrn_1, click_ptrn_2, hihat_ptrn_1, kick_ptrn_2, snare_ptrn_1, .3);
    //recursive();
    //playChord();
}

// Functions...
fun void granularized(int steps) {
    // samples/steps => grain.size
    stereo.samples() / steps => int grain;
    // Randomly set grain position
    Math.random2(0, stereo.samples()) => stereo.pos;
    // Advance time 
    grain::samp => now;
}

fun void expressiveness(int clapArray[], int clickArray[], int hihatArray[], int kickArray[], int snareArray[], float beatTime) {
    // Sequencer... beats...
    for (0 => int i; i < clapArray.cap(); i++) {
        // if 1 in array then play clap
        if (clapArray[i] == 1) {
            0 => clap.pos;
        }
        
        // if 1 in array then play click
        if (clickArray[i] == 1) {
            0 => click.pos;
        }
        
        // if 1 in array then play hihat
        if (hihatArray[i] == 1) {
            0 => hihat.pos;
        }
        
        // if 1 in array then play kick
        if (kickArray[i] == 1) {
            0 => kick.pos;
        }
        
        // if 1 in array then play snare
        if (snareArray[i] == 1) {
            0 => snare.pos;
        }
        beatTime::second => now;
    }
}

fun int recursive() { // Name: "recursive()" is for a while
    
}

fun void playChord() {
    
}
