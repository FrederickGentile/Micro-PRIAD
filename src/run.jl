# length(ARGS) = 1 => x.txt
#
# length(ARGS) = 2 => ARGS.txt x.txt 
#                  
# length(ARGS) > 2 => -@param1 value1 -@param2 value2 ... x.txt 

using Random
include("MicroPRIAD.jl")

function print_rgb(r, g, b, t)
    print("\e[1m\e[38;2;$r;$g;$b;249m",t)
end

function findallParam(vec)
    arr::Vector{Int64} = []
    for i in 1:length(vec)
        if (vec[i] ==  "-PGinstance" || vec[i] == "-fidelity" || vec[i] == "-seed" || vec[i] == "-continueEval" || vec[i] == "-AnyParamForContinueEvalFunction" || vec[i] == "-loggingTime" || vec[i] == "-eta" || vec[i] == "-halfTrialsReturn" || vec[i] == "-N" || vec[i] == "-single_MC_info_return")
            push!(arr, i)
        end   
    end
    return arr
end

#########################################################################################################################
#===================== arguments to modify if you chose to call the blackbox with only a x.txt file ====================#
#==###################################################################################################################==#
#==# ϕ = 1.0                                                                                                         #==#
#==# seed = 0                                                                                                        #==#
#==# continueEval = basicContinueEval # don't forget to include your .jl if you use your continueEval julia function #==#
#==# AnyParamForContinueEvalFunction = ""                                                                            #==#
#==# PGinstance = 1                                                                                                  #==#
#==# loggingTime = "false"                                                                                           #==#
#==# eta = 1000                                                                                                      #==#
#==# halfTrialsReturn = true                                                                                         #==#
#==# N = 10000                                                                                                       #==#
#==# single_MC_info_return = basic_single_MC_info_return # don't forget to include your .jl if you use YOUR function #==#
#==# AnyParamForSingle_MC_Info_ReturnFunction = ""                                                                   #==#
#==# subSampling = basicSubSampling  # don't forget to include your .jl if you use your continueEval julia function  #==#
#==# AnyParamForSubSamplingFunction = ""                                                                             #==#
#==###################################################################################################################==#
#=======================================================================================================================#
#########################################################################################################################

needHelp = true
if "-help" ∈ ARGS || "-h" ∈ ARGS || "-test" ∈ ARGS || "-t" ∈ ARGS || "-tests" ∈ ARGS
    global needHelp = true
elseif isfile(ARGS[end]) == false
    @error "The last argument is not a file containing the starting point x0"
elseif length(ARGS) == 1
    if isfile(ARGS[1]) == true
        io = open(ARGS[1], "r")
        lines = readlines(io)
        close(io)

        splitLine = split(lines[1])
        input = Vector{Float64}(undef, length(splitLine))

        for i in 1:length(splitLine)
            input[i] = parse(Float64, splitLine[i])
        end

        println(MicroPRIAD(input, ϕ=ϕ, seed=seed, continueEval=continueEval, PGinstance=PGinstance, loggingTime=String(loggingTime), eta=eta, halfTrialsReturn=halfTrialsReturn, N=N, AnyParamForContinueEvalFunction=AnyParamForContinueEvalFunction, single_MC_info_return=single_MC_info_return, AnyParamForSingle_MC_Info_ReturnFunction=AnyParamForSingle_MC_Info_ReturnFunction, subSampling=subSampling, AnyParamForSubSamplingFunction=AnyParamForSubSamplingFunction))
        global needHelp = false
    else
        global needHelp = true
    end
