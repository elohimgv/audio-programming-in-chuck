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

#### Data types
Here we have primitive data types like: floating point, integers, strings, boolean values like in other classic language. The interesting point here is *time* and *dur* data types; they allow to work wiht **time**. *Time* is just a point in **time** and *dur* is the length of time; for example the duration of my composition. Here there´s special keyword *now* to read or init the sequences of pices of coda that must be executed and modify or manipulate the count of time inside of Chuk, because we can show on concole in milliseconds, seconds, minutes, hours etc.

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
The difference is the assign operator, instead of *=* we have *=>* and the order in the syntax how to assign a value.
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
SinOsc => dac.left;
SinOsc => dac.right;
```
This ensure sound in both sides. At this point we can control when, what, how the side is mute, on, off, amplitude, note is performed. But if we want more channels, (e.g. multi channels devices).

```chuck
SqrOsc s => dac.chan(0);
SqrOsc t => dac.chan(1);
SqrOsc u => dac.chan(2);
SqrOsc v => dac.chan(3);
```
The third way is similar to *dac.left* and *dac.right*, but with the keyword *Pan2*. Here is an example:

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
I can change the value to 1.0 to -1.0 to go through one side to other.

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
Do you remember what I said above with sign operator? It allocate the values on left side and the right side contain the data type and variable name, oh! one more thing did you see how look the sign operator? Thats right has other element *@* not for email, it means that list is dynamically, it changes over time.

Finally *.cap()* it means the capacity of the array, like *.length* in processing... goes through the array and access the values.
 
 

