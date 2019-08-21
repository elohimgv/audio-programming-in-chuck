// Sound chain
SawOsc saw => dac.left;
SinOsc sin => dac.right;

// GLOBAL VARIABLES //
// Variable for track duration
now + 30::second => time duration;

// Array
[64,83,3,55,59,77,79,81,78] @=> int notes[];

// MAIN PROGRAM
0 => int count;
24 => int rep;
while (count < rep) {
    <<< "time left:", (duration - now) / second >>>;
    if (count <= 1 && count < 6) { // 0- 2
        //pieceOne();
        pieceTwo();
        //pieceThree();
        //pieceFour();
        if (true) {
            pieceOne();
            //pieceTwo();
            //pieceThree();
            //pieceFour();
        }
    } else if (count <= 8 && count < 14) { // 3 - 6
        //pieceOne();
        //pieceTwo();
        pieceThree();
        //pieceFour();
        if (true) {
            //pieceOne();
            //pieceTwo();
            //pieceThree();
            pieceFour();
        }
    } else if (count <= 16 && count < 18) { // 7 - 8
        pieceOne();
        //pieceTwo();
        //pieceThree();
        //pieceFour();
        if (true) {
            //pieceOne();
            pieceTwo();
            //pieceThree();
            //pieceFour();
        }
    } else { // 9 - 11
        //pieceOne();
        //pieceTwo();
        //pieceThree();
        pieceFour();
        if (true) {
            //pieceOne();
            pieceTwo();
            //pieceThree();
            //pieceFour();
        }
    }
    count++;
}
        
fun void pieceOne() {
    for (0 => int i; i < notes.cap(); i++) {
        <<<"Piece one">>>; // Print function name
        <<< i, notes[i] >>>; // Print index and value
        Std.mtof(notes[i]) => saw.freq; // Set frequency
        Std.mtof(notes[i]) => sin.freq; // Set frequency 
        250::ms => now; // Advance time
   }
} 

fun void pieceTwo() {
    <<<"Piece two">>>; // Print function name
    <<<Math.random2(notes[0], notes[7])>>>; // Print note
    Std.mtof(Math.random2(notes[0], notes[7])) => saw.freq; // Set frequency
    Std.mtof(Math.random2(notes[2], notes[5])) => sin.freq; // Set frequency 
    250::ms => now; // Advance time
}

fun void pieceThree() {
    <<<"Piece three">>>; // Print function name
    <<<Math.log2(notes[8])>>>; // Print note
    Math.log2(notes[8]) => saw.freq;
    .2 => sin.gain; // Set volume
    250::ms => now; // Advance time
}

fun void pieceFour() {
    <<<"Piece four">>>; // Print function name
    <<<Math.log2(notes[7])>>>; // Print note
    Math.log2(notes[7]) => sin.freq;
    .3 => saw.gain; // Set volume
    250::ms => now; // Advance time
}



