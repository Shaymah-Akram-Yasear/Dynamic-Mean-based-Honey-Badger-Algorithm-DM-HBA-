# Dynamic Mean-based Honey Badger Algorithm (DM-HBA)

This repository implements the **Dynamic Mean-based Honey Badger Algorithm (DM-HBA)**, a novel metaheuristic optimization algorithm inspired by the foraging behavior of honey badgers, enhanced with dynamic mean-based guidance and adaptive control parameters.

## 📌 Features
- Dynamic beta adaptation for exploration-exploitation balance
- Mean-based guidance mechanism for improved convergence
- Compatible with standard benchmark functions (e.g., CEC, Sphere, Rastrigin)

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
