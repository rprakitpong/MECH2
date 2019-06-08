function [R,J,time] = romeoandjuliet(aR,bR,bJ,aJ,tfinal)
	%Obviously poorly commented code! Write better code! 
	%ODE stuff
	tstart = 0;
	if nargin == 4
		tfinal = 10;
	elseif nargin < 4 
		aR=.3;
		bR=-.4;
		bJ=1;
		aJ=.2;
		tfinal=20;
	end
	initialcondition = [-1,-1];
	tinterval = [tstart, tfinal];
	f = @(t,y) [aR*y(1)+bR*y(2);aJ*y(2)+bJ*y(1)];
	[t,yapprox] = ode45(f,tinterval,initialcondition);
	R = yapprox(:,1);
	J = yapprox(:,2);
	time = t;
	%plots
	width=18;
	height=6;
	x0 = 0;
	y0 = 0;
	fontsize = 18;
	close all
	figure('Units','inches','Position',[x0 y0 width height],'PaperPositionMode','auto');
	subplot(1,3,1)
	plot(t,R,'k-','LineWidth',2)
	grid
	set(gca,'Units','normalized','FontUnits','points','FontWeight','normal','FontSize',fontsize,'FontName','Times')
	xlabel({'$t$'},'FontUnits','points','Interpreter','latex','FontWeight','normal','FontSize',fontsize,'FontName','Times')
	xlim(tinterval)
	ylabel({'$R(t)$'},'FontUnits','points', 'Interpreter','latex','FontSize',fontsize,'FontName','Times')
	subplot(1,3,2)
	plot(t,J,'k-.','LineWidth',2)
	grid
	set(gca,'Units','normalized','FontUnits','points','FontWeight','normal','FontSize',fontsize,'FontName','Times')
	xlabel({'$t$'},'FontUnits','points','Interpreter','latex','FontWeight','normal','FontSize',fontsize,'FontName','Times')
	xlim(tinterval)
	ylabel({'$J(t)$'},'FontUnits','points', 'Interpreter','latex','FontSize',fontsize,'FontName','Times')
	subplot(1,3,3)
	plot(R,J,'k:','LineWidth',2)
	grid
	set(gca,'Units','normalized','FontUnits','points','FontWeight','normal','FontSize',fontsize,'FontName','Times')
	xlabel({'$R(t)$'},'FontUnits','points','Interpreter','latex','FontWeight','normal','FontSize',fontsize,'FontName','Times')
	ylabel({'$J(t)$'},'FontUnits','points', 'Interpreter','latex','FontSize',fontsize,'FontName','Times')
end