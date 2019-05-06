function dg = dgConnect(resource_name)
%DGCONNECT connects to the dg1062z and returns a VISA object.
%Create VISA object
dg = visa('ni',resource_name);
if(isempty(dg))
   ME = MException('dg:NoDevice','Could not find the DG sign gen.');
   throw(ME);
end

end