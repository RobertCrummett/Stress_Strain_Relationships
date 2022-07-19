function [sigma_xx, sigma_xz, sigma_zz] = XZ_Stress(A, x, z, a)
% Stress Feild from Line Load
% Source:
% Amos et al 2014
% https://www.nature.com/articles/nature13275#Sec6
%
% Inputs:
% A - (rho*g*h)/(2*pi). [N m^-2]
% x - Horizontal range of stress calculation. [m]
%       Increase number of devisions in range to increase resolution.
% z - Vertical range of stress calculation. [m]
%       Increase number of devisions in range to increase resolution.
% a - Horizontal change of glacier half-width. [m]
%       Increase number of devisions in range to increase number of 
%       calculations.
%
% Outputs:
% sigma_xx - The xx component of stress feild. [N m^-2]
% sigma_xz - The xz component of stress feild. [N m^-2]
% sigma_zz - The zz component of stress feild. [N m^-2]
%
% Negative stresses indicate extention, or decompression.

% preallocating matrix sizes
sigma_xx = zeros([length(x) length(z) length(a)]);
sigma_zz = zeros([length(x) length(z) length(a)]);
sigma_xz = zeros([length(x) length(z) length(a)]);

for k = 1:length(z)
    for i = 1:length(a)
        for j = 1:length(x)
            theta_1 = atan2(x(j)-a(i), z(k));
            theta_2 = atan2(x(j)+a(i), z(k));

            sigma_xx(j,k,i) = A(i) * ((theta_1-theta_2) + ...
                sin(theta_1-theta_2)*cos(theta_1+theta_2));
            sigma_zz(j,k,i) = A(i) * ((theta_1-theta_2) - ...
                sin(theta_1-theta_2)*cos(theta_1+theta_2));
            sigma_xz(j,k,i) = A(i) * (sin(theta_1-theta_2)*...
                sin(theta_1+theta_2));
        end
    end
end

end