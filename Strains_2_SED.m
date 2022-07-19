function u = Strains_2_SED(e_x,e_z,gamma_xz,E,nu)
% Calculates strain energy density using strains
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

G = E/(2*(1 + nu));

u = E/(2*(1 - nu^2))*(e_x.^2 + e_z.^2 - 2*nu*e_x.*e_z) + G/2*gamma_xz.^2;
end