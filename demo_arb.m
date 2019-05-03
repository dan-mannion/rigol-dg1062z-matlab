fs = 1e3;
t = 0:1./fs:3;
v = 0.5.*sin(2*pi*1.*t);

if length(v)>16383
   disp('ERROR DATA TOO LONG - CLIPPING');
   v = v(1:16383);
end

dg = dgConnect();
writeCommand(dg, ':SOUR1:FUNC:ARB:MODE SRATE');
writeCommand(dg, ':SOUR1:FUNC:ARB:SRATE 1e3');
writeCommand(dg, sprintf(':SOUR1:TRACE:DATA:POINTS VOLATILE,%d',length(v)));

% 
% for x = 1:length(v)
%    cmd = sprintf(':SOURCE1:TRACE:DATA:VALUE VOLATILE,%d,%1.3e', x, v(x)); 
%    writeCommand(dg, cmd);
% end


sig_str = sprintf(',%1.1f',v);
cmd = sprintf(':SOURCE1:DATA VOLATILE%s', sig_str); 
writeCommand(dg, cmd);
% cmd = sprintf(':SOURCE1:APPLY:ARB 1000, 2, 0');
% fprintf(dg, cmd);
% writeCommand(dg, cmd);
% sig_str = sprintf(',%1.3f',v);
% cmd = sprintf(':SOURCE1:DATA VOLATILE%s', sig_str); 
% writeCommand(dg, cmd);
% fprintf(dg, ':OUTPUT1 ON\n');
% clear sig_str;
dgDisconnect(dg);