% Script to plot FM RSSI vs frequency and to detect station using peaks in
% the plot

%peak detetcion
[m,~] = size(fmlog);
pre = fmlog(1,2);
count=0;
for i = 2:m-1
    if fmlog(i,2) > pre && fmlog(i,2) > 30 && fmlog(i,2) > fmlog(i+1,2)
        count = count+1;
    end
    pre=fmlog(i,2);
end
peaks=zeros(count,2);
pre = fmlog(1,2);
for i = 2:m-1
    if fmlog(i,2) >= pre && fmlog(i,2) > 30 && fmlog(i,2) > fmlog(i+1,2)
        peaks(i-1,1)=fmlog(i,1);
        peaks(i-1,2)=fmlog(i,2);
    end
    pre=fmlog(i,2);
end

%plotting
figure
plot(fmlog(:,1),fmlog(:,2),peaks(:,1),peaks(:,2),'o');
set(gca,'FontSize',20,'fontWeight','bold');
xlabel('FM frequency (MHz)');
xlim([87,110]);
ylabel('FM RSSI');
legend('Signal Strength','Peaks');
title('FM RSSI variation');