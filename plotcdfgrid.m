function  plotcdfgrid( k,ref,checker,MODE )
%PLOTCDFGRID:- Plot CDF vs error for different mode ,i.e, euclidean
%distance (MODE=1) or manhattan distance (MODE=2)

sz = size(checker);

% For storing error:
% Column 1 - Error only from FM
% Column 2 - Error from WiFi
% Column 3 - Error from both FM and Wifi
error = zeros(sz(1)+1,3);

% Storing CDF
cdf = zeros(sz(1)+1,1);
x = 1/sz(1);

for i=2:(sz(1)+1)
    for mode = 1:3
        if(MODE==1) %Euclidean Distance
            error(i,mode) = posE(k,i-1,checker,ref,mode);
        else %Manhattan Distance
            error(i,mode) = posM(k,i-1,checker,ref,mode);
        end
    end
    cdf(i) = cdf(i-1) + x;
end

%Sorting Error
[s_error,~] = sort(error);
size(s_error);

% Plotting CDF vs Error
figure
plot(s_error(:,1,1),cdf,'-ob',s_error(:,2,1),cdf,'-.og',s_error(:,3,1),cdf,':or');
set(gca,'FontSize',20,'fontWeight','bold');
xlabel('Error (m)');
ylabel('CDF');
grid minor;
axis([0 12 0 1])
legend('FM','WiFi','FM+WiFi');
if(MODE==1) %Euclidean Distance
    title('CDF vs Error using Euclidean Distance');
else
    title('CDF vs Error using Manhattan Distance');
end

end

