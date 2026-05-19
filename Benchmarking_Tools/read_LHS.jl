#=
This file is used for reading the LHS_results
=#


dir = @__DIR__
path2LHS_results = "$dir/LHS_results"
using Plots
using Statistics


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

function getX(ACTUAL_FILE_PATH)
    io = open("$ACTUAL_FILE_PATH/lhs_x.txt", "r")
    x_lines = readlines(io)
    close(io)

    xVec = []

    for line in x_lines
        splitLine = split(line)
        x = Vector{Float64}(undef, length(splitLine))
        for i in 1:length(splitLine)
            x[i] = parse(Float64, String(splitLine[i]))
        end
        push!(xVec, x)
    end
    return xVec
end

function getFFC(ACTUAL_FILE_PATH, aPrioriFilter)#, countedEval)
    io = open("$ACTUAL_FILE_PATH/lhs_output.txt", "r")
    lines = readlines(io)
    close(io)
    FFC = []
    index = []
    for i in 1:10000
        spllitLine = split(lines[i])
        ffc = Vector{Float64}(undef, 11)

        if contains(lines[i], "Failure")
            s = 4
        else
             s = 6
        end

        for k in 1:11
            ffc[k] = parse(Float64, String(spllitLine[k + s]))
        end
        if !(ffc[2] == Inf64 && aPrioriFilter)
            push!(index, i)
            push!(FFC, ffc)
            #countedEval += 1
        end
    end
    return FFC, index#, countedEval
end

function getLoggingTime(ACTUAL_FILE_PATH)
    io = open("$ACTUAL_FILE_PATH/loggingTime.txt", "r")
    lines = readlines(io)
    close(io)

    time = Vector{Float64}(undef, length(lines))
    for i in 1:length(lines)
        time[i] = parse(Float64, String(lines[i]))
    end
    return time
end

function refCalculator(xVec, index, FFC, rayon, inputLength)
    if inputLength == 13
        rMax = (10^2 * 7 + 8^2 * 6)^(0.5)
    elseif inputLength == 15
        rMax = (10^2 * 15)^(0.5)
    elseif inputLength == 28
        rMax = (10^2 * 15 + 8^2 * 13)^(0.5)
    end

    if rayon >= rMax
        return [precedes(FFC[i], FFC[j]) for i in 1:(length(index) - 1) for j in (i + 1):length(index)]
    else 
        ref = []
        for i in 1:(length(index) - 1)
            for j in (i + 1):length(index)
                dist = 0.0
                for k in 1:inputLength
                    dist += (xVec[i][k] - xVec[j][k])^2
                end
                dist = sqrt(dist)
                if dist <= rayon
                    push!(ref, precedes(FFC[i], FFC[j]))
                end
            end
        end
    end
    return ref
end


function precedesGraphPlotting()
    REF = []
    ref = []

    aPrioriFilter = true
    rayon = 5

    for i in [1, 2, 3]
        for l in [13, 15, 28]
            graph = []
            push!(graph, 100)
            for ϕ in [1.0, 0.1, 0.01, 0.001, 0.0001]
                #countedEval = 0
                ACTUAL_FILE_PATH = "$path2LHS_results/input_length=$l/instance=$i/10000phi=$(Int(round(10^4 * ϕ)))"


                    xVec = getX("$path2LHS_results/input_length=$l")

                    FFC, index = getFFC(ACTUAL_FILE_PATH, aPrioriFilter)#, countedEval)

                    if ϕ == 1.0
                        global REF = refCalculator(xVec, index, FFC, rayon, l)#[precedes(FFC[i], FFC[j]) for i in 1:(countedEval - 1) for j in (i + 1):countedEval]
                    else
                        global ref = refCalculator(xVec, index, FFC, rayon, l)#[precedes(FFC[i], FFC[j]) for i in 1:(countedEval - 1) for j in (i + 1):countedEval]
                        nbOkay = 0
                        for i in 1:length(ref)
                            if ref[i] == REF[i]
                                nbOkay += 1
                            end
                        end
                        push!(graph, nbOkay / length(ref) * 100)
                    end
            end
                p = plot([1.0, 0.1, 0.01, 0.001, 0.0001, 0.00001], graph, title = "i = $i, l = $l, APF = $aPrioriFilter, r = $rayon", xscale = :log10, xticks = [0.00001, 0.0001, 0.001, 0.01, 0.1, 1.0])
                display(p)
        end
    end
