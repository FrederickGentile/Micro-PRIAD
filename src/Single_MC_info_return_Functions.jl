function basic_single_MC_info_return(info, param)
end

function print_single_MC_info_return(info, param)
    for i in 1:5
        if i != 1
            info[i] = info[i] - 500
        else
            info[i]
        end
    end
    formatedInfo = join(info, " ")
    dir = @__DIR__
    if param == ""
        splitDir = split(dir, "/") 
        newSplitDir = Vector{SubString}(undef, length(splitDir) - 1)
        for i in 1:(length(splitDir) - 1)
            newSplitDir[i] = splitDir[i]
        end
        newDir = join(newSplitDir, "/")
        io = open("$newDir/single_MC_info_log.txt", "a")
        formatedInfo
        write(io, "$formatedInfo\n")
        close(io)
    else
        if param[end] == "/"
            io = open("$(param)single_MC_info_log.txt", "a")
        elseif param[end - 3:end] == ".txt"
            io = open("$param", "a")
        else
            io = open("$(param)/single_MC_info_log.txt", "a")
        end
        write(io, "$formatedInfo\n")
        close(io)
    end
end

function print_single_MC_info_return_for_subSampling(info, param)
    formatedInfo = "$(info[1]) $(info[4] - 500) $(info[5] - 500)"
    dir = @__DIR__
    if param == ""
        splitDir = split(dir, "/") 
        newSplitDir = Vector{SubString}(undef, length(splitDir) - 1)
        for i in 1:(length(splitDir) - 1)
            newSplitDir[i] = splitDir[i]
        end
        newDir = join(newSplitDir, "/")
        io = open("$newDir/single_MC_info_log.txt", "a")
        formatedInfo
        write(io, "$formatedInfo\n")
        close(io)
    else
        if param[end] == "/"
            io = open("$(param)single_MC_info_log.txt", "a")
        elseif param[end - 3:end] == ".txt"
            io = open("$dir/$param", "a")
        else
            io = open("$(param)/single_MC_info_log.txt", "a")
        end
        write(io, "$formatedInfo\n")
        close(io)
    end
end

function TEST_single_MC_info_return(info, param)
    io = open(param, "a")
    println(io, "$info")
    close(io)
end