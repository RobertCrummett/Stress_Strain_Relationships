function [max_shear, theta_s] = Maximum_Shear(sigma_xx,...
    sigma_xz, sigma_zz)
% Calculate maximum shear direction and orientation
%
% Input arguments:
% sigma_xx - The xx component of stress feild. [N m^-2]
% sigma_xz - The xz component of stress feild. [N m^-2]
% sigma_zz - The zz component of stress feild. [N m^-2]
%
% Outputs:
% max_shear - the magi=nitude of the maximum shear. [N m^-2]
% theta_s - counter-clockwise rotation of the reference axes. [degrees]

max_shear = sqrt(((sigma_xx - sigma_zz)/2).^2 + (sigma_xz).^2);

theta_s = 1/2*atan2(-(sigma_xx - sigma_zz)/2, sigma_xz);

end