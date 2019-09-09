// Sound chain envelope
SawOsc mod => SawOsc car => ADSR env_one => dac;

(0.3::second, 0.15::second, 0.1, 0.2::second) => env_one.set;
// set sync mode to FM (2)
2 => car.sync;

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

// MAIN POGRAM
envelopeOne();
