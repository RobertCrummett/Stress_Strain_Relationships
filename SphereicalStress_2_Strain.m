function [e_0,dilitation,K] = SphereicalStress_2_Strain(sigma_0, E, nu)
% Calculates strain from spherical stress
% This means that shear stresses are zero and normal stresses are equal
% 
% Input arguments:
% sigma_0 - normal stress in x, y, and z direction [N m^-2]
%
% Optional Inputs:
% E - Modulus of elasticity, or Young's modulus [Pa]
%     Default is 8.75e10 Pa
% nu - Poisson's ratio [unitless]
%      Default is 0.25
%
% Outputs:
% e_0 - strain [unitless]
% dilitation - unit volume change [unitless]
% K - bulk or volume modulus of elasticity [N m^-2]
%
% These formulas apply to rock under uniform compression, such as rock deep
% within the earth or under water. Read more at:
% https://academic.uprm.edu/pcaceres/Courses/MMII/IMoM-5A.pdf

if ~exist("E","var")
    E = 8.75e10;
end

if ~exist("nu","var")
    nu = 0.25;
end

e_0 = sigma_0/E*(1 - 2*nu);

dilitation = 3*sigma_0*(1 - 2*nu)/E;

K = E/(3*(1 - 2*nu));
end