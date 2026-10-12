% This matlab document sets the required setpoints for the fan operation.
mdot = 1150; % [Kg/s]
rc = 1.65; % (P02/P01) [-]
ut = 350; % (tip speed) [m/s]
P01 = 1.013; % [bar]
T01 = 288.15; % [K]

% Assumed constants for Air as working fluid.
Cp = 1005; % [J/KgK] 
g = 1.4; % (Heats Ratio)
R = 287; % [J/KgK]
nu = 1.813e-5; %Pa*s