function dg = dgConnect()
%DGCONNECT connects to the dg1062z and returns a VISA object.
%Create VISA object
dg = visa('ni','USB0::0x1AB1::0x0642::DG1ZA174403032::INSTR');
if(isempty(dg))
   ME = MException('dg:NoDevice','Could not find the DG sign gen.');
   throw(ME);
end

fopen(dg);
end