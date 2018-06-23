function [x,it,convg] = newton_plus(x0,f,g,maxit,tol)
%find the zero of function f, with gradient g provided
%Usage:[x,it,convg] = newton_plus(x0,f,g,maxit,tol)
    if nargin<5,    tol = 1e-10;
        if nargin<4,maxit = 100;
        end;end
    x = x0;
    fx = feval('f',x);
    convg = 0;
    it = 1;
    while ~convg,
        it = it+1;
        if norm(fx)<=tol,
            fprintf('nenton_plus Iteration successes!\n');
            convg = 1;
            return;
        end
        d = - feval(g,x) \ fx;
        lambda = 1;
        lsdone = 0;
        while ~lsdone,
            xn = x+lambda*d;
            fn = feval('f',xn);
            if norm(fn)<norm(fx),
                lsdone = 1;
            else
                lambda = 1/2* lambda;
                if lambda<-eps;
                    convg = -1;
                    error('line search fails!');
                end
            end
        end
        x = xn;
        f = fn;
        if it > maxit;
            convg = 0;
            error('newton method needs more iterations.!!');
        end
    end