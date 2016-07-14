function [c,ul]=polq2g(ai,h)
%Usage: [c,ul]=polq2g(a,h)
%
% Convert a polynomial in the q-domain into a polynomial in the
% Gamma-domain. Samplingperiod h. Result c. Transformmatrix ul.
%

% testfile: t58.m

%--------------------------------------------------------------------------

[ad,l]=polq2d(ai,h);
[c,u]=pold2g(ad,h);
ul=u*l;
end
                               


