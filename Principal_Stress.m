function [sigma_1, sigma_2, theta_p] = Principal_Stress(sigma_xx,...
    sigma_xz, sigma_zz)
% Calculate principal stresses from stress feild
%
% Input arguments:
% sigma_xx - The xx component of stress feild. [N m^-2]
% sigma_xz - The xz component of stress feild. [N m^-2]
% sigma_zz - The zz component of stress feild. [N m^-2]
%
% Outputs:
% sigma_1 - maximum principal stress. [N m^-2]
% sigma_2 - minimum principal stress. [N m^-2]
% theta_p - counter-clockwise rotation of the reference axes. [degrees]

sigma_average = (sigma_xx + sigma_zz)/2;
R = sqrt(((sigma_xx - sigma_zz)/2).^2 - sigma_xz.^2);

sigma_1 = sigma_average + R;
sigma_2 = sigma_average - R;

theta_p = 1/2*atan2(sigma_xz, (sigma_xx - sigma_zz)/2);
theta_p = theta_p*180/pi; % output in degrees
end