function loadArbWaveform(dg, channel,wave, extended_mem)

if(~exist('extended_mem','var'))
    if(length(wave)>8000)
        ME = MException('loadArbWaveform:WaveTooLong','Wave must not exceed 8000 points.');
        throw(ME);
    end
else
    if(length(wave)>16000)
        ME = MException('loadArbWaveform:WaveTooLong','Wave must not exceed 16000 points.');
        throw(ME);
    end
end
writeCommand(dg, sprintf(':SOUR%d:TRACE:DATA:POINTS VOLATILE,%d',channel, length(wave)));
% cmd = sprintf(':SOURCE%d:APPLY:ARB %1.3e, 2, 0',channel, fs);
% writeCommand(dg, cmd);
sig_str = sprintf(',%1.2f',wave);
cmd = sprintf(':SOURCE%d:DATA VOLATILE%s', channel, sig_str); 
writeCommand(dg, cmd);

end