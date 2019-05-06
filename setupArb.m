function setupArb(dg, channel, sample_rate, amplitude, offset)
writeCommand(dg, sprintf(':SOURCE%d:FUNC:ARB:MODE SRATE', channel));
writeCommand(dg, sprintf(':SOURCE%d:APPLY:ARB %1.3e, %f, %f',channel, sample_rate, amplitude, offset));
end