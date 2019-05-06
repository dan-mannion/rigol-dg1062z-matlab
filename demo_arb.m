fs = 1e3;
t = 0:1./fs:7.5;
v = 0.5.*sin(2*pi*1.*t);

dg = dgConnect();
writeCommand(dg, ':SOUR1:FUNC:ARB:MODE SRATE');
writeCommand(dg, sprintf(':SOUR1:FUNC:ARB:SRATE %1.3e', fs));

loadArbWaveform(dg, 1, fs, v);
dgDisconnect(dg);