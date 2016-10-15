function varlist(X, Y, varargin)
    fprintf('Total number of inputs = %d\n',nargin);

    nVarargs = length(varargin);
    fprintf('Inputs in varargin(%d):\n',nVarargs)
    for k = 1:nVarargs
        fprintf('   %d\n', varargin{k})
    end