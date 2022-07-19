function [e_x, e_y, e_z, gamma_xz] = Stress_2_Strains(sigma_xx, sigma_xz, sigma_zz, E, nu)
% Calculates Hooke's plane strain using stresses
% Strains' coordinate system = sigma's coordinate system
% 
% The z direction is 'vertical'. The x direction is in a 'horizontal plane'. 
%   The y is perpendicular to both z and x.
% 
% Input arguments:
% sigma_xx - 'horizontal' stress [N m^-2]
% sigma_xz - shear stress [N m^-2]
% sigma_zz - 'vertical' stress [N m^-2]
%
% Optional Inputs:
% E - Modulus of elasticity, or Young's modulus [Pa]
%     Default is 8.75e10 Pa
% nu - Poisson's ratio [unitless]
%      Default is 0.25
%
% Outputs:
% e_x - strain in x direction
% e_y - strain in y direction
% e_z - strain in z direction
% gamma_xz - shear strain
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

e_x = sigma_xx/E - nu*sigma_zz/E;
e_z = sigma_zz/E - nu*sigma_xx/E;
e_y = -nu*sigma_xx/E - nu*sigma_zz/E;

G = E/(2*(1 + nu));

gamma_xz = sigma_xz/G;
end