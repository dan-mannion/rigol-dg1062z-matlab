function writeCommand(dg, str)
% WRITECOMMAND Writes string commands to the sig gen.
% If the string is larger than 512 (Default output buffer size)
%Then the command is split into 512 sized chunks and seent separately. 
N = floor(length(str)/512);

fopen(dg);
for n=1:N
   fprintf(dg,'%s', str((n-1)*512+1:n*512)); 
end
%Write remainder
fprintf(dg,'%s\n',str(N*512+1:end));
fclose(dg);
end