elseif length(ARGS) == 2
    dir = @__DIR__
    pathToContinueEvaljlFile = "$dir/ContinueEvalFunctions.jl"
    continueEval_name = "basicContinueEval"
    pathToSingle_MC_Info_ReturnjlFile = "$dir/Single_MC_info_return_Functions.jl"
    single_MC_info_return_name = "basic_single_MC_info_return"
    pathToSubSamplingjlFile = "$dir/SubSamplingFunctions.jl"
    subSampling_name = "basicSubSampling"

    io = open(ARGS[1], "r")
    lines = readlines(io)
    close(io)

    for elem in lines
        if elem != ""
            local splitLine = split(elem)
            if contains(splitLine[1], "#") == false
                if splitLine[1] == "fidelity"
                    global ϕ = parse(Float64, splitLine[2])
                    if ϕ > 1 || ϕ <= 0 
                        global ϕ = 1.0
                        @warn "The value of the fidelity was not a float included in ]0, 1], it was set to maximum fidelity 1.0"
                    end
                elseif splitLine[1] == "seed"
                    if parse(Float64, splitLine[2]) % 1 > 10^(-20)
                        @warn "The value of the seed was not integer in the ARGS_FILE, it was rounded"
                    end
                    val = Int(round(parse(Float64, splitLine[2])))
                    if val == -1
                        global seed = rand(RandomDevice(), Int64)
                    else
                        global seed = val
                    end
                elseif splitLine[1] == "continueEval"
                    if length(splitLine) == 3
                        global pathToContinueEvaljlFile = splitLine[2]
                        global continueEval_name = splitLine[3]
                    elseif length(splitLine) == 2
                        global continueEval_name = splitLine[2] 
                    end
                elseif splitLine[1] == "single MC_info_return"
                    if length(splitLine) == 3
                        global pathToSingle_MC_Info_ReturnjlFile = splitLine[2]
                        global single_MC_info_return_name = splitLine[3]
                    elseif length(splitLine) == 2
                        global single_MC_info_return_name = splitLine[2]
                    end
                elseif splitLine[1] == "AnyParamForContinueEvalFunction"
                    global AnyParamForContinueEvalFunction = join(splitLine[2:end], " ")
                elseif splitLine[1] == "AnyParamForSingle_MC_Info_ReturnFunction"
                    global AnyParamForSingle_MC_Info_ReturnFunction = join(splitLine[2:end], " ")
                elseif splitLine[1] == "PGinstance"
                    if parse(Float64, splitLine[2]) % 1 > 10^(-20)
                        @warn "The value of the PGinstance was not integer in the ARGS_FILE, it was rounded"
                    end
                    global PGinstance = parse(Int64, splitLine[2])
                elseif splitLine[1] == "loggingTime"
                    if splitLine[2] == "1" || splitLine[2] == "0" || splitLine[2] == "true" || splitLine[2] == "false" 
                        global loggingTime = "$(parse(Bool, splitLine[2]))"
                    elseif contains(splitLine[2], ".txt") || contains(splitLine[2], "/") || contains(splitLine[2], "\\")
                        global loggingTime = splitLine[2]
                    else
                        global loggingTime = "false"
                        @warn "The value entered for the loggingTime argument was not of a type asked, it was considered as \"false\""
                    end
                elseif splitLine[1] == "eta"
                    if parse(Float64, splitLine[2]) % 1 > 10^(-20)
                        @warn "The value of eta was not integer in the ARGS_FILE, it was rounded"
                    end
                    global eta = Int64(round(parse(Float64, splitLine[2])))
                elseif splitLine[1] == "halfTrialsReturn"
                    if splitLine[2] == "1" || splitLine[2] == "0" || splitLine[2] == "true" || splitLine[2] == "false" 
                        global halfTrialsReturn = parse(Bool, splitLine[2])
                    else
                        global halfTrialsReturn = true
                        @warn "The value entered for the halfTrialsReturn argument was not of a type asked, it was considered as true"
                    end
                elseif splitLine[1] == "N"
                    if parse(Float64, splitLine[2]) % 1 > 10^(-20)
                        @warn "The value of the N was not integer in the ARGS_FILE, it was put to default value 10000"
                    else
                        global N = parse(Int64, splitLine[2])
                    end
                elseif splitLine[1] == "subSampling"
                    if length(splitLine) == 3
                        global pathToSubSamplingjlFile = splitLine[2]
                        global subSampling_name = splitLine[3]
                    elseif length(splitLine) == 2
                        global subSampling_name = splitLine[2]
                    end
                elseif splitLine[1] == "AnyParamForSubSamplingFunction"
                    global AnyParamForSubSamplingFunction = join(splitLine[2:end], " ")
                else 
                    @warn "did not recognize the argument \"$(splitLine[1])\" in the ARGS_FILE, it was ignored"
                end
            end
        end
    end
    
    if isfile(ARGS[2]) == true
        io = open(ARGS[2], "r")
        lines = readlines(io)
        close(io)

        local splitLine = split(lines[1])
        input = Vector{Float64}(undef, length(splitLine))
        for i in 1:length(splitLine)
            input[i] = parse(Float64, splitLine[i])
        end

        include(pathToContinueEvaljlFile)
        include(pathToSingle_MC_Info_ReturnjlFile)

        continueEval_symbol = Symbol(continueEval_name)
        continueEval = getfield(Main, continueEval_symbol)
        single_MC_info_return_symbol = Symbol(single_MC_info_return_name)
        single_MC_info_return = getfield(Main, single_MC_info_return_symbol)
        subSampling_symbol = Symbol(subSampling_name)
        subSampling = getfield(Main, subSampling_symbol)

        println(MicroPRIAD(input, ϕ=ϕ, seed=seed, continueEval=continueEval, PGinstance=PGinstance, loggingTime=String(loggingTime), eta=eta, halfTrialsReturn=halfTrialsReturn, N=N, AnyParamForContinueEvalFunction=AnyParamForContinueEvalFunction, single_MC_info_return=single_MC_info_return, AnyParamForSingle_MC_Info_ReturnFunction=AnyParamForSingle_MC_Info_ReturnFunction, subSampling=subSampling, AnyParamForSubSamplingFunction=AnyParamForSubSamplingFunction))
        global needHelp = false
    else
        global needHelp = true
    end

elseif length(ARGS) > 2

    dir = @__DIR__
    pathToContinueEvaljlFile = "$dir/ContinueEvalFunctions.jl"
    continueEval_name = "basicContinueEval"
    pathToSingle_MC_Info_ReturnjlFile = "$dir/Single_MC_info_return_Functions.jl"
    single_MC_info_return_name = "basic_single_MC_info_return"
    pathToSubSamplingjlFile = "$dir/SubSamplingFunctions.jl"
    subSampling_name = "basicSubSampling"

    indexArr = findallParam(ARGS)
    for i in 1:length(indexArr)
        ARGS[indexArr[i]] = replace(ARGS[indexArr[i]], "-" => "")
        if i != length(indexArr)
            splitLine = ARGS[indexArr[i]:(indexArr[i + 1] - 1)]
        else
            splitLine = ARGS[indexArr[i]:(length(ARGS) - 1)]
        end
        if splitLine[1] == "fidelity"
            global ϕ = parse(Float64, splitLine[2])
            if ϕ > 1 || ϕ <= 0 
                global ϕ = 1.0
                @warn "The value of the fidelity was not a float included in ]0, 1], it was set to maximum fidelity 1.0"
            end
        elseif splitLine[1] == "seed"
            if parse(Float64, splitLine[2]) % 1 > 10^(-20)
                @warn "The value of the seed was not integer in the ARGS_FILE, it was rounded"
            end
            val = Int(round(parse(Float64, splitLine[2])))
            if val == -1
                global seed = rand(RandomDevice(), Int64)
            else
                global seed = val
            end
        elseif splitLine[1] == "continueEval"
            if length(splitLine) == 3
                global pathToContinueEvaljlFile = splitLine[2]
                global continueEval_name = splitLine[3]
            elseif length(splitLine) == 2
                global continueEval_name = splitLine[2]
            end
        elseif splitLine[1] == "single_MC_info_return"
            if length(splitLine) == 3
                global pathToSingle_MC_Info_ReturnjlFile = splitLine[2]
                global single_MC_info_return_name = splitLine[3]
            elseif length(splitLine) == 2
                global single_MC_info_return_name = splitLine[2]
            end
        elseif splitLine[1] == "AnyParamForContinueEvalFunction"
            global AnyParamForContinueEvalFunction = join(splitLine[2:end], " ")
        elseif splitLine[1] == "AnyParamForSingle_MC_Info_ReturnFunction"
                    global AnyParamForSingle_MC_Info_ReturnFunction = join(splitLine[2:end], " ")
        elseif splitLine[1] == "PGinstance"
            if parse(Float64, splitLine[2]) % 1 > 10^(-20)
                @warn "The value of the PGinstance was not integer in the ARGS_FILE, it was rounded"
            end
            global PGinstance = parse(Int64, splitLine[2])
        elseif splitLine[1] == "loggingTime"
            if splitLine[2] == "1" || splitLine[2] == "0" || splitLine[2] == "true" || splitLine[2] == "false" 
                global loggingTime = "$(parse(Bool, splitLine[2]))"
            elseif contains(splitLine[2], ".txt") || contains(splitLine[2], "/") || contains(splitLine[2], "\\")
                global loggingTime = splitLine[2]
            else
                global loggingTime = "false"
                @warn "The value entered for the loggingTime argument was not of a type asked, it was considered as \"false\""
            end
        elseif splitLine[1] == "eta"
            if parse(Float64, splitLine[2]) % 1 > 10^(-20)
                @warn "The value of eta was not integer in the ARGS_FILE, it was rounded"
            end
            global eta = Int64(round(parse(Float64, splitLine[2])))
        elseif splitLine[1] == "halfTrialsReturn"
            if splitLine[2] == "1" || splitLine[2] == "0" || splitLine[2] == "true" || splitLine[2] == "false" || splitLine[2] == "1.0" || splitLine[2] == "0.0"
                global halfTrialsReturn = parse(Bool, splitLine[2])
            else
                global halfTrialsReturn = true
                @warn "The value entered for the halfTrialsReturn argument was not of a type asked, it was considered as true"
            end
        elseif splitLine[1] == "N"
            if parse(Float64, splitLine[2]) % 1 > 10^(-20)
                @warn "The value of the N was not integer in the ARGS_FILE, it was put to default value 10000"
            else
                global N = parse(Int64, splitLine[2])
            end
        elseif splitLine[1] == "subSampling"
            if length(splitLine) == 3
                global pathToSubSamplingjlFile = splitLine[2]
                global subSampling_name = splitLine[3]
            elseif length(splitLine) == 2
                global subSampling_name = splitLine[2]
            end
        elseif splitLine[1] == "AnyParamForSubSamplingFunction"
            global AnyParamForSubSamplingFunction = join(splitLine[2:end], " ")
        else 
            @warn "did not recognize the argument \"$(splitLine[1])\", it was ignored"
        end
    end


    if isfile(ARGS[end]) == true

        io = open(ARGS[end], "r")
        lines = readlines(io)
        close(io)

        local splitLine = split(lines[1])
        input = Vector{Float64}(undef, length(splitLine))
        for i in 1:length(splitLine)
            input[i] = parse(Float64, splitLine[i])
        end

        include(pathToContinueEvaljlFile)
        include(pathToSingle_MC_Info_ReturnjlFile)

        continueEval_symbol = Symbol(continueEval_name)
        continueEval = getfield(Main, continueEval_symbol)
        single_MC_info_return_symbol = Symbol(single_MC_info_return_name)
        single_MC_info_return = getfield(Main, single_MC_info_return_symbol)
        subSampling_symbol = Symbol(subSampling_name)
        subSampling = getfield(Main, subSampling_symbol)

        println(MicroPRIAD(input, ϕ=ϕ, seed=seed, continueEval=continueEval, PGinstance=PGinstance, loggingTime=String(loggingTime), eta=eta, halfTrialsReturn=halfTrialsReturn, N=N, AnyParamForContinueEvalFunction=AnyParamForContinueEvalFunction, single_MC_info_return=single_MC_info_return, AnyParamForSingle_MC_Info_ReturnFunction=AnyParamForSingle_MC_Info_ReturnFunction, subSampling=subSampling, AnyParamForSubSamplingFunction=AnyParamForSubSamplingFunction))
        global needHelp = false
    else
        global needHelp = true
    end
