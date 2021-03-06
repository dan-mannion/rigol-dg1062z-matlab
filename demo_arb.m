fs = 1e3;
t = 0:1./fs:1;
v = 0.5.*sin(2*pi*1.*t);

%Connect to funciton generator. The resource name will change with each
%func gen. 
resource_name = 'USB0::0x1AB1::0x0642::DG1ZA201301244::INSTR';
dg = dgConnect(resource_name);

%Initialise into arb sampling rate mode
setupArb(dg, 1, fs, 2,0);
%Upload waveform
loadArbWaveform(dg, 1, v);

enterBurstMode(dg, 1, 3, 'CENTER', 'MANUAL');
enableOutput(dg, 1);
triggerOutput(dg, 1);
pause(0.5);
disableOutput(dg, 1);
dgDisconnect(dg);