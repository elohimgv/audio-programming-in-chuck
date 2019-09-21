// Sound network
SndBuf heartBeat => dac;

// Connect directory with path file and open sound file
me.dir() + "/audio/heartbeat.wav" => heartBeat.read;
// Set playhead to end so no sound is made
heartBeat.samples() => heartBeat.pos;

// Play the sound
0 => heartBeat.pos;
// Advanced time
500::ms => now;

