#=
this function calculates the cost for a given station, a given time vector of number of hours not in service by categories. It iterates over the 6 categories of time period and for each category it calculates the cost of the unavailability for each client of the station based on their annual consumption and their type (residential, must be in service or not). It also calculates the C8 and C9 costs based on the annual consumption of the clients and the time vector. Finally it returns the total cost, C8 and C9 as a vector.
=#
function riskModule(station::Station, timeVec, nbVec)
    cost = 0.0
    C8 = 0.0
    C9 = 0.0
    nbHoursInAYear = 365.25 * 24

    for i in 1:6
        if i == 1
            costVec = [12.7, 258.0, 1.3]
        elseif i == 2
            costVec = [12.9, 267.3, 1.4]
        elseif i == 3
            costVec = [12.1, 214.3, 1.6]
        elseif i == 4
            costVec = [21.8, 295.0, 3.3]
        elseif i == 5
            costVec = [37.4, 474.1, 5.9]
        else
            costVec = [190.7, 2255.0, 30.9]
        end  

        for client in station.Equipments[1].ClientsList
            if client.Residential == true
                cost += timeVec[i] * costVec[3] * 1000 * client.AnnualConsumption/nbHoursInAYear
                C8 += client.AnnualConsumption * (timeVec[i] * 1000/(sum(nbVec[1:4]) * nbHoursInAYear ) * 0.131)
            elseif client.MustBeInService == false && client.AnnualConsumption <= 50
                cost += timeVec[i] * costVec[2] * 1000 * client.AnnualConsumption/nbHoursInAYear
                C8 += client.AnnualConsumption * (timeVec[i] * 1000/(sum(nbVec[1:4]) * nbHoursInAYear ) * 0.131)
            elseif client.MustBeInService == false && client.AnnualConsumption > 50
                cost += timeVec[i] * costVec[1]  * 1000 * client.AnnualConsumption/nbHoursInAYear
                C8 += client.AnnualConsumption * (timeVec[i] * 1000/(sum(nbVec[1:4]) * nbHoursInAYear ) * 0.131)
            elseif client.MustBeInService == true
                cost += timeVec[i] * costVec[1] * 1000 * client.AnnualConsumption/nbHoursInAYear
                C8 += client.AnnualConsumption * (timeVec[i] * 1000/(sum(nbVec[1:4]) * nbHoursInAYear ) * 0.131)
                C9 += client.AnnualConsumption * (timeVec[i] * 1000/((nbVec[1] + 10 * (nbVec[1])^0.5) * nbHoursInAYear) * 5.629)
            end
        end
    end
    return [cost, C8, C9]
end

GC.gc()