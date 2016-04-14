local fitnesscalculator = {}


-- calculates the body mass index of a person
-- receives weight and height and returns the bmi
function fitnesscalculator.bmi(weight, height)
    local heightInMeters = height / 100
    return weight / (heightInMeters * heightInMeters);
end

-- calculates the body mass ratio of a person
-- receives the weight, height, age and gender and returns the bmr
function fitnesscalculator.bmr(weight, height, age, gender) 
    local result = 0
    if gender == 'm' then
        result = 10 * weight + 6.25 * height - 5 * age + 5
    else
        result = 10 * weight + 6.25 * height - 5 * age - 161
    end
    return result
end

-- calculates the ideal body mass index
-- receives the weight, height, age and gender and returns the ideal bmi
function fitnesscalculator.idealBmi(weight, height, age, gender) 
    local result = 0
    if gender == 'm' then
        result = 0.5 * fitnesscalculator.bmi(weight, height) + 11.5
    else
        result = 0.4 * fitnesscalculator.bmi(weight, height) + 0.03*age + 11
    end
    return result
end

-- calculates the body fate percentage
-- receives the weight, height, age and gender and returns the body fat percentage
function fitnesscalculator.bodyFat(weight, height, age, gender)
   local result = 0
   local sex = 0
   if gender == 'm' then
       sex = 1
   end
   
   if age < 14 then
       result = 1.51 * fitnesscalculator.bmi(weight,height) - (0.7 * age) - (3.6 * sex) + 1.4
   else
       result = 1.20 * fitnesscalculator.bmi(weight,height) + (0.23 * age) - (10.8 * sex) - 5.4
   end
   
   return result
end

return fitnesscalculator
