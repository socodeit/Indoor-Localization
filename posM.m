function [y,POS] = posM(k,validation_index,checker,ref,mode)
% Function to calculate position and error using euclidean distance
% k                : k for kNN (k-Nearest Neighbour)
% validation_index : Row no. of validation data whose position is to determined
% checker          : Validation data
% ref              : training data
% mode             : 1 for FM, 2 for WiFi, 3 for both Fm and Wifi

format long;

% To get range of column to be used for reference
m = size(checker);
if mode==1 % FM from column 3 to column 12
    si = 3;
    ei = 12;
else
    if mode==2 % WiFi from column 13 to last column
        si = 13;
        ei = m(2);
    else % FM + WiFi from column 3 to last column
        si = 2;
        ei = m(2);
    end
end
x=checker(validation_index,si:ei);      %unknown position

[m,n]=size(ref);
W=zeros(m,1);                   %Magnitude

   for i=1:m
        r=ref(i,si:ei);
        z=x-r;
        z=abs(z);
   %z=z(abs(z)>198);
        sq_sum=sum(z);
        mag=sq_sum;
        W(i,1)=mag;
    end
     
% Sorting based on the distance
[~,index]=sort(W(:,1));

% actual coordinates
ac_lat=checker(validation_index,1);
ac_long=checker(validation_index,2);

% Choosing first k closest point and calculating position
Sum_PxW=[0 0];
Sum_W=0;
for j=1:k
   Pj=ref(index(j),1:2);
   Sum_PxW = Sum_PxW + Pj*(1/W(index(j)));
   Sum_W = Sum_W + (1/W(index(j)));
end
Sum_PxW;
Sum_W;
pos=Sum_PxW./Sum_W;
POS=pos;

y=sqrt(abs(pos(1)-ac_lat)^2+abs(pos(2)-ac_long)^2);
end



