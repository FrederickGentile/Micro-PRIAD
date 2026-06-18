## Black-Box Parameters (ARGS.txt)

The different arguments that Micro-PRIAD can take as input can be provided through the `ARGS.txt` file. The parameters are listed and described below. A simple example of an `ARGS.txt` file is available in this [directory](/Micro-PRIAD/Documentation/BB_Parameter/ex_ARGS.txt), and a fully documented version is available in the tests [directory](/Micro-PRIAD/Tests/instance=1/ex_ARGS.txt).

---

### Parameters List

* **`fidelity`**: A real number bounded between `0.0` and `1.0` that represents the accuracy of the final output relative to reality. For each increment of `0.0001` in fidelity, the black-box performs one additional Monte Carlo (MC) trial, up to a maximum of 10,000 trials when fidelity is set to `1.0`.
  * *Default value:* `1.0`

* **`seed`**: An integer representing the random seed used for the Monte Carlo trials. Changing the seed will cause Micro-PRIAD to return different results due to varying random trial sequences.
  * *Default value:* `0`

* **`PGinstance`**: An integer that can take the values `[1, 2, 3]` to select a specific problem PGinstance. This argument controls the type of electrical network configuration used inside the black-box, but it does not change the number of constraints or affect the input vector length.
  * *Default value:* `1`

* **`loggingTime`**: A parameter used for benchmarking. If set to `"false"`, time logging is deactivated. If set to a specific file path, it will create a time-log file where each line records the exact execution time of a single iteration.
  * *Default value:* `"false"`

* **`continueEval`**: A parameter (function) that indicate if and how intermediary ouput are handled. This function intercepts intermediate objective function values and constraint metrics at specific fidelity levels to decide whether to early-terminate the black-box iteration or let it run to completion. It is triggered frequently at various fidelity milestones. In the `ARGS.txt` file, you must specify both the path to the `.jl` file and the specific name of the Julia function. 

  Four built-in functions are already implemented:
  * `basicContinueEval`: Always returns `true` (never interrupts the black-box execution). *--> Default value*
  * `printInterReturnContinueEval`: Logs every intermediate evaluation step into a `.txt` file and pauses, waiting for a user decision via an external file to either abort or resume the evaluation.
  * `DeterministicInfoContinueEval`: Aborts the execution (returns `false`) as soon as one of the 5 deterministic constraints is violated, saving computational overhead.
  * `feasiblePtsFinderContinueEval`: Uses central limit theorem to find a feasible solution faster than at full fidelity. 

* **`AnyParamForContinueEvalFunction`**: A string parameter passed directly to the custom `continueEval` Julia function. Some custom functions require specific initialization strings or flags here.
  * *Default value:* `""`

* **`N`**: Explicitly fixes the maximum number of Monte Carlo trials, which represents the ground-truth benchmark accuracy.
  * *Default value:* `10000`

* **`eta`**: Controls the sampling frequency of intermediate status returns.
  * *Default value:* `1000`

* **`halfTrialsReturn`**: A boolean flag allowing additional intermediate returns at critical points when not all constraints are being evaluated at the exact same fidelity level. The respective fidelity levels of the constraint evaluations are tracked via an internal fidelity vector.

* **`single_MC_info_return`**: A parameter (function) that indicates if the user wants the program to print every single Monte-Carlo trial in a .txt file. In the `ARGS.txt` file, you must specify both the path to the `.jl` file and the specific name of the Julia function. 

Tree built-in functions are already implemented:
* `basic_single_MC_info_return`: Does not return anything. *--> Default value*
* `print_single_MC_info_return`: Return the result of f C6 C7 C8 and C9 (stochastic objective function and constraints) in a .txt file. To use this function, `eta` must be set to 1.
* `print_single_MC_info_return_for_subSampling`: Return the result of f C8 and C9 (objective function and constraints calculated in the second stage of the blackbox)

* **`AnyParamForSingle_MC_Info_ReturnFunction`**: A string parameter passed direcly to the custom `single_MC_info_return` julia function. Built-in functions use this parameter to specify a path for the logging .txt file.
* *Default value:* `""`

* **`subSampling`**: A parameter (function) that indicate if and how the sub-sampling of stage one's output of the blackbox is done before giving it to the stage two of the blackbox. In the `ARGS.txt` file, you must specify both the path to the `.jl` file and the specific name of the Julia function. 
One built-in function is implemented in this version:
* `basicSubSampling`: Does not sub sample, it returns all sample. *--> Default value*


> **Note:** the parameter flaged with (function) are functions that can be created by the user and given to Micro-PRIAD. For specific use of the bult-in function and their param refer to the article.
---

> A briefly described summary of the Micro-PRIAD needs is presented in the tests [directory](../../Tests/instance=1/ex_ARGS.txt).

--------------------------------------------

[Back to Main README](../../README.md)