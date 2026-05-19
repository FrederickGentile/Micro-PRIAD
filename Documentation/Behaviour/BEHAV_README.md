## Running time 

The Running time for each input length of each instance at different fidelity is logged in the table below. The table is also illustrated in a plot in the [time_illustration](/Micro-PRIAD/Documentation/Behaviour/Time_Illustration.pdf) file in this directory.

i : instance, l : input dimention's

| Fidelity | 0.0001 | 0.001 | 0.01 | 0.1 | 1.0 |
|---|---|---|---|---|---|
| i = 1, l = 28 | 0.0085305 | 0.078051 | 0.75515 | 7.9178 | 78.436 |
| i = 1, l = 15 | 0.0054912 | 0.039521 | 0.37820 | 3.7865 | 37.567 |
| i = 1, l = 13 | 0.0062914 | 0.051188 | 0.49332 | 4.8986 | 48.269 |
| i = 2, l = 28 | 0.0057189 | 0.051059 | 0.52929 | 5.3566 | 53.642 |
| i = 2, l = 15 | 0.010886  | 0.029335 | 0.31448 | 3.1499 | 33.208 |
| i = 2, l = 13 | 0.0058945 | 0.047630 | 0.46206 | 4.6050 | 45.728 |
| i = 3, l = 28 | 0.029528  | 0.078951 | 0.55276 | 5.2734 | 52.117 |
| i = 3, l = 15 | 0.027286  | 0.055294 | 0.34625 | 3.1183 | 30.361 |
| i = 3, l = 13 | 0.024307  | 0.044028 | 0.25869 | 2.2888 | 22.335 |

The fidelity in this table represent the number of MC trials done for the evaluation of a point. fidelity = 0.0001 representing only one MC trials and fidelity = 1.0 representing 10000 MC trials.

## Best objective function value found

Here is the list of best know values of the objective function for the three instances with a default seed of zero:
```
	instance 1 with 13 dimentions input		4.180517980583656e7
	instance 1 with 15 dimentions input		7.797991073588863e7
	instance 1 with 28 dimentions input		6.848504620756665e7

	instance 2 with 13 dimentions input		5.461390597121722e7
	instance 2 with 15 dimentions input		9.151043287090775e7
	instance 2 with 28 dimentions input		8.888706619131872e7

	instance 3 with 13 dimentions input	    1.849174377718951e8
	instance 3 with 15 dimentions input		3.026649388391754e8
	instance 3 with 28 dimentions input		3.024380841101112e8
```
The point associated to the best value found is in the `best_known_x.txt` file, you will find this file in the `$MICRO_PRIAD_HOME/Tests` directory. or a list of the best point for every instance is presented in the file [every_best_x](/Micro-PRIAD/Documentation/Behaviour/every_best_x.md) in this directory.

## General Behavior

A general behavior is illstrated trough plots where all but one input dimension are fixed. Those plots are illustrated in the Behaviour_figures folder in this directory. the link below leads you to the associated problem:
i : instance, l : input dimention's
| Instance | Input Length | Link |
|---|---|---|
| i = 1 | l = 28 | [Behaviour_i1l28](/Micro-PRIAD/Documentation/Behaviour/Behaviour_figures/Comportement_i1l13.pdf) |
| i = 1 | l = 15 | [Behaviour_i1l15](/Micro-PRIAD/Documentation/Behaviour/Behaviour_figures/Comportement_i1l15.pdf) |
| i = 1 | l = 13 | [Behaviour_i1l13](/Micro-PRIAD/Documentation/Behaviour/Behaviour_figures/Comportement_i1l28.pdf) |
| i = 2 | l = 28 | [Behaviour_i2l28](/Micro-PRIAD/Documentation/Behaviour/Behaviour_figures/Comportement_i2l13.pdf) |
| i = 2 | l = 15 | [Behaviour_i2l15](/Micro-PRIAD/Documentation/Behaviour/Behaviour_figures/Comportement_i2l15.pdf) |
| i = 2 | l = 13 | [Behaviour_i2l13](/Micro-PRIAD/Documentation/Behaviour/Behaviour_figures/Comportement_i2l28.pdf) |
| i = 3 | l = 28 | [Behaviour_i3l28](/Micro-PRIAD/Documentation/Behaviour/Behaviour_figures/Comportement_i3l13.pdf) |
| i = 3 | l = 15 | [Behaviour_i3l15](/Micro-PRIAD/Documentation/Behaviour/Behaviour_figures/Comportement_i3l15.pdf) |
| i = 3 | l = 13 | [Behaviour_i3l13](/Micro-PRIAD/Documentation/Behaviour/Behaviour_figures/Comportement_i3l28.pdf) |
--------------------------------------------

Back to Main [README](/Micro-PRIAD/README.md).