# Dynamic Mean-based Honey Badger Algorithm (DM-HBA)

This repository implements the **Dynamic Mean-based Honey Badger Algorithm (DM-HBA)**

## 🚀 Usage

```matlab
options.objf = @your_objective_function;
options.nVar = 30;
options.lb = -100; 
options.ub = 100;
options.popSize = 30;
options.MaxGen = 500;
options.lambda = 0.2;

[best_score, best_solution, convergence] = DM_HBA(options);
