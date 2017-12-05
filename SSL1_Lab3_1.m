mainTask1();

function [ftVec] = computeFT_diracPulse(omega, t0)
ftVec = exp(-1j*omega*t0);
end

function [magSpec, phaseSpec] = getMagPhaseSpectra_fromFTVec(ftVec)
magSpec = sqrt(real(ftVec).^2 + imag(ftVec).^2);
phaseSpec = -atan2(imag(ftVec),real(ftVec));
end

function [magSpec, phaseSpec] = getMagPhaseSpectra_precalculated(omega)
ftVec = exp(-1j*0) + exp(-1j*omega*10^-3);
[magSpec, phaseSpec] = getMagPhaseSpectra_fromFTVec(ftVec);
end

function mainTask1
close all

%% Problem 1C
w = 2*pi*[0:0.01:100];
t0 = 1*10^(-3);
ftVec1 = computeFT_diracPulse(w, 0);
ftVec2 = computeFT_diracPulse(w, t0);
[magSpec1, phaseSpec1] = getMagPhaseSpectra_fromFTVec(ftVec1);
[magSpec2, phaseSpec2] = getMagPhaseSpectra_fromFTVec(ftVec2);


figure
hold on
subplot(4,1,1);
plot(w, magSpec1);
subplot(4,1,2);
plot(w, magSpec2);
subplot(4,1,3);
plot(w, phaseSpec1);
subplot(4,1,4);
plot(w, phaseSpec2);

%% Problem 1d
[magSpec3, phaseSpec3] = getMagPhaseSpectra_precalculated(w);
[magSpec4, phaseSpec4] = getMagPhaseSpectra_fromFTVec(ftVec1+ftVec2);

figure
hold on
subplot(4,1,1);
plot(w, magSpec3);
subplot(4,1,2);
plot(w, magSpec4);
subplot(4,1,3);
plot(w, phaseSpec3);
subplot(4,1,4);
plot(w, phaseSpec4);

%% Problem 1e
ftVec3 = computeFT_diracPulse(w, 2*10^-3);
[magSpec4, phaseSpec4] = getMagPhaseSpectra_fromFTVec(ftVec2+ftVec3);
figure
hold on
subplot(4,1,1);
plot(w, magSpec3);
subplot(4,1,2);
plot(w, magSpec4);
subplot(4,1,3);
plot(w, phaseSpec3);
subplot(4,1,4);
plot(w, phaseSpec4);
end