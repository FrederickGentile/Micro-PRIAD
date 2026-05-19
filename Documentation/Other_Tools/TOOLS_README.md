In the `$MICRO_PRIAD_HOME/Benchmarking_Tools` directory you will find different julia file that you can execute to run `NOMAD`, an `LHS` (Latin Hypercube Sampling) or a `RS` (Random Search) on each instance for each input length. 
## For NOMAD:
To use the folowing command, you need to have NOMAD on your computer and have the environment variable `NOMAD_HOME` that reprensent the directory where NOMAD is installed containing bin, src, etc. You can initialize it the same way you initialized the environment variable `MICRO_PRIAD_HOME` (precedure desribed in the main README).

To launch NOMAD on each instance for each input length on a feasible an infeasible starting point, run the folowing command in the terminal.
```
julia $MICRO_PRIAD_HOME/Benchmarking_Tools/Run_NOMAD.jl $NOMAD_HOME
```
> Note: You could also give manualy the full path instead of giving the environment variable `NOMAD_HOME` itself.

The results of a previous launch of "Run_NOMAD.jl" are in "NOMAD_results" folder in this directory.
## For latin hypercube sampling:
To use the folowing command, you need to install the julia package "Surrogates" (see the section `Installing julia package "Surrogates"`).

To launch LHS on each instance for each input length on a feasible an infeasible starting point, run the folowing command in the terminal.
```
julia $MICRO_PRIAD_HOME/Benchmarking_Tools/Run_LHS.jl
```
An other file "read_LHS.jl" is implemented to give some stat about the LHS. It can be run similarly to other .jl file.

The results of a previous launch of "Run_LHS.jl" are in "LHS_results" folder in this directory. 
### Installing julia package "Surrogates"
To install the package or can run the following lines in your terminal:
```
julia
```
```
import Pkg
```
```
Pkg.add("Surrogates")
```
## For rabdom search:
To launch RS on each instance for each input length on a feasible an infeasible starting point, run the folowing command in the terminal.

```
julia $MICRO_PRIAD_HOME/Benchmarking_Tools/Run_RS.jl
```

--------------------------------------------

Back to Main [README](/Micro-PRIAD/README.md).