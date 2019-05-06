function enterBurstMode(dg, channel, num_cycles, idle_level, trig_source)
% ENTERBURSTMODE Puts the function gen into burst mode.
writeCommand(dg,sprintf(':SOURCE%d:BURST:MODE TRIG', channel));
writeCommand(dg,sprintf(':SOURCE%d:BURST:NCYCLES %d', channel , num_cycles));
writeCommand(dg,sprintf(':SOURCE%d:BURST:IDLE %s', channel , idle_level));
writeCommand(dg,sprintf(':SOURCE%d:BURST:TRIG:SOURCE %s', channel , trig_source));
writeCommand(dg,sprintf(':SOURCE%d:BURST:STATE 1', channel));
end