% This script implements Steepest descent

function x = spd(init=[0,0,0])
% F - Function
% J - Gradient
% 
    A = [1 1 0; 1 2 1; 0 1 2];
    b = [-2; 0; 0];
    F = @(x) 1/ 2 * x'*A*x -b'*x;
    J = @(x) A*x-b;

    x = reshape(init, [3,1]);
    k = 0;
    while(1)
        Falp = @(alp) F(x-alp*J(x));
        alpha = fminsearch(Falp, 1);
        x = x - alpha*J(x);
        if (abs(J(x)) < 1e-5)
            break
        end
        if (k > 100)
            break;
        end
        k = k + 1;
        fprintf('------%d------\n', k);
        disp(x);
        fflush(stdout)
    end
    disp('Final solution:'), disp(x);
end
