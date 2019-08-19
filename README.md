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
Std.abs(int absolute value) // Returns absolute value of integer number - output integer

Std.fabs(float absolute value) // Returns absolute value of floating number - output float

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

Math.random2(int min int max) // Generates random integer in the range [min, max] - output int

Math.randomf(float value) // Generates random floating point number in range [0, 1] - output float

Math.random2f(float min float max) // Generates random floating point number int the range [min, max] - output float
```
Every time I run my program I have different values with random, what happen if I want the same series of number each time? The answer is:
```chuck
Math.srandom() // Ensure tha sequence of random numbers would be exactly the same across different executions of the same program.
```


