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
```
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
```
int a = 0;
```
Chuck.
```
0 => int a;
```
Statements
```
if (true) {
   code goes here
}
```
```
if (true) {
   code goes here
} else {
   code goes here
}
```
Pretty the same to other programming languages.

#### Waveforms
Sine wave 
```
SinOsc 
```
Square wave
```
SqrOsc 
```
Triangle wave
```
TriOsc 
```
Sawtooth wave
```
SawOsc 
```
Thise are the keywords to make basic sounds with waveforms in Chuck. To learn a little a bit more visit [Wikipedia](https://en.wikipedia.org/wiki/Waveform).

Finally checkout my [artwork](https://github.com/elohimgv/audio-programming-in-chuck/blob/master/assignment-1/assignment_1.ck) :notes:



