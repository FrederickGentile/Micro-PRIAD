using Surrogates
BENCHMARK_HOME = @__DIR__
dir = @__DIR__
splitDir = split(dir, "/") 
newSplitDir = Vector{SubString}(undef, length(splitDir) - 1)
for i in 1:(length(splitDir) - 1)
    newSplitDir[i] = splitDir[i]
end
newDir = join(newSplitDir, "/")
include("$newDir/src/MicroPRIAD.jl")

function COkay(FFC)
    for i in 3:11
        if FFC[i] > 0
            return false
        end
    end
    return true
end

function hCalculator(FFC)
    h = 0.0
    for i in 3:11
        if FFC[i] > 0
            h += FFC[i]
        end
    end
    return h
end

function precedes(FFC1, FFC2)
    if COkay(FFC1) && COkay(FFC2)
        return FFC1[2] < FFC2[2]
    elseif COkay(FFC1) || COkay(FFC2)
        return COkay(FFC1)
    else
        return hCalculator(FFC1) < hCalculator(FFC2)
    end
end

x_str = ""

best_FFC = [Inf64 for i in 1:11]

function createLHS_x(nb_points::Int=10000)
    for input_length in [13, 15, 28]
        if input_length == 13
            lb = [1.0, 0.1, 1.0, 0.1, 1.0, 0.1, 1.0, 0.1, 1.0, 0.1, 1.0, 0.1, 0.1]
            ub = [10.0 for i in 1:13]
        elseif input_length == 15
            lb = [0.1 for i in 1:15]
            ub = [10.0 for i in 1:15]
        elseif input_length == 28
            lb = [1.0, 0.1, 1.0, 0.1, 0.1, 1.0, 0.1, 1.0, 0.1, 1.0, 0.1, 1.0, 0.1, 1.0, 0.1, 1.0, 0.1, 1.0, 0.1, 1.0, 0.1, 1.0, 0.1, 1.0, 0.1, 1.0, 0.1, 0.1]
            ub = [10.0 for i in 1:28]
        end

        LHS_Samples = sample(nb_points, lb, ub, LatinHypercubeSample())
        ACTUAL_FILE_PATH = "$BENCHMARK_HOME/LHS_results/input_length=$input_length"
        mkpath(ACTUAL_FILE_PATH)

        io_x = open("$ACTUAL_FILE_PATH/lhs_x.txt", "w")
        for i in 1:nb_points
            if input_length == 13
                x = collect(LHS_Samples[i])
                global x_str = ""
                for j in 1:13
                    if j ∈ [1,3,5,7,9,11]
                        x[j] = floor(x[j])
                    end
                    global x_str *= string(x[j]) * " "
                end
            elseif input_length == 28
                x = collect(LHS_Samples[i])
                global x_str = ""
                for j in 1:28
                    if j ∈ [1,3,6,8,10,12,14,16,18,20,22,24,26]
                        x[j] = floor(x[j])
                    end
                    global x_str *= string(x[j]) * " "
                end
            else input_length == 15
                global x_str = ""
                x = collect(LHS_Samples[i])
                for j in 1:15   
                    global x_str *= string(x[j]) * " "
                end
            end
            write(io_x, "$x_str\n")
        end

        close(io_x)
    end
end

function createLHS_Output(nb_points::Int=10000)
    for input_length in [13, 15, 28]
        ACTUAL_FILE_PATH = "$BENCHMARK_HOME/LHS_results/input_length=$input_length"
        mkpath(ACTUAL_FILE_PATH)
        io_x = open("$ACTUAL_FILE_PATH/lhs_x.txt", "r")
        x_lines = readlines(io_x)
        close(io_x)

        for instance in [2, 3]

            for ϕ in [0, 10^(-4), 10^(-3), 10^(-2), 10^(-1), 1]
                global best_FFC = [Inf64 for i in 1:11]
if instance == 2 && input_length == 28 && ϕ < 0.999
    continue
end
                ACTUAL_FILE_PATH = "$BENCHMARK_HOME/LHS_results/input_length=$input_length/instance=$instance/10000phi=$(Int(round(10^4 * ϕ)))"
                mkpath(ACTUAL_FILE_PATH)
                seedMC = 0
                loggingTimeFile = "$ACTUAL_FILE_PATH/loggingTime.txt"
                io = open("$ACTUAL_FILE_PATH/ARGS.txt", "w")
                write(io, "fidelity	$ϕ\n")
                write(io, "seed	$seedMC\n")
                write(io, "instance	$instance\n")
                write(io, "loggingTime $loggingTimeFile\n")
                close(io)

                io_output = open("$ACTUAL_FILE_PATH/lhs_output.txt", "w")
                for i in 1:nb_points
                    split_x_line = split(x_lines[i])
                    x = [parse(Float64, String(split_x_line[j])) for j in 1:input_length]

                    FFC_str = MicroPRIAD(x, ϕ, 0, param = instance, loggingTime = loggingTimeFile)
                    FFC_split_str = split(FFC_str)
                    FFC = Vector{Float64}(undef, 11)
                    for k in 1:11
                        FFC[k] = parse(Float64, String(FFC_split_str[k]))
                    end

                    if precedes(FFC, best_FFC)
                        success_type = "{ Full success (dominating) } "
                        global best_FFC = FFC
                    else
                        success_type = "{ Failure } "
                    end
                    write(io_output, "$success_type [ $FFC_str ] \n")
                end
                close(io_output)
                GC.gc()
            end
        end
    end
end

createLHS_x()
createLHS_Output()

GC.gc()