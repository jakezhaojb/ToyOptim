% This script implements Newton's method

function x = Newton(init=[0,0,0])
% H - Hessian
% F - Function
% J - Gradient
    A = [1 1 0; 1 2 1; 0 1 2];
    b = [-2; 0; 0];
    F = @(x) 1/ 2 * x'*A*x -b'*x;
    J = @(x) A*x-b;
    H = A;

    x = reshape(init, [3,1]);
    k = 0;
    while(1)
        p = -H \ J(x);
        x = x + p;
        %disp('x: '), disp(x)
        if (abs(J(x)) < 1e-5)
            break
        end
        if (k > 100)
            break;
        end
        k = k + 1;
    end
    disp('Final solution:'), disp(x);
end
