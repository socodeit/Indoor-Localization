function   plotcdf(k,ref,checker)
%PLOTCDF to plot CDF vs error for both Euclidean and mahattan distance to
%compare their accuracy

sz = size(checker);

%Storing Euclidean error
errorE = zeros(sz(1)+1,1);

%Storing cdf
cdf = errorE;
x = 1/sz(1);

%Storing Manhattan error
errorM = errorE;

for i=2:(sz(1)+1)
    errorE(i) = posE(k,i-1,checker,ref,1);
    cdf(i) = cdf(i-1) + x;
    errorM(i) = posM(k,i-1,checker,ref,1);
end

% Sorting error
[s_errorE,~] = sort(errorE);
[s_errorM,~] = sort(errorM);

% Plotting CDF vs Euclidean and Manhattan error
figure
axis([0 8 0 1]);
plot(s_errorE,cdf,'-b',s_errorM,cdf,'--r');
set(gca,'FontSize',20,'fontWeight','bold');
grid minor;
xlabel('Error(m)');
ylabel('CDF');
legend('Euclidean Distance','Manhattan Distance');
title('CDF vs Error Comparision');
