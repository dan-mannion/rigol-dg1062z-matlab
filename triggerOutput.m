function triggerOutput(dg, channel)
writeCommand(dg, sprintf(':SOURCE%d:BURST:TRIG', channel));
end