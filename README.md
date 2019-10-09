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
   // Randomly set grain position
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
```
#### Musical forms
Our compositions has to have expressiveness, to do that, we will examine the next example.  
```chuck
// Sound chain
SndBuf click => dac;
SndBuf kick => dac;

// Open sound files
me.dir() + "/audio/kick_01.wav" => kick.read;
me.dir() + "/audio/snare_03.wav" => click.read;

// Take away playback at initialization
kick.samples() => kick.pos;
click.samples() => click.pos;

// Global variables
[1, 0, 0, 0, 1, 0, 0, 0] @=> int kick_ptrn_1[];
[0, 0, 1, 0, 0, 0, 1, 0] @=> int kick_ptrn_2[];
[1, 0, 1, 0, 1, 0, 1, 0] @=> int click_ptrn_1[];
[1, 1, 1, 1, 1, 1, 1, 1] @=> int click_ptrn_2[];

// Function
fun void section(int kickarray[], int clickArray[], float beatTime) {
   // Sequencer for bass drum and snare drum beats 
   for (0 => int i; i < kickArray.cap(); i++) {
      // if 1 in array then play kick
      if (kickArray[i] == 1) {
         0 => kick.pos;
      }
      
      // if 1 in array then play click
      if (clickArray[i] == 1) {
         0 => click.pos;
      }
      beattime::second => now;
   }
}

// MAIN PROGRAM
// Infinite loop
while (true)
{
   // Procedural :: ABA form
   section(kick_ptrn_1, click_ptrn_1, .2); 
   section(kick_ptrn_2, click_ptrn_2, .2);
   section(kick_ptrn_1, click_ptrn_1, .4); 
}
```
The majority of the examples presents here, are from the [course](https://www.kadenze.com/courses/introduction-to-real-time-audio-programming-in-chuck/info?signedin=true). If you want to learn more about visit [Kadenze](https://www.kadenze.com) platform.  

#### Recursive function
It's a very advanced topic in computer science, what is a recursive function? Is a function that call itself. 
```chuck
// Sound chain
SndBuf snare => dac;

// Load sound file
me.dir() + /audio/snare_02.wav" => snare.read;
// Set playhead to end so no sound in beginning
snare.samples() => snare.pos;

// Function 
fun int drumRoll(int index) {
   <<<index>>>;
   if (index >= 1) {
      // Play sound for duration of index
      index::ms => now;
      // Call drumRoll while reducing index
      return drumRoll(index-1);
   } else if (index == 0) {
      return 0;
   }
}

// MAIN PROGRAM
// Call recurive function drumRoll
drumRoll(100);
```
### Chords
They promote harmony progression in the composition. I don't be a musician and it was a dificult topic to me to learn, because  it was a little about musical theory and the aim of course is an introduction to programming for musician and artists and that's ok. I think that I will profund on chords firstly, then I don't know... music is interesting. Well! without much preamble, here is the code:
```chuck
// Sound chain
TriOsc chord[3];
Gain master => dac;

for (0 => int i; i < chord.cap(); i++) {
   // Use array to chuck unit generator to master
   1.0/chord.cap() => chord[i].gain;
   chord[i] => master;
}

// Function
fun void playChord(int root, string quality, float length) {
   // Function will make major or minor chords
   
   // root
   Std.mtof(root) => chord[0].freq;
   
   // third
   if (quality == "major") {
      Std.mtof(root + 4) => chord[1].freq;
   } else if (quality == "minor") {
      Std.mtof(root + 3) => chord[1].freq;
   } else {
      <<<"Must specify 'major' or 'minor'">>>;
   }
   
   // fifth
    Std.mtof(root + 7) => chord[2].freq;
    
    length::ms => now;
}

