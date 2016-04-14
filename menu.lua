-- Menu module
-- Contains various menus for interacting with the user
local menu = {}

-- Import external modules
local data = require("data")

-- Receives a title and prints a header
local function header(title)
	io.write('******************\n')
	io.write('**     ' .. title .. '     **\n')
	io.write('******************\n')
	io.write('\n')
end


-- Getter initial data from user like name, age, gender and height
function menu.initial()
    local initialInfo = {}
    header('INITIAL')
    
    io.write('What\'s your name? ')
    initialInfo['name'] = io.read()
    
    io.write('What\'s your age? ')
    initialInfo['age'] = tonumber(io.read())
    
    io.write('What\'s your gender (m/f)?')
    initialInfo['gender'] = string.lower(io.read())
    
    io.write('What\'s your height in centimeters? ')
    initialInfo['height'] = tonumber(io.read())
    
    return initialInfo
end

-- Get changeable data from user, like weight and waist
function menu.statistics()
    local result = {}
    header('STATISTICS')
    io.write('What\'s your weight in kilograms? ')
    result['weight'] = tonumber(io.read())
    
    io.write('What\'s your waist circumference in centimeters? ')
    result['waist'] = tonumber(io.read())
    return result
end

-- Print all results to the screen
function menu.results(bmi, bmr, idealBmi, bodyFat)
    -- Print body mass index
    print('---- BODY MASS INDEX ----')
    print(bmi)

    -- Print basal metabolic rate
    print('---- BASAL METABOLIC RATE ----')
    print(bmr)

    -- Print ideal body mass index
    print('---- IDEAL BODY MASS INDEX ----')
    print(idealBmi)

    -- Print body fat percentage
    print('---- BODY FAT PERCENTAGE ----')
    print(bodyFat)
end

return menu
