function cg(init=[0;0;0])
    % Conjugate method solving Quadratic form minimization
    % Min 1/2 <Ax, x> - <b, x>
    A = [1 1 0; 1 2 1; 0 1 2];
    b = [-2; 0; 0];
    init = reshape(init, [3,1]);

    s = cell(3,1); % step
    r = cell(3,1); % residue
    x = cell(3,1); % x
    x{1} = init;
    s{1} = -A * init +b;
    r{1} = s{1};
    % iterates
    disp('===> x: '), disp(x{1}')
    for i = 1: 3
        alpha(i) = (r{i}' * r{i}) / (s{i}' * (A*s{i}));
        x{i+1} = x{i} + alpha(i) * s{i};
        r{i+1} = r{i} - alpha(i) * A * s{i};
        beta(i+1) = (r{i+1}' * r{i+1}) / (r{i}' * r{i});
        s{i+1} = r{i+1} + beta(i+1) * s{i};
        disp('===> x: '), disp(x{i+1}')
    end
end
