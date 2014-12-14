% This program implements Golden Section Line Search

function x = GSLineSearch(J)
    J = @(x) (x-0.4)^12;
    t = (3 - sqrt(5)) / 2;
    interv = [0, 1];
    k = 0;
    while(1)
        x1 = interv(1)+t;
        x2 = interv(2)-t;
        if (abs(J(x1)-J(x2)) < 1e-12)
            break;
        end
        if(J(x1) < J(x2))
            interv(2) = interv(2) - t;
        elseif (J(x1) > J(x2))
            interv(1) = interv(1) + t;
        else
            break;
        end
        fprintf('%10s: [%f, %f]\n', 'Interval', x1, x2)
        t = t * (interv(2)-interv(1));
        k = k + 1;
        if (k > 100)
            break
        end
        fflush(stdout)
    end
    x = (x1 + x2) / 2;
    fprintf('Final solution: %f\n', x);
end
