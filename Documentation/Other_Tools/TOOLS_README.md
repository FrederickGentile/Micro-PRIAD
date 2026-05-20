## Benchmarking Tools

In the `$MICRO_PRIAD_HOME/Benchmarking_Tools` directory, you will find different Julia files that you can execute to run `NOMAD`, an `LHS` (Latin Hypercube Sampling), or a `RS` (Random Search) on each instance for each input length.

---

## For NOMAD

To use the following command, you must have NOMAD installed on your computer and have the environment variable `$NOMAD_HOME` properly set to the directory containing NOMAD's `bin`, `src`, and other core folders. You can initialize it the exact same way you initialized the environment variable `$MICRO_PRIAD_HOME` (the procedure is described in the main README).

To launch NOMAD on each instance for each input length, starting from both a feasible and an infeasible point, run the following command in your terminal:

```bash
julia $MICRO_PRIAD_HOME/Benchmarking_Tools/Run_NOMAD.jl $NOMAD_HOME
```

> **Note:** You can also manually provide the absolute path to your NOMAD directory instead of passing the `$NOMAD_HOME` environment variable.

The results of a previous execution of `Run_NOMAD.jl` are stored in the `NOMAD_results` folder within this directory.

---

## For Latin Hypercube Sampling (LHS)

To use the following command, you need to install the Julia package `Surrogates` (see the section **Installing the Julia Package "Surrogates"** below).

To launch LHS on each instance for each input length, starting from both a feasible and an infeasible point, run the following command in your terminal:

```bash
julia $MICRO_PRIAD_HOME/Benchmarking_Tools/Run_LHS.jl
```

Another script named `read_LHS.jl` is provided to compute statistics about the LHS results. It can be executed similarly to any other `.jl` file.

The results of a previous execution of `Run_LHS.jl` are stored in the `LHS_results` folder within this directory.

> **Note:** These previous results were obtained using Mini-PRIAD and not Micro-PRIAD. The `ARGS.txt` and `NOMAD_param.txt` files are currently not up to date. No guarantee of result validity is provided.

### Installing the Julia Package "Surrogates"
To install the package, execute the following commands in your terminal:

1. Open the Julia REPL:
   ```bash
   julia
   ```
2. Run the package manager commands:
   ```julia
   import Pkg
   Pkg.add("Surrogates")
   ```

---

## For Random Search (RS)

To launch a Random Search on each instance for each input length, starting from both a feasible and an infeasible point, run the following command in your terminal:

```bash
julia $MICRO_PRIAD_HOME/Benchmarking_Tools/Run_RS.jl
```

--------------------------------------------

[Back to Main README](../../README.md)
