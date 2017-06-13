%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author:	Max
% Date: 	13.06.2017
% File: 	trick_circ_trasimp.m
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	
	clear;
	format shortEng;
		
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	% Vars
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

	Rd = 10e6
	Rpar = [0.1e3, 1e3, 10e3]
	Rout = 100e3	

	Ilow = -14;
	Ihigh = -9;
	Ulow = -4;
	Uhigh = 1;
	Id = logspace(Ilow,Ihigh,100);

	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        % Equations of the trick transimp. amp.
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

	% Resistance seen by diode
	Rdseen = Rout * ( Rd./Rpar + 1)
	% Resistance seen by diode exactly
	Rdseenext = Rout * ( Rd./Rpar + 1 + 1/Rout)

	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        % Plot
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

	hold on;
	for i = 1:length(Rpar)
		Uout = Id .* Rdseen(i);
		loglog(Id, Uout);
	end
	grid on;
	xlabel("Id");	
	ylabel("Uout");
	axis([10^Ilow 10^Ihigh 10^Ulow 10^Uhigh]);
