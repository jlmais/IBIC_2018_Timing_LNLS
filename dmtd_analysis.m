clear all; close all; clc;

RF = 500e6;
fref = RF*5/36;
N = 144;
fdmtd = fref*N./(N+1);

tmin = 1./(fref*N);

fbeat = fref./(N+1);

fmin = fref-1./(((N+1)/fref+tmin)./(N+1))

tmin./(1/(fref-1)-1/fref)

1/(N*fref)

fbeat/(fdmtd*fref)

