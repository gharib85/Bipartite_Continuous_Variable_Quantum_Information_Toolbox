# Bipartite Continuous Variable Toolbox

BCV is a MATLAB Toolbox for studying time evolution of bipartite quantum gaussian states


## Installation

Download this Toolbox and add its main folder to the MATLAB path:

```MATLAB
addpath('<download-path>/BCV');
```

## Usage

Create a folder in _BCV/expectation_value/_ and inside it create a .m file that calculates the expectation value for the annihilation/creation operators ![equation](https://latex.codecogs.com/gif.latex?%28%5Chat%7Ba%7D_j/%5Chat%7Ba%7D%5E%5Cdagger_j%29) for every mode ![equation](https://latex.codecogs.com/gif.latex?j=1,2) of your bipartite system and quadratic combinations of them:
![equation](https://latex.codecogs.com/gif.latex?%5Chat%7Ba%7D_j%5Chat%7Ba%7D_j%2C%20%5Chat%7Ba%7D%5E%5Cdagger_j%5Chat%7Ba%7D_j%2C%20%5Chat%7Ba%7D_1%5Chat%7Ba%7D_2%2C%20%5Chat%7Ba%7D_1%5Chat%7Ba%7D_2%5E%5Cdagger%5C%3B%20%2Cj%3D1%2C2.) The toobox can handle up to three modes in a system and change the bipartition under study.


Change the system under study:

```
change_system_to('<system_folder_name>')
```
(Optional) Name the modes (default names are 'a_1', 'a_2' and 'a_3'):
```
change_subsystem_label(['<all_modes_names>'])
```

Specify the desired mode and/or bipartition (default names are 'a_1a_1', 'a_1a_2' and 'a_2a_3'):
```
change_subsystem_to('<mode_name>')
change_bipartition_to('<bipartition_name>')
```

The toolbox is now set to use, every mathematical routine only needs a parameter (array) with the times at which to be evaluated

#### Running Example
```c
addpath("<download-path>/BCV/Examples/Mirror_in_the_Middle__User_Interface")
new_subsystems_entanglement
```

## Author
[Igor Brandão](mailto:igorbrandao@aluno.puc-rio.br) - Master's student in [Thiago Guerreiro](mailto:barbosa@puc-rio.br)'s Lab at Pontifícia Universidade Católica do Rio de Janeiro

## Mathematical Formalism
This code was based on and uses the same formalism as:

> Christian Weedbrook, Stefano Pirandola, Raúl García-Patrón, Nicolas J. Cerf, Timothy C. Ralph, Jeffrey H. , "Gaussian quantum information", [Rev. Mod. Phys. 84, 621](https://journals.aps.org/rmp/abstract/10.1103/RevModPhys.84.621)

## License
This code is made available under the Creative Commons Attribution-NonCommercial 4.0 License. For full details see LICENSE.md.

Cite this toolbox as: 
> Igor Brandão, "Bipartite Continuous Variable Toolbox" [https://github.com/IgorBrandao42/Bipartite_Continuous_Variable](https://github.com/IgorBrandao42/Bipartite_Continuous_Variable). Retrived <date you downloaded>

## File Listing
```C
MATHEMATICAL ROUTINES
covariance_matrix2         - Calculation of the covariance matrix V for a bipartite system
logarithmic_negativity2    - Calculation of the logarithmic negativity for a bipartite system
quadratures                - Calculation of the expectation values for the quadratures of a subsystem
symplectic_eig2            - Calculation of the symplectic eigenvalues of the covariance matrix
symplectic_eig_PT2         - Calculation of the symplectic eigenvalues of the partially transposed
uncertainties              - Calculation of the quadrature uncertaintites of a subsystem
von_Neumann_Entropy2       - Calculation of the von Neumann entropy for a bipartite system
Duan_Criteria              - Calculation of the LHS of the Duan criteria for a bipartite system
calculate_expected_values1 - Calculate the expectation values of annihilation/creation operator
calculate_expected_values2 - Calculate every possible combination of expectation values of annihilation/creation operator
func                       - Auxiliar mathematical function

OTHER FILES
change_system_to           - Change the system to be studied
change_subsystem_to        - Change the subsystem to be studied
change_subsystem_label     - Change the label the program uses to describe each subsystems and bipartitions (pair of subsystems)
change_bipartition_to      - Change the bipartition of the system to be studied
isonpath                   - Checks if the folder exists on the MATLAB path

FOLDERS
Examples/                  - Folder with working example
expectation_value/         - Folder where subfolders with .m files calculating the expectation values should be saved
In_Developtment/           - Folder with code not yet fully implemented
```