end

function AverageExecutionalTImeCalculator()
    for i in [1, 2, 3]
        for l in [13, 15, 28]
            println("Instance = $i, Length of input = $l")
            println("ϕ        Mean Time (s)        σTime (s)")
            for ϕ in [1.0, 0.1, 0.01, 0.001, 0.0001]
                ACTUAL_FILE_PATH = "$path2LHS_results/input_length=$l/instance=$i/10000phi=$(Int(round(10^4 * ϕ)))"
                timeVec = getLoggingTime(ACTUAL_FILE_PATH)
                MeanTime = mean(timeVec)
                σTime = (var(timeVec))^(0.5)
                println("$(lpad(string(ϕ), 7))    $(lpad(string(round(MeanTime, sigdigits=5)), 12))    $(lpad(string(round(σTime, sigdigits=5)), 10))")
            end
            println()
        end
    end
end

global MeanTime = Vector{Float64}(undef, 5)
global σTime = Vector{Float64}(undef, 5)

function AverageExecutionalTImePloting()
    vecϕ = [1.0, 0.1, 0.01, 0.001, 0.0001]
    fig = plot(title = "Temps d'exécution en fonction du niveau de fidélité",
                xlabel = "fidélité",
                ylabel = "Temps d'exécution moyen")
    for i in [1, 2, 3]
        for l in [13, 15, 28]
            for j in 1:5
                ϕ = vecϕ[j]
                ACTUAL_FILE_PATH = "$path2LHS_results/input_length=$l/instance=$i/10000phi=$(Int(round(10^4 * ϕ)))"
                timeVec = getLoggingTime(ACTUAL_FILE_PATH)
                MeanTime[j] =  mean(timeVec)
                σTime[j] = (var(timeVec))^(0.5)
            end
                plot!(fig,  vecϕ, MeanTime, label = "$(i)_$l", seriestype=:scatter, xaxis = :log10, yaxis = :log10)
                    display(fig)

        end
    end
    display(fig)

end

function AverageExecutionalTImePlotinBar()
    vecϕ = [1.0, 0.1, 0.01, 0.001, 0.0001]
    #fig = bar(title = "Temps d'exécution en fonction du niveau de fidélité",
                #xlabel = "fidélité",
                #ylabel = "Temps d'exécution moyen")
    for i in [1, 2, 3]
        fig = bar(title = "Temps d'exécution en fonction du niveau de fidélité",
                xlabel = "fidélité",
                ylabel = "Temps d'exécution moyen", yaxis = :log10)
                lenVec = Vector{Int64}(undef, 3)
                if i == 1
                    lenVec = [28, 13, 15]
                elseif i ==2
                    lenVec = [28, 15, 13]
                else
                    lenVec = [28, 15, 13]
                end
        for l in lenVec
            for j in 1:5
                ϕ = vecϕ[j]
                ACTUAL_FILE_PATH = "$path2LHS_results/input_length=$l/instance=$i/10000phi=$(Int(round(10^4 * ϕ)))"
                timeVec = getLoggingTime(ACTUAL_FILE_PATH)
                MeanTime[j] =  mean(timeVec)
                σTime[j] = (var(timeVec))^(0.5)
            end
            str = ["$(vecϕ[6 - k])" for  k in 1:5]
                bar!(fig, str, reverse(MeanTime),
                title = "Temps d'exécution en fonction du niveau de fidélité",
                xlabel = "fidélité",
                ylabel = "Temps d'exécution moyen", 
                yaxis = :log10, 
                label = "$(i)_$l")
        end
        display(fig)
    end

end

#precedesGraphPlotting()
AverageExecutionalTImeCalculator()
#AverageExecutionalTImePloting()
AverageExecutionalTImePlotinBar()
