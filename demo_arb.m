fs = 1e3;
t = 0:1./fs:7.5;
v = 0.5.*sin(2*pi*1.*t);

dg = dgConnect();
writeCommand(dg, ':SOUR1:FUNC:ARB:MODE SRATE');
writeCommand(dg, sprintf(':SOUR1:FUNC:ARB:SRATE %1.3e', fs));

loadArbWaveform(dg, 1, fs, v);


% for x = 1:length(v)
%    cmd = sprintf(':SOURCE1:TRACE:DATA:VALUE VOLATILE,%d,%1.3e', x, v(x)); 
%    writeCommand(dg, cmd);
% end


% sig_str = sprintf(',%1.1f',v);
% cmd = sprintf(':SOURCE1:DATA VOLATILE%s', sig_str); 
% writeCommand(dg, cmd);
% cmd = sprintf(':SOURCE1:APPLY:ARB 1000, 2, 0');
% fprintf(dg, cmd);
% writeCommand(dg, cmd);
% sig_str = sprintf(',%1.3f',v);
% cmd = sprintf(':SOURCE1:DATA VOLATILE%s', sig_str); 
% writeCommand(dg, cmd);
% fprintf(dg, ':OUTPUT1 ON\n');
% clear sig_str;
dgDisconnect(dg);