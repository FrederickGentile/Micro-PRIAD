The different argument that Micro-PRIAD can take as an input can be given trough the 'ARG.txt' file. The parameters are listed and descibed below. A simple exemple of a ARGS.txt file is given in this [directory](/Micro-PRIAD/Documentation/BB_Parameter/ex_ARGS.txt) and a full described version is available in the tests [directory](/Micro-PRIAD/Tests/instance=1/ex_ARGS.txt)


- fidelity: It is a reel number bounded by 0 and 1, that represent the final output fidelity to the reality. For each increment of 0.0001 in the fidelity, the Blackbox does 1 more MC trial to a maximum of 10000 trials when the fidelity is at 1.0. 
    -> default value of 1.0

- seed: It is a integer number that represent the random seed used for Monte-Carlos trials. By changing the seed, Micro-PRIAD return differnent results, because the random trials are different.
    -> default value of 0

- instance: It is an integer that can take the values [1, 2, 3] to represent an instance number. This argument control the type of electrical network used in the balckbox but does not chhange the number of constaint and does not affet the input length.
    -­> default value of 1

- loggingTime: It is an argument that if specified to "false" does not do anything but if specified to a path, will create a timeLog file where each line of the .txt file represent the execution time of an iteration.
    -> Default value of "false"

- continueEval: It is a function that you can redefine in Julia that would replace the basic function implemented in Micro-PRIAD that always return true, this function is a function that takes intermediate value of the objective function and the constraint with the associated fidelity, this function then chose to interupte the blackbox iteration or let it continue. It is called often in the blackbox at different fidelity. In the ARGS.txt file the path to the .jl file contaning the Julia function and the name of the Julia function need to be specified. Four Default function are implemented in the code:
    + basicContinueEval: always return true (never interupt the Blackbox) -­> Default value
    + printInterReturnConinueEval: print in a .txt file every intermediate information and wait for a decision in another .txt file to chose wether to continue or stop the evaluation.
    + DeterministicInfoContinueEval: return false when one of the 5 deterministic constraint is violated, and return true otherwise.
    + feasiblePtsFinderContinueEval: ...

- AnyParamForContinueEvalFunction: A string parmeter given to the continueEval function in julia. Default continueEval needs specific param here.
    -> Default value of ""

- N_MC_trials: It fixes the maximum number of Monte Carlos trials, fixes the number of trials representing the truth.
    -> Default value of 10000

- N_MC_trials_per_interReturn: It controls the frequency of intermediate return
    -> Default value of 1000

- halfTrialsReturn: It allows aditional intermediate return at key moment in Micro-PRIAD when not every constraint is evaluated to the same fidelity. respectiv fidelity of the constraints evaluation is given in a fidelity vector.

- single_MC_info_return: ...


> Brefly described version of what Micro-PRIAD needs is presented in the tests [directory](/Micro-PRIAD/Tests/instance=1/ex_ARGS.txt)
--------------------------------------------

Back to Main [README](/Micro-PRIAD/README.md).