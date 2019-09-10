Gain master => dac;
// Sound chain envelope
SawOsc mod => SawOsc car => ADSR env_one => master;
(0.3::second, 0.15::second, 0.1, 0.2::second) => env_one.set;
// set sync mode to FM (2)
2 => car.sync;

// Sound chain rope
Noise nois => ADSR env_two => Delay d => master; 
// Feedback loop
d => d;
// Attenuation
0.99 => d.gain;
(0.005::second, 0.001::second, 0.0, 0.001::second) => env_two.set;

/* Sound chain sample */
SndBuf heartBeat => master;
// Connect directory with path file
// and open sound file 
me.dir() + "/audio/heartbeat.wav" => heartBeat.read;
// Set playhead to end so no sound is made
heartBeat.samples() => heartBeat.pos;

fun void envelopeOne() {
    while (true) {
        Math.random2f(100.0, 1000.0) => car.freq;
        <<<"Car: ",car.freq()>>>;
        Math.random2f(100.0, 1000.0) => mod.freq;
        <<<"Mod: ",mod.freq()>>>;
        Math.random2(1000, 10000) => mod.gain; 
        <<<"Gain: ",mod.gain()>>>;
        // Turns envelpe on
        1 => env_one.keyOn;
        // Advance time 
        1.5::second => now;

        //Turns envelope off
        1 => env_one.keyOff;
        //Advance time
        1.0::second => now;
    }
}

fun void envelopeTwo() {
    while (true) {
        Math.random2f(0.001, 0.004)::second => d.delay;
        // Turns envelpe on
        1 => env_two.keyOn;
        //Advance time
        Math.random2f(0.2, .5)::second => now;
    } 
}

fun void heart() {
    while (true) {
        0 => heartBeat.pos;
        1000::ms => now;
    }
}

// MAIN POGRAM
//envelopeOne();
//envelopeTwo();
heart();

