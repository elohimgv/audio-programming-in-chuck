# Introduction to Real Time Audio Programming in Chuck

I began this course in [Coursera](https://www.coursera.org) some years ago. I decided to delete all my files and rebuild my exercises one more time from scratch. Actually it is offer in [Kadenze](https://www.kadenze.com/courses/introduction-to-real-time-audio-programming-in-chuck/info) with other name: Introduction to Programming for Musicians and Digital Artist. 

Here you are my experiments and what I learned...

## What I Learned Each Week

### Week 1
First! what is programming? To me, programming is a serie of instructions to perfome some task on computer. Years ago it was a tool only for engineers, technologists, scientist but know is medium to express ourselves like visual artists, sound designers, game designers, educators etc.

It allow me explore my own ideas with a full control, thing that not happen in software tool that have boundaries. 

I use Chuck language to program and core features are:
* It is text-base syntax.
* Designed to play with time.
* Parallel logic -performe several task at the same time-

*Chuck is how to work with time.*

Now I am going to talk about more technical concepts like data types, control structures and waveforms that is a topic of sounds physics but implement in Chuck. 

#### Special object
One important thing to work with Chuck is ```dac``` object that means digital-to-analog converter, which is connected inside your computer to the output of your card (speakers, headphones, and the like).

#### Data types
Here we have primitive data types like: floating point, integers, strings, boolean values like in other classic language. The interesting point here is ```time``` and ```dur``` data types; they allow to work wiht **time**. ```time``` is just a point in **time** and ```dur``` is the length of time; for example the duration of my composition. Here there´s special keyword ```now``` to read or init the sequences of pices of coda that must be executed and modify or manipulate the count of time inside of Chuk, because we can show on concole in milliseconds, seconds, minutes, hours etc.

#### Control structures
Like in other languages:
Loops
```chuck
for (0 => int i; i < 3; i++) {
   some code goes here
}

0 => int i;
while (i < 3) {
   some code goes here   
   i++;
}
```
The difference is the assign operator, instead of ```=``` we have ```=>``` and the order in the syntax how to assign a value.
Classical example.
```chuck
int a = 0;
```
Chuck.
```chuck
0 => int a;
```
Statements
```chuck
if (true) {
   code goes here
}

if (true) {
   code goes here
} else {
   code goes here
}
```
Pretty the same to other programming languages.

#### Waveforms
In Chuck this are named Unite Generator (UGen); object the will generate the sound of a waveform.
Sine wave 
```chuck
SinOsc 
```
Square wave
```chuck
SqrOsc 
```
Triangle wave
```chuck
TriOsc 
```
Sawtooth wave
```chuck
SawOsc 
```
Thise are the keywords to make basic sounds with waveforms in Chuck. To learn a little a bit more visit [Wikipedia](https://en.wikipedia.org/wiki/Waveform).

Finally checkout my [artwork](https://github.com/elohimgv/audio-programming-in-chuck/blob/master/assignment-1/assignment_1.ck) :notes:

### Week 2
This week was focused on utility functions and arrays. First, we talk about MIDI; MIDI means *Musical Instrument Digital Interface* is a standard technologie that describe a protocol, a digital interface and connectors that allow several electronic musical instruments, computers and other devices related it connect and communication between it. MIDI notes goes throug 0-127, to build melodies we need transform MIDI values to frequencies to Chuck play the song. 

#### Utility functions
How say above, we need interchange MIDI to frquency and to do that have the utility function:
```chuck
Std.mtof(float value) // Converts MIDI note number to frequency (Hz) - output float

Std.ftom(float value) // Converts frequency (Hz) to MIDI note number space - output float
```
Others:

```chuck
Std.abs(int value) // Returns absolute value of integer number - output integer

Std.fabs(float value) // Returns absolute value of floating number - output float

Std.sgn(float value) // Computes sign of the input - output float 

Std.powtodb(float value) // Converts signal power ratio to decibels (dB) - output float

Std.rmstodb(float value) // Converts linear amplitude to decibels (dB) - output float

Std.dbtopow(float value) // Converts decibels (dB) to signal power ratio - output float

Std.dbtorms(float value) // Converts decibels (dB) to linear amplitude - output float

Std.atoi(string value) // Converts ascii (string) to integer (int) - output int

Std.atof(string value) // Converts ascii (string) to floating point value (float) - output float

Std.itoa(int value) // Converts integer (int) to ascii (string) - output string

Std.ftoa(float value) // Converts floating point value (float) to ascii (string)
```
#### Random numbers
An interesting tool for have variations (different values) in our compositions is random function. That provide volumen up and down or note change among others. For this we have Math library.
```chuck
Math.random(int value) // Generates random integer between 0 and Math.RANDOM_MAX - output int

Math.random2(int min, int max) // Generates random integer in the range [min, max] - output int

Math.randomf(float value) // Generates random floating point number in range [0, 1] - output float

Math.random2f(float min, float max) // Generates random floating point number int the range [min, max] - output float
```
Every time I run my program I have different values with random, what happen if I want the same series of number each time? The answer is:
```chuck
Math.srandom() // Ensure tha sequence of random numbers would be exactly the same across different executions of the same program.
```
#### More utility functions
```chuck
Math.hypot(float x, float y) // Computes the ecuclidean distance of the orthogonal vectors (x, 0) and (0, y) - output float

Math.pow(float x, float y) // Computes x taken to the y-th power - output float

Math.sqrt(float x) // Computes the nonnegative square root of x - output float

Math.exp(float x) // Computes e^x, the base-e exponential of x - output float

Math.log(float x) // Computes the natural logarithm of x - output float

Math.log2(float x) // Computes the logarithm of x to base 2 - output float

Math.log10(float x) // Computes the logarith of x to base 10 - output float

Math.floor(float x) // Round to largest integral value not greater than x -output float

Math.ceil(float x) // Round to smallest integral value not less than x - output float

Math.round(float x) // Round to nearest integral value - output float

Math.trunc(float x) // Round to largest integral value no greater in magnitud than x - output float

Math.fmod(float x) // Computes the reminder of x / y - ouput float

Math.min(float x) // Choose lesser of two values - ouput float

Math.max(float x, float y) // Choose greater of two values - output float

Math.nextpow2(float x) // Computes the integral smallest power of 2 greater the the value of x - output int
```
#### Audio panning
Pannig give me the opportunity to work with audio channel. For example on computer we have two speakers: one left and one right. How can manipulate it? well, Chuck counts with distinct way to do that. One way is:
```chuck
SinOsc s => dac.left;
SinOsc t => dac.right;
```
This ensure sound in both sides. At this point we can control when, what, how the side is mute, on, off, amplitude, note is performed. But if we want more channels, (e.g. multi channels devices).

```chuck
SqrOsc s => dac.chan(0);
SqrOsc t => dac.chan(1);
SqrOsc u => dac.chan(2);
SqrOsc v => dac.chan(3);
```
The third way is similar to ```dac.left``` and ```dac.right```, but with the keyword ```Pan2```. Here is an example:

```chuck
// Sound chain
Noise n => Pan2 p => dac;

// Initialize pan position value
1.0 => float panPosition; 

// Loop
while (panPosition > -1.0)
{
    panPosition => p.pan; // Pan value
    <<< panPosition >>>;
    panPosition - .01 => panPosition; // Decrement
    .01::second => now; // Advance time
}
```
I can change the value to ```1.0``` to ```-1.0``` to go through one side to other.

#### Array
One useful topic in computer science are arrays; are dinamic way to store data memory in blocks. Also are a modular and consistent to do. It allow a shorter and more efficient program. Now and example in chuck:     

```chuck
// Sound chain
SqrOsc s => dac;

// Array declaration
[54, 56, 62, 54, 48, 50, 52] @=> int A[];

// A.cap() is max number of element in A[]
<<< A.cap() >>>;

// Loop
for (0 => int i; i < A.cap(); i++)
{
    <<< i, A[i] >>>; // Print index and value
    Std.mtof(A[i]) => s.freq;
    .5::second => now; // Advance time
}
```
Look the differences... To declare an array in processing (a language for learning how to code within the context of the visual arts) has this way:
```processing
int[] A = {54, 56, 62, 54, 48, 50, 52}; 
```
Now in Chuck:
```chuck
[54, 56, 62, 54, 48, 50, 52] @=> int A[];
```
Do you remember what I said above with sign operator? It allocate the values on left side and the right side contain the data type and variable name, oh! one more thing did you see how look the sign operator? Thats right has other element ```@``` not for email, it means that list is dynamically, it changes over time.

Finally ```.cap()``` it means the capacity of the array, like ```.length``` in processing... goes through the array and access the values.

Checkout my [artwork](https://github.com/elohimgv/audio-programming-in-chuck/blob/master/assignment-2/assignment_2.ck) :notes:

### Week 3
The challenge of this week was writing a techno song. I am going to show you what I learn in each session; first, I am going to talk about sampling and sampling period. *Sampling* is a method of converting an analogue audio signal into a digital signal and *Sampling period*, the time difference between two consecutive samples in a Sound. Is our sound file representation in an array.

![Image of SndBuf function](https://github.com/elohimgv/audio-programming-in-chuck/blob/master/assignment-3/SndBuf.png)

To build things with them we need ```SndBuf``` shortened from *sound buffer*, is the built-in ChucK UGen that allows you to
load sound files. Let's look an example:
```chuck
// Sound chain
SndBuf mySound => dac; // Is my UGen to load sound files Chuck to dac.

// Allow to connet with sound file directory.
me.dir() => string path;
// Sound file path and define the filename
// Connect sound file directory with sound file path.
"/audio/snare_01.wav" => string filename; 
path + filename => filename;
// Open up soundfile
filename => mySound.read;

// Simple control 
.5 => mySound.gain; // Set volume
0 => mySound.pos; // Sets playhead position
1 => mySound.rate; // Set rate

1::second => now;
```
Now, a code that implement random with an infinite loop to change over time ```.gain``` and ```.rate```
```chuck
// Some code goes here

while (true) {
    Math.random2f(.2, .8) => mySound.gain; // Set gain
    Math.random2f(.2, 1.6) => mySound.rate; // Set rate
    0 => mySound.pos; // Set playhead position
    100::ms => now;
}
```
And how can I reverse a sample?
```chuck
// Sound chain
SndBuf mySound => dac;

// Look the difference with code above; less code to 
// connect directory with path file 
me.dir() + "/audio/snare_01.wav" => string filename; // Create path name as a string
// open soundfile
filename => mySound.read;
// Find number of samples
// .sample() is like .cap(), to go through  
// an array, but to work with samples
mySound.samples() => int numSamples;

// infinite loop
while (true)
{
    numSamples => mySound.pos; // Set playhead position
    // Instead positioning at the beginning, start at the end
    -1.0 => mySound.rate; // Set rate -negative for reverse 
    1::second => now; // Advance time
}
```
If I want to use more samples, what ca I do to do that? The answer is this:
```chuck
// Sound chain
SndBuf snare => dac;

// Array of strings (paths)
string snare_samples[3];

// Load array with file paths
me.dir() + "/audio/snare_01.wav" => snare_samples[0];
me.dir() + "/audio/snare_02.wav" => snare_samples[1];
me.dir() + "/audio/snare_03.wav" => snare_samples[2];

// How many samples?
<<< snare_samples.cap() >>>;

// Infinite loop
while (true)
{
    Math.random2(0, snare_samples.cap() -1) => int which; // 0, 1 or 2
    snare_samples[which] => snare.read; // Read in the sample
    250::ms => now; // Advance time
}
```
Remember, we can store different types of data into it. And thats the function of array management samples in this case.   

Loading stereo sound files in ChucK is much the same as with mono files, but instead of using ```SndBuf```, you use ```SndBuf2```, The addition of the 2 in the name indicates that the unit generator is stereo, that is, it has two output channels. 

```chuck
// Sound chain 
SndBuf2 mySound => dac;

// Read the file into string
me.dir() + "/audio/stereo_fx_02.wav" => string filename;
// Open up sounfile
filename => mySound.read;

// Infinite loop
while (true) {
    0 => mySound.pos; // Sets playhead position
    4::second => now; // Advance time
}
```
Modulo ```%``` is a special type of division; is the remainder of a division.  Let's look an example to learn about it. 
An useful tool for build a sequencer...

| counter | counter/4 | counter%4 (remanider) |
| ------- | --------- | --------------------- |
|    4    |     1     |           0           |  
|    5    |     1     |           1           |
|    6    |     1     |           2           |
|    7    |     1     |           3           |
|    8    |     2     |           0           |
|    9    |     2     |           1           |  

An the last example of the week was this; build a sequencer.

```chuck
// SEQUENCER
// Sound chain
Gain master => dac;
SndBuf kick => master;
SndBuf hihat => master;
SndBuf snare => master;

0.6 => master.gain;

// Load soundfiles into sndbuf
me.dir() + "/audio/kick_01.wav" => kick.read;
me.dir() + "/audio/hihat_01.wav" => hihat.read;
me.dir() + "/audio/snare_01.wav" => snare.read;

// Set all playheads to end so no sound is made
kick.samples() => kick.pos;
hihat.samples() => hihat.pos;
snare.samples() => snare.pos;

// Initialize counter variable
0 => int counter;

// Infinite loop
while (true)
{
    // Beat goes from 0 to 7 (8 positions)
    counter % 8 => int beat;
    
    // Bas drum on 0 and 4
    if ((beat == 0) || (beat == 4))
    {
        0 => kick.pos;
    }
    
    // Snare drum on 2 and 6
    if ((beat == 2) || (beat == 6))
    {
        0 => snare.pos;
        Math.random2f(0.6, 1.4) => snare.rate;
    }
    
    0 => hihat.pos;
    0.2 => hihat.gain;
    Math.random2f(0.2, 1.8) => hihat.rate;
    
    <<< "Counter: ", counter, "Beat: ", beat >>>;
    // counter + 1 => counter
    counter++;  
    250::ms => now;
}
```

Look the ```Gain``` and ```master``` objects, it's allow me control the ```.gain``` (volume) on the entire code with just a single variable.

Checkout my [artwork](https://github.com/elohimgv/audio-programming-in-chuck/blob/master/assignment-3/assignment_3.ck) :notes:

### Week 4
This week was about *functions*. I have been used functions since week 1 :grin: I went ahead :blush:. Ok, what is a functions? It's a small program (block of code) that allow to have code more:
* Modular
* Reducible
* Readable

#### Anatomy of a function
![Function anatomy](https://github.com/elohimgv/audio-programming-in-chuck/blob/master/assignment-4/fun.png)

Let's break the code to explain how works. First we have a ```fun``` keyword, then, a data type; is an integer. What is in parentheses is the parameter. Then, need a variable to store the ```result```; add plus 1 to ```x``` parameter Chuck to ```result``` and ```return``` the value of ```result``` variable. Now, we need to call ```addOne()``` function; ```addOne(8)``` has an argument of 8 Chuck to an int data type named answer. Finally print the ```answer``` variable on console: ```9```.
```chuck
// Function addOn
fun int addOne(int x)
{
    // One input locally know as x
    // Returns an integer
    
    // Variable to store final answer
    int result;
    // add one to input x
    x+1 => result;
    // Output final answer
    return result;
}

// MAIN PROGRAM
// Call addOne function
addOne(8) => int answer;
// Print out answer to addOne()
<<< answer >>>;
```
#### Local and Global variables
* Global variables are part of the main program and are accessible on the entire code.
* Local variables are belong to a block of code limited by scope  and not are accessible on the entire code, just to code of block that belong.

```chuck
// Global variables
5 => int valueOne;
4 => int valueTwo;

fun int mul(int a, int b) {
   // Local variables
   int result;
   a*b => result;
   return result;
}

// MAIN PROGRAM
// Call mul function
mul(valueOne, valueTwo) => int answer;
<<< answer >>>;
```
#### Other example of a function
The present example, how said [Ajay Kapur](https://ajaykapur.com), *is cool to granularized samples*. What is granularized? Are piece of sound that belong to a complete or more complex sound. See the example below. 

```chuck
// Sound chain
SndBuf click => dac; 

// Read sound file
me.dir() + "/audio/stereo_fx_01.wav" => click.read;
// Set playhead to end of file so no initial sound
//click.samples => click.pos;

// Function granularize
fun void granularize(int steps) {
   // samples/steps => grain.size
   click.samples() / steps => int grain;
   // Randomly set gain position
   Math.random2(0, click.samples() - grain) => click.pos;
   // Advance time
   grain::samp => now;
}

// MAIN PROGRAM
// Infinite loop
while (true)
{
    granularize(50);
}


