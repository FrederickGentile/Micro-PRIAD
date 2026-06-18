## Running Time

The running time for each input length of each PGinstance at different fidelity levels is logged in the table below. This data is also illustrated as a plot in the [time_illustration](./Time_Illustration.pdf) file within this directory.

**Legend:** `i`: PGinstance, `l`: input dimensions

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

The fidelity in this table represents the number of Monte Carlo (MC) trials performed to evaluate a point. A fidelity of 0.0001 represents a single MC trial, while a fidelity of 1.0 represents 10,000 MC trials.

## Best Objective Function Value Found

Here is the list of the best-known values of the objective function for the three power grid instances, obtained using a default seed of zero:

```text
    PGinstance 1 with 13-dimension input:     4.180517980583656e7
    PGinstance 1 with 15-dimension input:     7.797991073588863e7
    PGinstance 1 with 28-dimension input:     6.848504620756665e7

    PGinstance 2 with 13-dimension input:     5.461390597121722e7
    PGinstance 2 with 15-dimension input:     9.151043287090775e7
    PGinstance 2 with 28-dimension input:     8.888706619131872e7

    PGinstance 3 with 13-dimension input:     1.849174377718951e8
    PGinstance 3 with 15-dimension input:     3.026649388391754e8
    PGinstance 3 with 28-dimension input:     3.024380841101112e8
```

The vector coordinate associated with the best value found is located in the `best_known_x.txt` file inside the `$MICRO_PRIAD_HOME/Tests` directory. Alternatively, a complete list of the best points for every PGinstance is available in the [every_best_x](./every_best_x.md) file within this directory.

## General Behavior

The general behavior of the function is illustrated through plots where all but one input dimension are held fixed. These plots can be found in the `Behaviour_figures` folder in this directory. The table below provides direct links to the corresponding plots:

**Legend:** `i`: PGinstance, `l`: input dimensions

| PGinstance | Input Length | Link |
|---|---|---|
| i = 1 | l = 28 | [Behaviour_i1l28](./Behaviour_figures/Comportement_i1l28.pdf) |
| i = 1 | l = 15 | [Behaviour_i1l15](./Behaviour_figures/Comportement_i1l15.pdf) |
| i = 1 | l = 13 | [Behaviour_i1l13](./Behaviour_figures/Comportement_i1l13.pdf) |
| i = 2 | l = 28 | [Behaviour_i2l28](./Behaviour_figures/Comportement_i2l28.pdf) |
| i = 2 | l = 15 | [Behaviour_i2l15](./Behaviour_figures/Comportement_i2l15.pdf) |
| i = 2 | l = 13 | [Behaviour_i2l13](./Behaviour_figures/Comportement_i2l13.pdf) |
| i = 3 | l = 28 | [Behaviour_i3l28](./Behaviour_figures/Comportement_i3l28.pdf) |
| i = 3 | l = 15 | [Behaviour_i3l15](./Behaviour_figures/Comportement_i3l15.pdf) |
| i = 3 | l = 13 | [Behaviour_i3l13](./Behaviour_figures/Comportement_i3l13.pdf) |

--------------------------------------------

[Back to Main README](../../README.md)
