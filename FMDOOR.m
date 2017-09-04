% To create a plot in order to show variation in FM RSSI while moving
% through door

% Plotting variation in FM with steps through door
figure
sz = size(fmDoor);
x=1:sz(1); % time-step ,i.e, x-axis of the plot
hold on;
fnplt(csapi(x,fmDoor(:,1)),'g');
fnplt(csapi(x,fmDoor(:,2)),'b');
fnplt(csapi(x,fmDoor(:,3)),'r');
plot(x,fmDoor(:,1),'.',x,fmDoor(:,2),'.',x,fmDoor(:,3),'.');
set(gca,'FontSize',25,'fontWeight','bold');
grid minor;
xlabel('Time Unit');
ylabel('FM RSSI');
legend('FM Station 1','FM Station 2','FM Station 3');
title('FM RSSI variation through Door');