end



if (needHelp == true)
    if "-test" ∈ ARGS || "-t" ∈ ARGS || "-tests" ∈ ARGS 
        expectedOutput = "1.0 9.677484448184891e7 -139.1111111111109 -214.0000000000002 189.2098832620489 353.3228016557553 236.4837418912764 80.8352545241803 370.97579692795557 161.16992582972546 143.4715928610143"
        receivedOutput = MicroPRIAD([3 for i in 1:28], ϕ=0.0001, seed=0)
        if receivedOutput == expectedOutput
            println("The test of the blackbox function gave the expected output, it seems that everything is working fine, you can now run your own simulation with the arguments you want!")
        else
            println("The test of the blackbox function did not give the expected output, please report this issue to us with the output you got and the version of Julia you are using")
            println("\nThe expected output is \n\"$expectedOutput\"\n and your output is \n\"$receivedOutput\"")
        end
    else
    print(" \n \nTo run a simulation, there are four options. you can eighter : \n
    \t- type `\$MiniPRIAD_HOME/src/run.jl pathToARGS/ARGS.txt pathToX/x.txt` where the `ARGS.txt` contains the necessary information to call the blackbox or \n
    \t  type `\$MiniPRIAD_HOME/src/run.jl -@param1 value1 -@param2 value2 ... pathToX/x.txt` where the necessary information to call the blackbox is in the (-@paramJ valueJ) couple of the command line or \n
    \t- type `\$MiniPRIAD_HOME/src/run.jl pathToX/x.txt` where the necessary information to call the blackbox is in comment box in green in the `run.jl` file or \n
    \t- call the MicroPRIAD Julia function direcly in a Julia sript if your solver is defined in julia (don't forget to include \"MicroPRIAD.jl\"). \n
    \n
    The ARGS.txt file contains the same informations that you would need to define in Julia if you chose the execution option 2, 3 or 4. It contains arguments described in ARGS_README in MICRO_PRIAD_HOME/documentation/BB_Parameter and formated like in the ex_ARGS.txt files located in each folder in MICRO_PRIAD_HOME/Tests. \n
    \n
    The `x.txt` file contains the input vector that can takes diferent sizes: \n
    input: It is the blackbox input of 28, 15 or 13 dimentions, including integer (I) and reel (R) inputs, the diferent input are defined like so: \n
    \t- 28 dimention input: [I, R, I, R, R, I, R, I, R, I, R, I, R, I, R, I, R, I, R, I, R, I, R, I, R, I, R, R] \n
    \t- 15 dimention input: [R, R, R, R, R, R, R, R, R, R, R, R, R, R, R] \n
    \t- 13 dimention input: [I, R, I, R, I, R, I, R, I, R, I, R, R] \n
    The `x.txt` file must contains only the numerical value of each variable seperated with spaces without \"[\", \",\" or \"[\" \n
    For all integer input the recommanded bounds are 1 and 9 and for all reel input the recommanded bounds are 0.1 and 10.0 \n \n")
    print_rgb(255, 0, 0, "If you you received this message, it means that you did not specify the arguments correctly or that you did not respect the input format. \n\n")
    print("\033[0m")
    end
end
