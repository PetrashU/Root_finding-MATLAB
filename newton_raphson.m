function [x,k] = newton_raphson(f,x0,tol,bool,dx)
% bool = 0 - metoda centralna
% bool = 1 - metoda wstecz
% bool = 2 - metoda w przód
    x_p = [x0-dx,x0,x0+dx];
    switch bool
        case 0
            f_p = (f(x_p(3)) - f(x_p(1))) / (x_p(3)-x_p(1));
        case 1
            f_p = (f(x_p(2)) - f(x_p(1))) / (x_p(2) - x_p(1));
        case 2
            f_p = (f(x_p(3)) - f(x_p(2))) / (x_p(3) - x_p(2));
        otherwise
            error("Nieprawidłowa wartość metody liczenia pochodnej!");
    end
    k = 0;
    err = 0;
    x_prev = 0;
    x = 0;
    while k==0 || err>tol
        k=k+1;
        x = x0-(f(x0)/f_p);
        err = abs(x-x_prev);
        x_prev = x;
        x0=x;
    end
end