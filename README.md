# DM-HBA: Dynamic mean-based honey badger algorithm

This is the original implementation of the **DM-HBA: Dynamic mean-based honey badger algorithm**. 
> The algorithm is archived in Zenodo with [DOI: 10.5281/zenodo.17228459](https://doi.org/10.5281/zenodo.17228459)

## 📘 Reference Paper

The mathematical formulation and experimental results of DM-HBA are detailed in the following peer-reviewed publication:

> **Shaymah Akram Yasear**,  
> *DM-HBA: Dynamic mean-based honey badger algorithm for engineering design optimization problems*,  
> **Journal of Computational Design and Engineering**, Volume -, Issue -, December 2025, Pages - 
> [DOI: 10.1093/jcde/qwaf135](https://doi.org/10.1093/jcde/qwaf135)

## 📁 Repository Contents

- `DM_HBA.m` – Main MATLAB implementation of DM_HBA 
- `main.m` – Definitions of benchmark functions used in experiments
- `CEC2017/` – CEC2022 test suit
- `input_data_CEC17/` – Input data of CEC2017 benchmark funtions


## 🛠️ Requirements

- MATLAB R2020b or later

## 📬 Contact

For questions, feedback, or collaboration opportunities, please contact:

📧 **shayma.akram.yasear@gmail.com**

## 📜 License

This project is licensed under the MIT License – see the [LICENSE](LICENSE) file for details.








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
