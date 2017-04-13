%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author:	Max
% Date: 	13.04.2017
% File: 	rc_filter.m
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	
	clear;
	
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	% Vars
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	
	R = 100e3;	
	C = 1e-9;
	f = linspace(1,10e6,300e3);
	omega = 2*pi*f;
	marg = 0.1;
	fontsz = 30;
	linewd = 5;

	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        % Filter equations
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

	I = 1 ./ ( i*omega*R*C + 1);
	Iabs = abs(I);
	Iabslog = 20*log10(Iabs);
	Imax = max(Iabslog);
	Iabslog = Iabslog - Imax;	% Normalize
	I3dB(1:length(f)) = -3;
	f3dB = 1/(R*C*2*pi)
	
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        % Plot
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

	p=semilogx(f,Iabslog,f,I3dB);
	set(p, 'linewidth', linewd);
	set(gca, 'fontsize', fontsz);
	t = text(log10(f(length(f)/2)),-10, ['f3dB = ' num2str(f3dB/1000) ' kHz'] );
	set(t, 'fontsize', fontsz);
	ylabel('Normalized Resistance Magnitude/dB');
	xlabel('f/Hz');
	title('Frequency Response RC Filter');
 	grid on;

