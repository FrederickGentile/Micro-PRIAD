```bash
├── Benchmarking_Tools
│   ├── read_LHS.jl
│   ├── Run_LHS.jl
│   ├── Run_NOMAD.jl
│   └── Run_RS.jl
├── Documentation
│   ├── BB_Parameter
│   │   ├── ARGS_README.md
│   │   └── ex_ARGS.txt
│   ├── Behaviour
│   │   ├── Behaviour_figures
│   │   │   ├── Comportement_i1l13.pdf
│   │   │   ├── Comportement_i1l15.pdf
│   │   │   ├── Comportement_i1l28.pdf
│   │   │   ├── Comportement_i2l13.pdf
│   │   │   ├── Comportement_i2l15.pdf
│   │   │   ├── Comportement_i2l28.pdf
│   │   │   ├── Comportement_i3l13.pdf
│   │   │   ├── Comportement_i3l15.pdf
│   │   │   └── Comportement_i3l28.pdf
│   │   ├── BEHAV_README.md
│   │   ├── every_best_x.md
│   │   └── Time_Illustration.pdf
│   ├── Other_Tools
│   │   ├── LHS_results
│   │   │   ├── input_length=13
│   │   │   │   ├── instance=1
│   │   │   │   │   ├── 10000phi=0
│   │   │   │   │   │   ├── ARGS.txt
│   │   │   │   │   │   └── lhs_output.txt
│   │   │   │   │   ├── 10000phi=1
│   │   │   │   │   │   ├── ARGS.txt
│   │   │   │   │   │   ├── lhs_output.txt
│   │   │   │   │   │   └── loggingTime.txt
│   │   │   │   │   ├── 10000phi=10
│   │   │   │   │   │   ├── ARGS.txt
│   │   │   │   │   │   ├── lhs_output.txt
│   │   │   │   │   │   └── loggingTime.txt
│   │   │   │   │   ├── 10000phi=100
│   │   │   │   │   │   ├── ARGS.txt
│   │   │   │   │   │   ├── lhs_output.txt
│   │   │   │   │   │   └── loggingTime.txt
│   │   │   │   │   ├── 10000phi=1000
│   │   │   │   │   │   ├── ARGS.txt
│   │   │   │   │   │   ├── lhs_output.txt
│   │   │   │   │   │   └── loggingTime.txt
│   │   │   │   │   └── 10000phi=10000
│   │   │   │   │       ├── ARGS.txt
│   │   │   │   │       ├── lhs_output.txt
│   │   │   │   │       └── loggingTime.txt
│   │   │   │   ├── instance=2
│   │   │   │   │   ├── 10000phi=0
│   │   │   │   │   │   ├── ARGS.txt
│   │   │   │   │   │   └── lhs_output.txt
│   │   │   │   │   ├── 10000phi=1
│   │   │   │   │   │   ├── ARGS.txt
│   │   │   │   │   │   ├── lhs_output.txt
│   │   │   │   │   │   └── loggingTime.txt
│   │   │   │   │   ├── 10000phi=10
│   │   │   │   │   │   ├── ARGS.txt
│   │   │   │   │   │   ├── lhs_output.txt
│   │   │   │   │   │   └── loggingTime.txt
│   │   │   │   │   ├── 10000phi=100
│   │   │   │   │   │   ├── ARGS.txt
│   │   │   │   │   │   ├── lhs_output.txt
│   │   │   │   │   │   └── loggingTime.txt
│   │   │   │   │   ├── 10000phi=1000
│   │   │   │   │   │   ├── ARGS.txt
│   │   │   │   │   │   ├── lhs_output.txt
│   │   │   │   │   │   └── loggingTime.txt
│   │   │   │   │   └── 10000phi=10000
│   │   │   │   │       ├── ARGS.txt
│   │   │   │   │       ├── lhs_output.txt
│   │   │   │   │       └── loggingTime.txt
│   │   │   │   ├── instance=3
│   │   │   │   │   ├── 10000phi=0
│   │   │   │   │   │   ├── ARGS.txt
│   │   │   │   │   │   └── lhs_output.txt
│   │   │   │   │   ├── 10000phi=1
│   │   │   │   │   │   ├── ARGS.txt
│   │   │   │   │   │   ├── lhs_output.txt
│   │   │   │   │   │   └── loggingTime.txt
│   │   │   │   │   ├── 10000phi=10
│   │   │   │   │   │   ├── ARGS.txt
│   │   │   │   │   │   ├── lhs_output.txt
│   │   │   │   │   │   └── loggingTime.txt
│   │   │   │   │   ├── 10000phi=100
│   │   │   │   │   │   ├── ARGS.txt
│   │   │   │   │   │   ├── lhs_output.txt
│   │   │   │   │   │   └── loggingTime.txt
│   │   │   │   │   ├── 10000phi=1000
│   │   │   │   │   │   ├── ARGS.txt
│   │   │   │   │   │   ├── lhs_output.txt
│   │   │   │   │   │   └── loggingTime.txt
│   │   │   │   │   └── 10000phi=10000
│   │   │   │   │       ├── ARGS.txt
│   │   │   │   │       ├── lhs_output.txt
│   │   │   │   │       └── loggingTime.txt
│   │   │   │   └── lhs_x.txt
│   │   │   ├── input_length=15
│   │   │   │   ├── instance=1
│   │   │   │   │   ├── 10000phi=0
│   │   │   │   │   │   ├── ARGS.txt
│   │   │   │   │   │   └── lhs_output.txt
│   │   │   │   │   ├── 10000phi=1
│   │   │   │   │   │   ├── ARGS.txt
│   │   │   │   │   │   ├── lhs_output.txt
│   │   │   │   │   │   └── loggingTime.txt
│   │   │   │   │   ├── 10000phi=10
│   │   │   │   │   │   ├── ARGS.txt
│   │   │   │   │   │   ├── lhs_output.txt
│   │   │   │   │   │   └── loggingTime.txt
│   │   │   │   │   ├── 10000phi=100
│   │   │   │   │   │   ├── ARGS.txt
│   │   │   │   │   │   ├── lhs_output.txt
│   │   │   │   │   │   └── loggingTime.txt
│   │   │   │   │   ├── 10000phi=1000
│   │   │   │   │   │   ├── ARGS.txt
│   │   │   │   │   │   ├── lhs_output.txt
│   │   │   │   │   │   └── loggingTime.txt
│   │   │   │   │   └── 10000phi=10000
│   │   │   │   │       ├── ARGS.txt
│   │   │   │   │       ├── lhs_output.txt
│   │   │   │   │       └── loggingTime.txt
│   │   │   │   ├── instance=2
│   │   │   │   │   ├── 10000phi=0
│   │   │   │   │   │   ├── ARGS.txt
│   │   │   │   │   │   └── lhs_output.txt
│   │   │   │   │   ├── 10000phi=1
│   │   │   │   │   │   ├── ARGS.txt
│   │   │   │   │   │   ├── lhs_output.txt
│   │   │   │   │   │   └── loggingTime.txt
│   │   │   │   │   ├── 10000phi=10
│   │   │   │   │   │   ├── ARGS.txt
│   │   │   │   │   │   ├── lhs_output.txt
│   │   │   │   │   │   └── loggingTime.txt
│   │   │   │   │   ├── 10000phi=100
│   │   │   │   │   │   ├── ARGS.txt
│   │   │   │   │   │   ├── lhs_output.txt
│   │   │   │   │   │   └── loggingTime.txt
│   │   │   │   │   ├── 10000phi=1000
│   │   │   │   │   │   ├── ARGS.txt
│   │   │   │   │   │   ├── lhs_output.txt
│   │   │   │   │   │   └── loggingTime.txt
│   │   │   │   │   └── 10000phi=10000
│   │   │   │   │       ├── ARGS.txt
│   │   │   │   │       ├── lhs_output.txt
│   │   │   │   │       └── loggingTime.txt
│   │   │   │   ├── instance=3
│   │   │   │   │   ├── 10000phi=0
│   │   │   │   │   │   ├── ARGS.txt
│   │   │   │   │   │   └── lhs_output.txt
│   │   │   │   │   ├── 10000phi=1
│   │   │   │   │   │   ├── ARGS.txt
│   │   │   │   │   │   ├── lhs_output.txt
│   │   │   │   │   │   └── loggingTime.txt
│   │   │   │   │   ├── 10000phi=10
│   │   │   │   │   │   ├── ARGS.txt
│   │   │   │   │   │   ├── lhs_output.txt
│   │   │   │   │   │   └── loggingTime.txt
│   │   │   │   │   ├── 10000phi=100
│   │   │   │   │   │   ├── ARGS.txt
│   │   │   │   │   │   ├── lhs_output.txt
│   │   │   │   │   │   └── loggingTime.txt
│   │   │   │   │   ├── 10000phi=1000
│   │   │   │   │   │   ├── ARGS.txt
│   │   │   │   │   │   ├── lhs_output.txt
│   │   │   │   │   │   └── loggingTime.txt
│   │   │   │   │   └── 10000phi=10000
│   │   │   │   │       ├── ARGS.txt
│   │   │   │   │       ├── lhs_output.txt
│   │   │   │   │       └── loggingTime.txt
│   │   │   │   └── lhs_x.txt
│   │   │   └── input_length=28
│   │   │       ├── instance=1
│   │   │       │   ├── 10000phi=0
│   │   │       │   │   ├── ARGS.txt
│   │   │       │   │   └── lhs_output.txt
│   │   │       │   ├── 10000phi=1
│   │   │       │   │   ├── ARGS.txt
│   │   │       │   │   ├── lhs_output.txt
│   │   │       │   │   └── loggingTime.txt
│   │   │       │   ├── 10000phi=10
│   │   │       │   │   ├── ARGS.txt
│   │   │       │   │   ├── lhs_output.txt
│   │   │       │   │   └── loggingTime.txt
│   │   │       │   ├── 10000phi=100
│   │   │       │   │   ├── ARGS.txt
│   │   │       │   │   ├── lhs_output.txt
│   │   │       │   │   └── loggingTime.txt
│   │   │       │   ├── 10000phi=1000
│   │   │       │   │   ├── ARGS.txt
│   │   │       │   │   ├── lhs_output.txt
│   │   │       │   │   └── loggingTime.txt
│   │   │       │   └── 10000phi=10000
│   │   │       │       ├── ARGS.txt
│   │   │       │       ├── lhs_output.txt
│   │   │       │       └── loggingTime.txt
│   │   │       ├── instance=2
│   │   │       │   ├── 10000phi=0
│   │   │       │   │   ├── ARGS.txt
│   │   │       │   │   └── lhs_output.txt
│   │   │       │   ├── 10000phi=1
│   │   │       │   │   ├── ARGS.txt
│   │   │       │   │   ├── lhs_output.txt
│   │   │       │   │   └── loggingTime.txt
│   │   │       │   ├── 10000phi=10
│   │   │       │   │   ├── ARGS.txt
│   │   │       │   │   ├── lhs_output.txt
│   │   │       │   │   └── loggingTime.txt
│   │   │       │   ├── 10000phi=100
│   │   │       │   │   ├── ARGS.txt
│   │   │       │   │   ├── lhs_output.txt
│   │   │       │   │   └── loggingTime.txt
│   │   │       │   ├── 10000phi=1000
│   │   │       │   │   ├── ARGS.txt
│   │   │       │   │   ├── lhs_output.txt
│   │   │       │   │   └── loggingTime.txt
│   │   │       │   └── 10000phi=10000
│   │   │       │       ├── ARGS.txt
│   │   │       │       ├── lhs_output.txt
│   │   │       │       └── loggingTime.txt
│   │   │       ├── instance=3
│   │   │       │   ├── 10000phi=0
│   │   │       │   │   ├── ARGS.txt
│   │   │       │   │   └── lhs_output.txt
│   │   │       │   ├── 10000phi=1
│   │   │       │   │   ├── ARGS.txt
│   │   │       │   │   ├── lhs_output.txt
│   │   │       │   │   └── loggingTime.txt
│   │   │       │   ├── 10000phi=10
│   │   │       │   │   ├── ARGS.txt
│   │   │       │   │   ├── lhs_output.txt
│   │   │       │   │   └── loggingTime.txt
│   │   │       │   ├── 10000phi=100
│   │   │       │   │   ├── ARGS.txt
│   │   │       │   │   ├── lhs_output.txt
│   │   │       │   │   └── loggingTime.txt
│   │   │       │   ├── 10000phi=1000
│   │   │       │   │   ├── ARGS.txt
│   │   │       │   │   ├── lhs_output.txt
│   │   │       │   │   └── loggingTime.txt
│   │   │       │   └── 10000phi=10000
│   │   │       │       ├── ARGS.txt
│   │   │       │       ├── lhs_output.txt
│   │   │       │       └── loggingTime.txt
│   │   │       └── lhs_x.txt
│   │   ├── NOMAD_results
│   │   │   ├── i=1_l=13_x0feas
│   │   │   │   ├── ARGS.txt
│   │   │   │   ├── bbe.0
│   │   │   │   ├── history.0.txt
│   │   │   │   ├── loggingTime.txt
│   │   │   │   ├── nomad_output.txt
│   │   │   │   └── nomad_param.txt
│   │   │   ├── i=1_l=13_x0infeas_
│   │   │   │   ├── ARGS.txt
│   │   │   │   ├── bbe.0
│   │   │   │   ├── history.0.txt
│   │   │   │   ├── loggingTime.txt
│   │   │   │   ├── nomad_output.txt
│   │   │   │   └── nomad_param.txt
│   │   │   ├── i=1_l=15_x0feas
│   │   │   │   ├── ARGS.txt
│   │   │   │   ├── bbe.0
│   │   │   │   ├── history.0.txt
│   │   │   │   ├── loggingTime.txt
│   │   │   │   ├── nomad_output.txt
│   │   │   │   └── nomad_param.txt
│   │   │   ├── i=1_l=15_x0infeas_
│   │   │   │   ├── ARGS.txt
│   │   │   │   ├── bbe.0
│   │   │   │   ├── history.0.txt
│   │   │   │   ├── loggingTime.txt
│   │   │   │   ├── nomad_output.txt
│   │   │   │   └── nomad_param.txt
│   │   │   ├── i=1_l=28_x0feas
│   │   │   │   ├── ARGS.txt
│   │   │   │   ├── bbe.0
│   │   │   │   ├── history.0.txt
│   │   │   │   ├── loggingTime.txt
│   │   │   │   ├── nomad_output.txt
│   │   │   │   └── nomad_param.txt
│   │   │   ├── i=1_l=28_x0infeas
│   │   │   │   ├── ARGS.txt
│   │   │   │   ├── bbe.0
│   │   │   │   ├── history.0.txt
│   │   │   │   ├── loggingTime.txt
│   │   │   │   ├── nomad_output.txt
│   │   │   │   └── nomad_param.txt
│   │   │   ├── i=2_l=13_x0feas
│   │   │   │   ├── ARGS.txt
│   │   │   │   ├── bbe.0
│   │   │   │   ├── history.0.txt
│   │   │   │   ├── loggingTime.txt
│   │   │   │   ├── nomad_output.txt
│   │   │   │   └── nomad_param.txt
│   │   │   ├── i=2_l=13_x0infeas
│   │   │   │   ├── ARGS.txt
│   │   │   │   ├── bbe.0
│   │   │   │   ├── history.0.txt
│   │   │   │   ├── loggingTime.txt
│   │   │   │   ├── nomad_output.txt
│   │   │   │   └── nomad_param.txt
│   │   │   ├── i=2_l=15_x0feas
│   │   │   │   ├── ARGS.txt
│   │   │   │   ├── bbe.0
│   │   │   │   ├── history.0.txt
│   │   │   │   ├── loggingTime.txt
│   │   │   │   ├── nomad_output.txt
│   │   │   │   └── nomad_param.txt
│   │   │   ├── i=2_l=15_x0infeas
│   │   │   │   ├── ARGS.txt
│   │   │   │   ├── bbe.0
│   │   │   │   ├── history.0.txt
│   │   │   │   ├── loggingTime.txt
│   │   │   │   ├── nomad_output.txt
│   │   │   │   └── nomad_param.txt
│   │   │   ├── i=2_l=28_x0feas
│   │   │   │   ├── ARGS.txt
│   │   │   │   ├── bbe.0
│   │   │   │   ├── history.0.txt
│   │   │   │   ├── loggingTime.txt
│   │   │   │   ├── nomad_output.txt
│   │   │   │   └── nomad_param.txt
│   │   │   ├── i=2_l=28_x0infeas
│   │   │   │   ├── ARGS.txt
│   │   │   │   ├── bbe.0
│   │   │   │   ├── history.0.txt
│   │   │   │   ├── loggingTime.txt
│   │   │   │   ├── nomad_output.txt
│   │   │   │   └── nomad_param.txt
│   │   │   ├── i=3_l=13_x0feas
│   │   │   │   ├── ARGS.txt
│   │   │   │   ├── bbe.0
│   │   │   │   ├── history.0.txt
│   │   │   │   ├── loggingTime.txt
│   │   │   │   ├── nomad_output.txt
│   │   │   │   └── nomad_param.txt
│   │   │   ├── i=3_l=13_x0infeas
│   │   │   │   ├── ARGS.txt
│   │   │   │   ├── bbe.0
│   │   │   │   ├── history.0.txt
│   │   │   │   ├── loggingTime.txt
│   │   │   │   ├── nomad_output.txt
│   │   │   │   └── nomad_param.txt
│   │   │   ├── i=3_l=15_x0feas
│   │   │   │   ├── ARGS.txt
│   │   │   │   ├── bbe.0
│   │   │   │   ├── history.0.txt
│   │   │   │   ├── loggingTime.txt
│   │   │   │   ├── nomad_output.txt
│   │   │   │   └── nomad_param.txt
│   │   │   ├── i=3_l=15_x0infeas
│   │   │   │   ├── ARGS.txt
│   │   │   │   ├── bbe.0
│   │   │   │   ├── history.0.txt
│   │   │   │   ├── loggingTime.txt
│   │   │   │   ├── nomad_output.txt
│   │   │   │   └── nomad_param.txt
│   │   │   ├── i=3_l=28_x0feas
│   │   │   │   ├── ARGS.txt
│   │   │   │   ├── bbe.0
│   │   │   │   ├── history.0.txt
│   │   │   │   ├── loggingTime.txt
│   │   │   │   ├── nomad_output.txt
│   │   │   │   └── nomad_param.txt
│   │   │   └── i=3_l=28_x0infeas
│   │   │       ├── ARGS.txt
│   │   │       ├── bbe.0
│   │   │       ├── history.0.txt
│   │   │       ├── loggingTime.txt
│   │   │       ├── nomad_output.txt
│   │   │       └── nomad_param.txt
│   │   └── TOOLS_README.md
│   └── TREE_STRUCT_README.md
├── License.txt
├── README.md
├── src
│   ├── ContinueEvalFunctions.jl
│   ├── ElectricitySimulator.jl
│   ├── Initialisation.jl
│   ├── MicroPRIAD.jl
│   ├── Param.jl
│   ├── RiskModule.jl
│   ├── run.jl
│   ├── Struct.jl
│   └── UnavailabilitySimulator.jl
└── Tests
    ├── instance=1
    │   ├── ex_ARGS.txt
    │   ├── length_input=13
    │   │   ├── best_known_x.txt
    │   │   ├── ex_nomad_param.txt
    │   │   ├── x0_feasible
    │   │   │   ├── 1.txt
    │   │   │   └── 2.txt
    │   │   └── x0_infeasible
    │   │       ├── 1.txt
    │   │       └── 2.txt
    │   ├── length_input=15
    │   │   ├── best_known_x.txt
    │   │   ├── ex_nomad_param.txt
    │   │   ├── x0_feasible
    │   │   │   ├── 1.txt
    │   │   │   └── 2.txt
    │   │   └── x0_infeasible
    │   │       └── 1.txt
    │   └── length_input=28
    │       ├── best_known_x.txt
    │       ├── ex_nomad_param.txt
    │       ├── x0_feasible
    │       │   └── 1.txt
    │       └── x0_infeasible
    │           ├── 1.txt
    │           ├── 2.txt
    │           └── 3.txt
    ├── instance=2
    │   ├── ex_ARGS.txt
    │   ├── length_input=13
    │   │   ├── best_known_x.txt
    │   │   ├── ex_nomad_param.txt
    │   │   ├── x0_feasible
    │   │   │   ├── 1.txt
    │   │   │   └── 2.txt
    │   │   └── x0_infeasible
    │   │       ├── 1.txt
    │   │       └── 2.txt
    │   ├── length_input=15
    │   │   ├── best_known_x.txt
    │   │   ├── ex_nomad_param.txt
    │   │   ├── x0_feasible
    │   │   │   └── 1.txt
    │   │   └── x0_infeasible
    │   │       └── 1.txt
    │   └── length_input=28
    │       ├── best_known_x.txt
    │       ├── ex_nomad_param.txt
    │       ├── x0_feasible
    │       │   └── 1.txt
    │       └── x0_infeasible
    │           ├── 1.txt
    │           ├── 2.txt
    │           └── 3.txt
    └── instance=3
        ├── ex_ARGS.txt
        ├── length_input=13
        │   ├── best_known_x.txt
        │   ├── ex_nomad_param.txt
        │   ├── x0_feasible
        │   │   └── 1.txt
        │   └── x0_infeasible
        │       ├── 1.txt
        │       ├── 2.txt
        │       ├── 3.txt
        │       ├── 4.txt
        │       ├── 5.txt
        │       └── 6.txt
        ├── length_input=15
        │   ├── best_known_x.txt
        │   ├── ex_nomad_param.txt
        │   ├── x0_feasible
        │   │   ├── 1.txt
        │   │   └── 2.txt
        │   └── x0_infeasible
        │       └── 1.txt
        └── length_input=28
            ├── best_known_x.txt
            ├── ex_nomad_param.txt
            ├── x0_feasible
            │   └── 1.txt
            └── x0_infeasible
                ├── 1.txt
                └── 2.txt

```

--------------------------------------------

Back to Main [README](/Micro-PRIAD/README.md).
