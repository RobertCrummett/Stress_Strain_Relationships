function [sigma_xx, sigma_xz, sigma_zz] = Strains_2_Stress(e_x, e_z, gamma_xz, E, nu)
% Calculates stresses using Hooke's plane strain
% Strains' coordinate system = sigma's coordinate system
% 
% The z direction is 'vertical'. The x direction is in a 'horizontal plane'. 
%   The y is perpendicular to both z and x.
% 
% Input arguments:
% e_x - strain in x direction
% e_z - strain in z direction
% gamma_xz - shear strain
%
% Optional Inputs:
% E - Modulus of elasticity, or Young's modulus [Pa]
%     Default is 8.75e10 Pa
% nu - Poisson's ratio [unitless]
%      Default is 0.25
%
% Outputs:
% sigma_xx - 'horizontal' stress [N m^-2]
% sigma_xz - shear stress [N m^-2]
% sigma_zz - 'vertical' stress [N m^-2]
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

G = E/(2*(1 + nu));

sigma_xz = gamma_xz*G;

sigma_xx = E*e_x/(1 - nu^2) + nu*E*e_z/(1 - nu^2);
sigma_zz = E*e_z/(1 - nu^2) + nu*E*e_x/(1 - nu^2);

end