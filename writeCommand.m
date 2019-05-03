function writeCommand(dg, str)
% WRITECOMMAND Writes string commands to the sig gen.
% If the string is larger than 512 (Default output buffer size)
%Then the command is split into 512 sized chunks and seent separately. 
% if(length(str)>512)
%    dg.OutputBufferSize = length(str);
% end
% fopen(dg);
% fwrite(dg, str);
% while(dg.TransferStatus ~= 'idle')
%     ;
% end
% fclose(dg);
% dg.OutputBufferSize = 512;


% 
N = floor(length(str)/512);

fopen(dg);
dg.EOIMode = 'off'; %Disable EOI to append cmd
for n=1:N
   fprintf(dg,'%s', str((n-1)*512+1:n*512)); 
end
%Write remainder
% dg.EOIMode = 'on'; %Enable EOI to complete transaction
fprintf(dg,'%s\n',str(N*512+1:end));
fclose(dg);
end