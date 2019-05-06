function dgDisconnect(dg)
%DGDISCONNECT Closes connection with dg1062z

if(strcmp(dg.Status,'open')) 
    fclose(dg);
end

delete(dg);
end