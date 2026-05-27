function basicSubSampling(nhnisbc, str)
    return 1:length(nhnisbc)
end

function TEST_SubSampling(nhnisbc, str)
    newIndex = []
    i = 0
    for elem in nhnisbc
        i += 1
        if mod(i,2) == 0
            push!(newIndex, i)
        end
    end
    return newIndex
end