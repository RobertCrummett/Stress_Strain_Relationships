function [e_x,e_y,e_z,dilitation,u] = TriaxialStress_2_Strain(sigma_xx, sigma_yy,...
    sigma_zz, E, nu)
% Calculates strain from triaxial stresses
% This means that shear stresses are zero
% 
% Input arguments:
% sigma_xx - normal stress in x direction [N m^-2]
% sigma_yy - normal stress in y direction [N m^-2]
% sigma_zz - normal stress in z direction [N m^-2]
%
% Optional Inputs:
% E - Modulus of elasticity, or Young's modulus [Pa]
%     Default is 8.75e10 Pa
% nu - Poisson's ratio [unitless]
%      Default is 0.25
%
% Outputs:
% e_x - strain in x direction [unitless]
% e_y - strain in y direction [unitless]
% e_z - strain in z direction [unitless]
% dilitation - unit volume change [unitless]
% u - strain energy density [N m^-2]
%
% Hooke's model assumes that:
% a)The material is uniform throughout the body (homogeneous)
% b)The material has the same properties in all directions (isotropic)
% c)The material follows Hooke%s law (linearly elastic material)
% read more at https://academic.uprm.edu/pcaceres/Courses/MMII/IMoM-5A.pdf

if ~exist("E","var")
    E = 8.75e10;
end

if ~exist("nu","var")
    nu = 0.25;
end

e_x = sigma_xx/E - nu*sigma_yy/E - nu*sigma_zz/E;
e_y = sigma_yy/E - nu*sigma_xx/E - nu*sigma_zz/E;
e_z = sigma_zz/E - nu*sigma_xx/E - nu*sigma_yy/E;

dilitation = (1 - 2*nu)/E*(sigma_xx + sigma_yy + sigma_zz);

u = 1/(2*E)*(sigma_xx.^2 + sigma_yy.^2 + sigma_zz.^2) - ...
    nu/E*(sigma_xx.*sigma_yy + sigma_xx.*sigma_zz + sigma_yy.*sigma_zz);
end