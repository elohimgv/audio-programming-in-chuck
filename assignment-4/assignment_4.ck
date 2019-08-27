// Sound chain - UGen's
Gain master => dac;
SndBuf clap => master;
SndBuf click => master;
SndBuf hihat => master;
SndBuf kick => master;
SndBuf snare => master;
SndBuf2 stereo => master;
SqrOsc sqr => Gain masterSqr => dac.chan(0);
SinOsc sin => Gain masterSin => dac.chan(1);

// Global variables
0.0 => masterSqr.gain;
0.0 => masterSin.gain;


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
    granularized(110);
    //expressiveness();
    //recursive();
    //playChord();
}
//granularized();
//expressiveness();
//recursive();
//playChord();

// Functions...
fun void granularized(int steps) {
    // samples/steps => grain.size
    stereo.samples() / steps => int grain;
    // Randomly set grain position
    Math.random2(0, stereo.samples()) => stereo.pos;
    // Advance time 
    grain::samp => now;
}

fun void expressiveness() {
    
}

fun int recursive() { // Name: "recursive()" is for a while
    
}

fun void playChord() {
    
}
