function disableOutput(dg, channel)
writeCommand(dg, sprintf(':OUTPUT%d:STATE OFF', channel));
end