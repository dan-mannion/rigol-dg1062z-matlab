function loadArbWaveform(dg, fs, wave)
cmd = sprintf(':SOURCE1:APPLY:ARB %1.3e, 2, 0',fs);
writeCommand(dg, cmd);
sig_str = sprintf(',%1.2e',wave);
cmd = sprintf(':SOURCE1:DATA VOLATILE%s', sig_str); 
writeCommand(dg, cmd);
clear sig_str;

end