Fs = 44100; % sampling rate
nbits = 16; % # bits
nchannels = 1; % # channels

aud = audiorecorder(Fs, nbits, nchannels);

% record
% disp('Speak.');
recTime = 2;
% recordblocking(aud, recTime);

% disp('Done. Playing back...');
% play(aud);

% get data points from recording
% audData = getaudiodata(aud);

% t = linspace(0, recTime, Fs*recTime);
% plot(t,audData);
% sound(audData, Fs);

% convert to .wav file
% filename = 'test.wav';
% audiowrite(filename, audData, Fs);

% loop 
cd('C:\Users\Esther\OneDrive\Documents\UMich\Research 2016\google');
numLoops = 50;
for i = 1 : numLoops
    disp(i);
    recordblocking(aud, recTime);
    disp('Done.');
    audData = getaudiodata(aud);
    filename = ['ch_google', num2str(i), '.wav'];
    audiowrite(filename, audData, Fs);
end

% go back to original folder
cd('C:\Users\Esther\OneDrive\Documents\UMich\Research 2016');