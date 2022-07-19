function u = Stress_2_SED(sigma_xx,sigma_xz,sigma_zz,E,nu)
% Calculates strain energy density using stresses
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
% u - strain energy density 
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

u = sigma_xx.^2/(2*E) + sigma_zz.^2/(2*E) - nu*sigma_xx.*sigma_zz/E + ...
    sigma_xz.^2/G;
end