function [Mean ,Nine,detail] = avgerror(k,checker,ref,limit,mode)
% Function to calculate average error, nineteeth percentile error, other
% details

% Input
% k                : k for kNN (k-Nearest Neighbour)
% validation_index : Row no. of validation data whose position is to determined
% checker          : Validation data
% ref              : training data

% mode             : 1 for FM, 2 for WiFi, 3 for both Fm and Wifi

% Output
% Mean             : Average error
% Nine             : Nineteeth percentile error
% detail           : (Column1,Colum2)=> Actual coordinates,
% (Column3,Column4)=> Predicted Coordinated, Column5 => Error

Mean=0;
error=zeros(1,limit);
detail = zeros(limit,5);
for i=1:limit
    fprintf('%3d %',i);
    % Change posE to posM inorder to calculate for manhattan distance
    [error(i), p]=posE(k,i,checker,ref,mode);
    detail(i,1) = checker(i,1);
    detail(i,2) = checker(i,2);
    detail(i,3) = p(1);
    detail(i,4) = p(2);
    detail(i,5) = error(i);
    fprintf('\b\b\b\b');
end
error = sort(error);
Mean = mean(error);
nineth = floor(0.9*limit);
Nine = error(nineth);
end

