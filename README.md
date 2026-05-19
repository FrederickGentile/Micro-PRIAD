# Micro-PRIAD v1.0 (May 2026)
Micro-PRIAD is a multifidelity stocastic blackbox suite of problem that implement the intermediate return. It simulate an electrical grid to evaluate the cost of a given maintenance strategy. the goal is to minimize the cost by finding an optimal feasible strategy.
## Download
To download the **Micro-PRIAD** blackbox you must have Julia 1.12 version instaled on your computer. skip the section **downloading Julia** if you already have Julia 1.12 or newer version on your computer.
> Note : command below work on Linux and MAC OS.
### Downloading Julia
You can dowload Julia simply by running the following command in the terminal:
```
curl -fsSL https://install.julialang.org | sh
```
You should now have julia installed on your computer you can verify by typing 
```
julia
```
in the terminal.
> Note: You might need to load the julia module for the future use.
### Downloading Micro-PRIAD
 Now you only need to download the folder `Micro-PRIAD`. To use the commands descibded later, you need to initialize the environment variable  `$MICRO_PRIAD_HOME`. To create a environment variable you need to open `~/.bashrc` by running the following command in the terminal:
```
nano ~/.bashrc
```
Then, in the opened file, you initialize the environment variable `MICRO_PRIAD_HOME`, after the first line in the opened file, by writing:
```
MICRO_PRIAD_HOME="pathToMini-PRIAD/Micro-PRIAD"
```
where pathToMini-PRIAD is the directory where the folder `Micro-PRIAD` was downloaded. Save the modification and escape the document. Now to enable the new varible you need to run the following line in the terminal:
```
source ~/.bashrc
```
To make sure you did everything right, you can try to run the following in the terminal, it should work without error:
```
julia $MICRO_PRIAD_HOME/src/run.jl $MICRO_PRIAD_HOME/Tests/instance=1/ex_ARGS.txt $MICRO_PRIAD_HOME/Tests/instance=1/length_input=28/x0_feasible/1.txt
```
The expected output of the line above, at least on Linux, is:
```
1.0 7.184947978900144e7 -13.931372811062861 -50.33689164210764 -48.61949009325899 -1.9950187673091335 -68.43028809560832 -0.8498347080821986 -12.469886182537323 -6.000486548195852 -2.4223759922109593
```
## Execution
### Different way to run Micro-PRIAD
To run a simulation, there are three options.

#### Option 1:

Type the following command in the terminal
```
julia $MICRO_PRIAD_HOME/src/run.jl pathToARGS/ARGS.txt pathToX/x.txt
```
where the `ARGS.txt` contains the necessary information to call the blackbox and `x.txt` contains the point to evaluate (see below for formating of those files).

#### Option 2:

Type in the terminal a command thaat respect the following format
```
julia $MICRO_PRIAD_HOME/src/run.jl -@param1 value1 -@param2 value2 ... -@paramN valueN path2X/x.txt 
```
the (@paramJ valueJ) couple is formated as a line in the `ARGS.txt` file and `x.txt` contains the point to evaluate (see below for formating of those files).

An simple exemple with only two parameter is given here
```
julia $MICRO_PRIAD_HOME/src/run.jl -instance 1 -fidelity 0.001 $MICRO_PRIAD_HOME/Tests/instance=3/length_input=28/x0_feasible/1.txt 
```

#### Option 3:

Type the following command in the terminal
```
julia $MICRO_PRIAD_HOME/src/run.jl pathToX/x.txt
```
where the necessary information to call the blackbox is in a green commented box in the `run.jl` file (you can modify the .jl file to modify the arguments that would have been in `ARGS.txt` in option 1) and the `x.txt` contains the point to evaluate.

#### Option 4:

Simply call the MicroPRIAD Julia function direcly in a Julia sript if your solver is defined in Julia (don't forget to include "MicroPRIAD.jl" in your script).


### Files formating

#### ARGS.txt
The `ARGS.txt` file contains the same informations that you would need to define in Julia if you chose the execution option 2, 3 or 4. It contains arguments described in [ARGS_README](./Documentation/BB_Parameter/ARGS_README.md) and formated like in the `ex_ARGS.txt` files located in each folder in `$MICRO_PRIAD_HOME/Tests`.

All the argument have a default value, so you can choose to initialize only the arguments that you want. The other argument(s) will take their default value.
#### x.txt
The `x.txt` file contains the input vector that can takes diferent sizes:
```
input: It is the blackbox input of 28, 15 or 13 dimentions, including integer (I) and reel (R) inputs, the diferent input are defined like so:
	- 28 dimention input: [I, R, I, R, R, I, R, I, R, I, R, I, R, I, R, I, R, I, R, I, R, I, R, I, R, I, R, R]
	- 15 dimention input: [R, R, R, R, R, R, R, R, R, R, R, R, R, R, R]
	- 13 dimention input: [I, R, I, R, I, R, I, R, I, R, I, R, R]
```
The `x.txt` file must contain only the numerical value of each variable seperated with spaces without "[", "," or "]", the `x0_feasible` and `x0_infeasible` folder contains good example of how to formate your `x.txt` file, you will find those files if you go as deep as you can in the `$MICRO_PRIAD_HOME/Tests` directory ([input length of 28 exemple](./Tests/instance=1/length_input=28/x0_feasible/1.txt)).

For all integer input the bounds are 1 and 9 and for all reel input the bounds are 0.1 and 10.0.

## Micro-PRIAD's Behavior
### Running time 
The Running time for each input length of each instance at different fidelity is logged in the [BEHAV_README](./Documentation/Behaviour/BEHAV_README.md). 
### Best objective function value found
A list of the best known objectiv function value is also logged in the [BEHAV_README](./Documentation/Behaviour/BEHAV_README.md). 
### General Behavior
A general behavior description is done in the [BEHAV_README](./Documentation/Behaviour/BEHAV_README.md). 
## Other tools

In the `$MICRO_PRIAD_HOME/Benchmarking_Tools` directory you will find different julia file that you can execute to run on each instance for each input length  `NOMAD`, an `LHS` (Latin Hypercube Sampling) or a `RS` (Random Search). the command necessary to run those methods are described in the [TOOLS_README](./Documentation/Other_Tools/TOOLS_README.md).

----------------------------

The tree structure of the repo is shown in the [TREE_STRUCT_README](./Documentation/TREE_STRUCT_README.md)