// MAIN PROGRAM
// infinite loop
while (true)
{
    playChord(Math.random2(60, 72), "minor", 250);
    playChord(Math.random2(60, 72), "major", 500);
    playChord(Math.random2(60, 72), "minor", 250);
}
```
Uf! it was difficult assignment, not for learn the new concepts and techniques. But to organice the expressiveness of my artwork. It not sound good... but whatever; I think that the most important to me, is what I learned a lot of my erros in code: writing code, running code and evaluating results and again. How said I am not a musician, but I start to love music and doing music with Chuck. I know better the core concpets of working with Chuck. *I am not search to be the best programmer in Chuck or the best musician or the worst, I just want to be fine with my self*; that's my main point and that's the main learn of the week.

Checkout my [artwork](https://github.com/elohimgv/audio-programming-in-chuck/blob/master/assignment-4/assignment_4.ck) :notes:

### Week 5
Firstly, I am going to talk about Unit Generators, what are they? Are objects into Chuck, that allow to create sound like ```SinOsc```, ```TriOsc```. For example: ```SinOsc s => dac;``` here, we are chucking ```SinOsc``` object to ```dac```. Remember, it means *digital audio converter*. 

#### Special Ugens: dac, adc, and blackhole
* ```dac```: It allow you to connect other UGens to the outside world of your speakers or headphones via your sound hardware. It goes from inside to outside. 
* ```adc```: It allow you to connect from a microphone, for example and processing the information. It goes from outside to inside. 
* ```ablackhole```: Different to ```dac``` it not generate any sound. 

For what do I need a  ```ablackhole``` for? if not produce any sound. Sometimes just we need know values and not hear any type of sound.
```dac```, ```adc```, and ```blackhole``` are don't need to be instantiated, because are always there and there’s only one of them.

When we need inputs to have some outputs, maybe  think on this: ```adc => dac; // don't do this!``` instead use this:
```chuck
//connect audio input to audio output through Gain UG
adc => Gain g => dac;
//let it run for 10 seconds
10.0 :: second => now;
```
*CAUTION! CAUTION! CAUTION! Be extremely careful before you execute this code, making sure that there won’t be an ear-splitting feedback loop (as can happen when sound from your speakers gets back into your microphone). Plug in headphones, or turn your speaker volume way down before hooking the adc to the dac (running this code). ([Programming from Musicians and Digital Artists book](https://www.amazon.com/Programming-Musicians-Digital-Artists-Creating/dp/1617291706))*

*Strictly speaking, you don’t need the Gain UGen between the adc and the dac, but you
should always avoid connecting the adc to the dac directly. ([Programming from Musicians and Digital Artists book](https://www.amazon.com/Programming-Musicians-Digital-Artists-Creating/dp/1617291706))* 

#### One more oscillator: ```PulseOsc```
Remember in the beginning we used ```SinOsc``` to code our first Chuck program *hello sine!*. Now let me introduce ```PulseOsc``` special oscillator to make great electronic dance-type sounds and music. It's similar to ```SqrOsc``` with slightly differences. 

*You can also control the fraction of each period that’s high versus low (this is called the pulse width, or the duty cycle). You can set or vary the duty cycle of PulseOsc anywhere between 0.0 and 1.0, to create varied spectral sounds (a small duty cycle yields a very bright spectrum; 0.5 yields less bright). ([Programming from Musicians and Digital Artists book](https://www.amazon.com/Programming-Musicians-Digital-Artists-Creating/dp/1617291706))*

![Duty cicle](https://github.com/elohimgv/audio-programming-in-chuck/blob/master/assignment-5/duty-cicle.png)

#### Envelop Unit Generator
Envelope is a way to make sound similar to occur in nature. Until now, we have been make sound with switch ```0``` or ```1```, sound or silence through the .gain method, but in nature is distinct. Begin with a slow impulse, louder and then decay; is continuous. *When you blow into a clarinet or trumpet, or start bowing a violin, or begin to sing, the notes don’t switch on instantly. When you stop blowing, bowing, or singing, you don’t hear a click because the sound stopped instantly. ([Programming from Musicians and Digital Artists book](https://www.amazon.com/Programming-Musicians-Digital-Artists-Creating/dp/1617291706))*

Basic envelope
```chuck
// Sound chain
SqrOsc => clar => Envelope env => dac; 

// Changes ramp time
1.0::second => now;

// Turns envelope on
1 => env.keyOn;

// Adavnce time
2.0::second = > now;

// Turns envelope off
1 => env.keyOff;

// Advance time
2.0::second => now;
```

More advance envelope
```chuck
// Sound chain 
SqrOsc clar => ADSR => dac;
(0.5::second, 0.1::second, 0.1, 2.0::second) => env.set;

// Turns envelope on
1 => env.keyOn;
// Advance time 
2.0::second => now;

// Turns envelope off
1 => env.keyOff;
// Advance time
2.0::second => now;
```

![Attack, Decay, Sustain and Realase](https://github.com/elohimgv/audio-programming-in-chuck/blob/master/assignment-5/ADSR.png)

#### Frequency Modulation Synthesis
Is a physical modeling, where you model and compute the physcis of wave as they vibrate and propagate. Like a violin or clarinet. 
```chuck
// Modeling a violin through waveforms
SinOsc vib => SawOsc viol => ADSR env => dac;
(0.5::second, 0.1::second, 0.6, 0.5::second) => env.set;
660.0 => viol.freq;  // Change pitch and hear what happen
1100 => vib.freq; // Vibrato frequency 
100 => vib.gain;
2 => viol.sync; // Set sync mode to FM (2)

1 => env.kayOn; // Turns envelope on 
2::second => now;

1 => env.keyOff // Turns envelope off
2::second => now;
```

#### Filters
They operate on signal, frequencies emphasize or deemphasize sounds. Look at the example below. *Ugen ```Resonz``` which creates a single resonance (higher gain at one selectable frequency) on any signal passed through it. ```Resonz``` responds to ```.freq```, which sets the resonance frequency, and ```.Q```, which stands for “quality factor” and determines the amount of emphasis at the resonant frequency. ([Programming from Musicians and Digital Artists book](https://www.amazon.com/Programming-Musicians-Digital-Artists-Creating/dp/1617291706))*
```chuck
// Sound chain
Impulse imp => ResonZ filt => dac;
800.0 => filt.freq;
400 => filt.Q;

// Generate 1 for one sample
200.0 => imp.next 

2.0::second => now;
```

#### Delay-based audio effects
Some interesting audio effetcs and there is more in built-in Chuck...
```chuck
// Sound chain
adc => JCRev rev => dac; // We can use also PRCRev, NRev 
// dry/wet mix
0.1 => rev.mix;

while (true)
{
    1.0::second => now;
}

// Sound chain
adc => Chorus chor => dac;
0.05 => chor.modDepth;
2.0 => chor.modFreq;

while (true)
{
    1.0::second => now;
}

// Sound chain
adc => PitShift pit => dac;
1.2 => pit.shift;

while (true)
{
    1.0::second => now;
}
```

### Week 6
An advanced topic in computer science was concurrency. It´s running many independent pieces of logic at the same time. Let's look an example. 
```chuck
fun void foo() {
   while(true) {
      <<<"foo!", "">>>;
      250::ms => now;
   }
}
```
A while loop into a function ```foo()``` repeating forever and print 'foo!' every 250 milliseconds. 
```chuck
while(true) {
   <<<"BARRRRRR!!", "">>>;
   1::second => now;
}
```
Infinite loop print 'BARRRRRR!!' every 1 second. 

If we connect the two pieces of code we have:
```chuck
fun void foo() {
   while(true) {
      <<<"foo!", "">>>;
      250::ms => now;
   }
}

while(true) {
   <<<"BARRRRRR!!", "">>>;
   1::second => now;
}
```
But, the issue is, that the second piece of code doesn´t execute because the first one is an ifinite loop... running forever. Until the first piece is finished it cannot continue. What can we do here? Of course the answer is concurrency (multi-thread) :relaxed:. 
```chuck
fun void foo() {
   while(true) {
      <<<"foo!", "">>>;
      250::ms => now;
   }
}

spork ~ foo();

while(true) {
   <<<"BARRRRRR!!", "">>>;
   1::second => now;
}
```

```spork ~``` means: execute the function in parallel. 
Finally we have an example more advanced. It implement parent shred and childs shred. ```shred``` means a single sequence of logic code (code snippet). A ```shred``` is created by ```spork```ing functions. In Chuck we spork shred. We can spork any number of shred running at the same time. That's how you can get concurrency; ```shred``` is a separate process and ```spork``` is the action of create a new  ```shred```.
![Parent shred and childs shraed](https://github.com/elohimgv/audio-programming-in-chuck/blob/master/assignment-6/shred.png)

 ```chuck
60 => Std.mtof => one.freq;
64 => Std.mtof => two.freq;

fun void foo() {
    while(true) {
        // Note!
        1 => one.strike;
        <<<"foo!", "">>>;
        250::ms => now;
   }
}

fun void bar() {
    while(true) {
        <<<"BARRRRRR!!", "">>>;
        // Note!
        1 => two.strike;
        1::second => now;
    }
}

// Spork 
spork ~ foo();
spork ~ bar();

// Infinite time loop
//  (To keep parent shred alive, in order for children to alive)
while(true) {
    1::second => now;
}
 ```
 
 #### Machine commands
 Things get more interesting. Machine commands are, obviously how the word say, commands that allow to build Chuck architecture (progrmas) more complex. They are the base to add, remove and replace Chuck files to play a song.
 ```chuck
Machine.add()
```
![machine add command](https://github.com/elohimgv/audio-programming-in-chuck/blob/master/assignment-6/machine_add.png)
```chuck
Machine.remove()
```
![machine remove command](https://github.com/elohimgv/audio-programming-in-chuck/blob/master/assignment-6/machine_remove.png)
```chuck
Machine.rplace()
```
![machine replace command](https://github.com/elohimgv/audio-programming-in-chuck/blob/master/assignment-6/machine_replace.png)

### Week 7
This week was about OOP (object oriented programming), popularized in the 90s by C++, objective-c and Java. We have been using this property through UGens (objects built in Chuck). Objects are type of data that encapsulate behaviours; it are better and bigger than functions. For example, a flute, a piano are objects that contain instructions to be palying :notes: (think in therms of programing :computer: not literally). 

Objects can be public and private:

![Objects public and private](https://github.com/elohimgv/audio-programming-in-chuck/blob/master/assignment-7/private%20and%20public.png)

![Flute object](https://github.com/elohimgv/audio-programming-in-chuck/blob/master/assignment-7/flute%20model.png)

Knowing the above, we can make our own objects :musical_keyboard:.

#### Classes
A class is the structure that form my data set to form an object. For example we have a class *float* and then the name of the object.

![Class and objects](https://github.com/elohimgv/audio-programming-in-chuck/blob/master/assignment-7/class%20and%20objects.png)

A class can has many instances that become in objects :relaxed:

![Instances](https://github.com/elohimgv/audio-programming-in-chuck/blob/master/assignment-7/instances.png)

Also have data variables that belong to object. In other programming language it are known as fields. 

![Memeber variables](https://github.com/elohimgv/audio-programming-in-chuck/blob/master/assignment-7/member%20variables.png)

Finally... ! methods. In OOP (Object Oriented Programming) a function is known as method. 

![Methods](https://github.com/elohimgv/audio-programming-in-chuck/blob/master/assignment-7/methods.png)

```chuck
class TestData {
   // Memeber variables 
   1 => int myInt;
   0 => int myFrac;
   
   // Memeber functions that adds the data
   fun float sum() {
      return(myInt + myFrac);
   }
}

// Instance of TestData and one object named d
TestData d; 

<<<d.myInt, d.myFrac, d.sum()>>>;

// advance time
1::second => now;

// change the data
3 => d.myInt;
0.14159 => d.myFrac;

<<<d.myInt, d.myFrac, d.sum()>>>;
```

#### Overloading
Overloading it allows make functions with the same name... (obviously in the context of OOP), but doing different things depending of type and number of arguments coming in.

```chuck
class Simple {
   // Sound chain
   Impulse imp => ResonZ filt => dac;
   
   // Some default settings 
   100.0 => filt.Q => filt.gain;
   1000.0 => filt.freq;
   
   fun void freq(float f) {
      f => filt.freq; 
   } 
   
   fun void setQ(float Q) {
      Q => filt.Q => filt.gain;
   }
   
   fun void setGain(float g) {
      g => imp.gain;
   }
   
   fun void noteOn(float volume) {
      volume => imp.next;
   }
   
   // Two ways of setting pitch (overloading)
   // one by float frequency
   fun float pitch(float freq) {
      return (freq => filt.frea);
   }
   
   // another way to set pitch by MIDI note number
   fun float pitch(int noteNum) {
      return (Std.mtof(noteNum) => filt.freq); 
   }
}

// Object
Simple s;

while(true) {
   // MIDI note number pitch
   s.pitch(60);
   1=> s.noteOn;
   1::second => now;
   
   // pitch as float frequency
   s.pitch(440.0);
   1 => s.noteOn;
   1::second => now; 
}
```

#### Public class vs Private class
A private class means that only belong to a particular type of project and into it only can act. The counterpart it can act in different projects (classes) from outside; that's why it's public class, because works through different classes. Private, just act into the same project where is create.












