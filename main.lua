-- Fitness calculator by Hugo Grochau (hugogrochau) and Gustavo Marques (gugamm)

-- Import external modules
local data              = require("data")
local menu              = require("menu")
local fitnesscalculator = require("fitnesscalculator")

-- If it's the first time the user is running the program
local initialInfo = {}
if not data.dataFileExists() then
	initialInfo = menu.initial()
	-- Save their name, age and height
	for k, v in pairs(initialInfo) do
  		data.writeProperty(k, v)
	end
else
   initialInfo['name']   = data.getProperty('name')
   initialInfo['age']    = data.getProperty('age')
   initialInfo['gender'] = data.getProperty('gender')
   initialInfo['height'] = data.getProperty('height')
end

-- Get weight and waist from user
local statistics = menu.statistics()


----------------------------------------
-- Variables to calculate
----------------------------------------

local height = initialInfo['height']
local name   = initialInfo['name']
local age    = initialInfo['age']
local gender = initialInfo['gender']
local weight = statistics['weight']
local waist  = statistics['waist']

-- Calculate all indexes 
local bmi      = fitnesscalculator.bmi(weight, height)
local bmr      = fitnesscalculator.bmr(weight, height, age, gender)
local idealBmi = fitnesscalculator.idealBmi(weight, height, age, gender) 
local bodyFat  = fitnesscalculator.bodyFat(weight, height, age, gender)

-- Print all results to the screen
menu.results(bmi, bmr, idealBmi, bodyFat)
