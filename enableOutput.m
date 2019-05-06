function enableOutput(dg, channel)
writeCommand(dg, sprintf(':OUTPUT%d:STATE ON', channel));
end