% To create a plot in order to show variation in WiFi RSSI while moving
% through door

% Plotting variation in WiFi with steps through door
figure
sz = size(wifiDoor);
x=1:sz(1);
hold on;
fnplt(csapi(x,wifiDoor(:,1)),'g');
fnplt(csapi(x,wifiDoor(:,2)),'b');
fnplt(csapi(x,wifiDoor(:,3)),'r');
plot(x,wifiDoor(:,1),'.',x,wifiDoor(:,2),'.',x,wifiDoor(:,3),'.');
set(gca,'FontSize',25,'fontWeight','bold');
grid minor;
xlabel('Time Unit');
ylabel('WiFi RSSI');
legend('WiFi APN 1','WiFi APN 2','WiFi APN 3');
title('WiFi RSSI variation through Door');