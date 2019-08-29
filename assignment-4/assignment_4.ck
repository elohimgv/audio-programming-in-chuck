// Sound chain - UGen's
Gain master => dac;
SndBuf clap => master;
SndBuf click => master;
SndBuf hihat => master;
SndBuf kick => master;
SndBuf snare => master;
SndBuf2 stereo => master;
SawOsc chord_1 => Gain masterChord_1 => dac.left;
SawOsc chord_2 => Gain masterChord_2 => dac.right;
SawOsc chord_3 => Gain masterChord_3 => dac.left;


// Global variables
.5 => master.gain;
.0 => masterChord_1.gain;
.0 => masterChord_2.gain;
.0 => masterChord_3.gain;

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

// Functions...
fun void granularized(int steps) {
    1 => master.gain;
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

fun void playChord(int root, string quality, float length) {
    // Use array to chuck unit generator to master
    1.0/3 => chord_1.gain;
    chord_1 => dac.left;
    1.0/3 => chord_2.gain;
    chord_2 => dac.right;
    1.0/3 => chord_3.gain;
    chord_3 => dac.left;
    // Function will make major or minor chords
    // Root
    Std.mtof(root) => chord_1.freq;
    
    // third 
    if (quality == "major") {
        Std.mtof(root + 4) => chord_2.freq;
    } else if (quality == "minor") {
        Std.mtof(root + 3) => chord_2.freq;
    } else {
        <<< "Must specify 'major' or 'minor'" >>>;
    }
    
    // fifth
    Std.mtof(root +7) => chord_3.freq;
    // Advance time    
    length::ms => now;
}

fun int cicle(int reps) { 
    if (reps == 1) {
        // when reach here, function has a way to end
        return 1;
    } else {
        sequencer();
        // recursive function calls itseld
        return cicle(reps - 1);
    }
}

fun void sequencer() {
    // Initialize counter variable
    0 => int counter;
        
    // loop
    while (counter < 8) {
        counter%8 => int beat;
        if (beat == 0 || beat == 3 || beat == 7) {
            granularized(110);
        }
            
        if (beat == 1 || beat == 6) {
            playChord(Math.random2(60, 72), "major", 250);
        }
            
        if (beat == 2 || beat == 5) {
            playChord(Math.random2(60, 72), "major", 250);
            // Procedural :: ABA form
            expressiveness(clap_ptrn_2, click_ptrn_1, hihat_ptrn_2, kick_ptrn_1, snare_ptrn_2, .2);
        }
            
        if (beat == 4) {
            expressiveness(clap_ptrn_1, click_ptrn_2, hihat_ptrn_1, kick_ptrn_2, snare_ptrn_1, .3);
        }
   }
}

// MAIN PROGRAM
cicle(10);


