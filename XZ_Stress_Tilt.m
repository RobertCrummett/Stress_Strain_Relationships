function [sigma_xx_1, sigma_xz_1, sigma_zz_1] = XZ_Stress_Tilt(sigma_xx,...
    sigma_xz, sigma_zz, phi)
% Spins the reference axis of XZ_Stress by 'phi' degrees
%
% Input arguments:
% sigma_xx - The xx component of stress feild. [N m^-2]
% sigma_xz - The xz component of stress feild. [N m^-2]
% sigma_zz - The zz component of stress feild. [N m^-2]
% phi - The amount to spin the x axis by counter clockwise. [degrees]
%
% Output arguments:
% sigma_xx_1 - The xx component of stress feild in the new frame. [N m^-2]
% sigma_xz_1 - The xz component of stress feild in the new frame. [N m^-2]
% sigma_zz_1 - The zz component of stress feild in the new frame. [N m^-2]

phi = phi/180*pi;

sigma_xx_1 = (sigma_xx + sigma_zz)/2 + (sigma_xx - sigma_zz)/2*cos(2*phi)...
    + sigma_xz*sin(2*phi);
sigma_zz_1 = (sigma_xx + sigma_zz)/2 - (sigma_xx - sigma_zz)/2*cos(2*phi)...
    - sigma_xz*sin(2*phi);
sigma_xz_1 = - (sigma_xx - sigma_zz)/2*sin(2*phi) + sigma_xz*cos(2*phi);

end