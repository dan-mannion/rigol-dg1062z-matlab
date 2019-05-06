function writeCommand(dg, str)
% WRITECOMMAND Writes string commands to the sig gen.
% If the string is larger than 512 (Default output buffer size)
%Then the command is split into 512 sized chunks and seent separately. 

if(length(str)>dg.OutputBufferSize)
      dg.OutputBufferSize=length(str)+2;
end
fopen(dg);
dg.EOSMode = 'write';
fprintf(dg, '%s\n',str);
dg.EOSMode = 'none';
fclose(dg);
dg.OutputBufferSize=512;
end