
// Sound chain - UGen's
Gain master => dac;
SndBuf clap => master;
SndBuf click => master;
SndBuf hihat => master;
SndBuf kick => master;
SndBuf snare => master;
SndBuf2 stereo => master;
SqrOsc sqr => master;
SinOsc sin => master;

// Global variables

// Load soundfiles into sndbuf and sndbuf2
me.dir() + "/audio/clap_01.wav" => clap.read;
me.dir() + "/audio/click_05.wav" => click.read;
me.dir() + "/audio/hihat_03.wav" => hihat.read;
me.dir() + "/audio/kick_03.wav" => kick.read;
me.dir() + "/audio/snare_03.wav" => snare.read;
me.dir() + "/audio/stereo_04.wav" => stereo.read;

// Set all playheads to end so no sound is made
clap.samples() => clap.pos;
click.samples() => click.pos;
hihat.samples() => hihat.pos;
kick.samples() => kick.pos;
snare.samples() => snare.pos;
stereo.smaples() => stereo.pos;

// MAIN PROGRAM
//granularized();
//expressiveness();
//recursive();
//playChord();

// Functions...
fun void granularized() {
    
}

fun void expressiveness() {
    
}

fun int recursive() { // Name: "recursive()" is for a while
    
}

fun void playChord() {
    
}
