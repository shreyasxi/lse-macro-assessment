# ---------------------------------------------------------------------------- #
# Task C Codes
# Here you are provided with initial codes that you will need to develop
# as explained in Task C of the assignment.
# ---------------------------------------------------------------------------- #

import numpy as np

# Set parameters:
beta = 0.95                                          # Discount factor
sigma = 2.0                                          # Coefficient of relative risk aversion

# Asset grid parameters:         
a_min = 0.0                                          # Borrowing limit
a_max = 20.0                                         # Maximum asset level
a_size = 500                                         # Number of asset grid points
a_grid = np.linspace(a_min, a_max, a_size)           # Asset grid
r = 0.03                                             # Interest rate

# Income process parameters [leave these unchanged]:
y_states = np.array([0.35, 0.7, 1.0, 1.3, 1.65])
y_transition = np.array(
    [[0.5, 0.3, 0.1, 0.05, 0.05],
     [0.2, 0.5, 0.2, 0.05, 0.05],
     [0.1, 0.2, 0.4, 0.2, 0.1],
     [0.05, 0.1, 0.2, 0.5, 0.15],
     [0.05, 0.05, 0.1, 0.3, 0.5]]
)

num_y = len(y_states)
num_a = len(a_grid)
num_states = num_y * num_a

def utility(c):
    c_used = np.maximum(c, np.finfo(float).eps)  
    if sigma == 1:
        return np.log(c_used)
    else:
        return (c_used**(1 - sigma)) / (1 - sigma)
    
state_grid = np.array([(a, y) for y in y_states for a in a_grid])

V_init = np.zeros(num_states) 

consumption = np.zeros((num_states, num_a))
for i_y in range(num_y):
    for i_a in range(num_a):
        state_index = i_y * num_a + i_a
        for j_a in range(num_a):
            a_next = a_grid[j_a]
            income = y_states[i_y]
            consumption[state_index, j_a] = income + (1+r)*a_grid[i_a] - a_next

utility_matrix = utility(consumption)

tol = 0.001
max_iter = 1000
V = V_init.copy()
for it in range(max_iter):

    V_reshaped = V.reshape((num_y, num_a))

    EVPrime_reshaped = np.zeros_like(utility_matrix)

    for i_y in range(num_y):
        y_transition_reshaped = y_transition[i_y].reshape((num_y, 1))
        EVPrime_y = np.matmul(V_reshaped.T, y_transition_reshaped)

        EVPrime_reshaped[(i_y * num_a):((i_y + 1) * num_a), :] = np.repeat(EVPrime_y.T, num_a, axis=0)

    V_til = utility_matrix + beta * EVPrime_reshaped
    V_new = np.max(V_til, axis=1)


    policy_indices = np.argmax(V_til, axis=1)
    consumption_policy = consumption[np.arange(num_states), policy_indices]


    diff = np.max(np.abs(V_new - V))
    V = V_new
    if diff < tol:
        print(f'Converged after {it} iterations.')
        break


AssetPolicy = policy_indices.reshape((num_y, num_a))
consumption_policy = np.zeros(num_states)
for i in range(num_states):
    consumption_policy[i] = consumption[i, policy_indices[i]]

ConsumptionPolicy = consumption_policy.reshape((num_y, num_a))
    