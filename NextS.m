function [SPrime] = NextS(pe,s,a)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
b=rand();
for i=0:5;
    for j=0:5;
        for k=0:11;
            b=b-TransProb2(pe,s,a,[i,j,k]);
            if b<=0
                SPrime=[i,j,k];
                b=b+100;
            end
        end
    end
end


end

