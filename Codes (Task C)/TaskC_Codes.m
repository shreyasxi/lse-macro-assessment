% -------------------------------------------------------------------- %
% Task C Codes
% Here you are provided with initial codes that you will need to develop
% as explained in Task C of the assignment.
% -------------------------------------------------------------------- %

clear; clc;

% Set parameters:
beta  = 0.95;                               % Discount factor
sigma = 2.0;                                % Coefficient of relative  
                                                % risk aversion

% Asset grid parameters:
a_min  = 0.0;                               % Borrowing limit
a_max  = 20.0;                              % Maximum asset level
a_size = 500;                               % No. of asset grid points
a_grid = linspace(a_min, a_max, a_size);    % Asset grid
r      = 0.03;                              % Interest rate

% Income process parameters [leave these unchanged]:
y_states = [0.35, 0.7, 1.0, 1.3, 1.65];
y_transition = [ ...
    0.5,  0.3,  0.1,  0.05, 0.05; ...
    0.2,  0.5,  0.2,  0.05, 0.05; ...
    0.1,  0.2,  0.4,  0.2,  0.1;  ...
    0.05, 0.1,  0.2,  0.5,  0.15; ...
    0.05, 0.05, 0.1,  0.3,  0.5];

num_y      = length(y_states);
num_a      = length(a_grid);
num_states = num_y * num_a;

utility = @(c,sigma) ...
    (sigma == 1) .* log(max(c, eps)) + ...
    (sigma ~= 1) .* ((max(c, eps).^(1-sigma)) ./ (1-sigma));

state_grid = zeros(num_states, 2);
idx = 1;
for i_y = 1:num_y
    for i_a = 1:num_a
        state_grid(idx, :) = [a_grid(i_a), y_states(i_y)];
        idx = idx + 1;
    end
end

V_init = zeros(num_states, 1);

consumption = zeros(num_states, num_a);
for i_y = 1:num_y
    for i_a = 1:num_a
        state_index = (i_y - 1) * num_a + i_a;
        for j_a = 1:num_a
            a_next = a_grid(j_a);
            income = y_states(i_y);
            consumption(state_index, j_a) = income + (1 + r) * ...
                a_grid(i_a) - a_next;
        end
    end
end

utility_matrix = utility(consumption, sigma);

tol = 0.001;
max_iter = 1000;
V = V_init;

for it = 1:max_iter

    V_reshaped = reshape(V, [num_a, num_y])';

    EVPrime_reshaped = zeros(size(utility_matrix));

    for i_y = 1:num_y
        y_transition_reshaped = y_transition(i_y, :)';

        EVPrime_y = (V_reshaped') * y_transition_reshaped;

        row_start = (i_y - 1) * num_a + 1;
        row_end   = i_y * num_a;
        EVPrime_reshaped(row_start:row_end, :) = ...
            repmat(EVPrime_y', num_a, 1);
    end

    V_til = utility_matrix + beta * EVPrime_reshaped;
    [V_new, policy_indices] = max(V_til, [], 2);

    policy_indices = policy_indices;
    idx2 = sub2ind(size(consumption), (1:num_states)', policy_indices);
    consumption_policy = consumption(idx2);

    diff = max(abs(V_new - V));
    V = V_new;
    if diff < tol
        fprintf('Converged after %d iterations.\n', it);
        break
    end

end

AssetPolicy = reshape(policy_indices, [num_a, num_y])';
consumption_policy = zeros(num_states, 1);
for i = 1:num_states
    consumption_policy(i) = consumption(i, policy_indices(i));
end

ConsumptionPolicy = reshape(consumption_policy, [num_a, num_y])';