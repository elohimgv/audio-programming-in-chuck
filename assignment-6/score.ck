// score.ck

// Paths to chuck files
me.dir() + "/wave_forms.ck" => string waveFormsPath; 
me.dir() + "/sitar.ck" => string sitarPath;
me.dir() + "/heart_in.ck" => string heartInPath;
me.dir() + "/heart_out.ck" => string heartOutPath;

// Srat the heart in
Machine.add(heartInPath) => int heartInPathID;
// Advanced time
11.5::second => now; 

// Start the wave forms
Machine.add(waveFormsPath) => int waveFormsPathID;
// Advanced time
5::second => now; 

// Start the sitar
Machine.add(sitarPath) => int sitarPathID;
// Advanced time
5::second => now; 

// Srat the heart out
Machine.add(heartOutPath) => int heartOutPathID;
// Advanced time
10::second => now; 
