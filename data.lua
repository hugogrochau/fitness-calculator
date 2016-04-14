-- Data module
-- Gets data from json file
local data = {}

-- External modules
local json = require("json")

local dataFileName = "data.json"
local cachedParsedData = {}

-- Checks if file exists
function data.dataFileExists()
	local f = io.open(dataFileName, "r")
	if f ~= nil then
		io.close(f)
		return true
	end
	return false
end

-- Reads file for the first time
-- It the file exists, it load the data into cachedParsedData
-- If the file does not exists, cachedParsedData will have an empty value {}
if data.dataFileExists() then
	local file = io.open(dataFileName, "r")
	local fileString = file:read() 
	cachedParsedData = json.decode(fileString)
	file:close()
end

-- Encodes data into json and writes it to a file
-- This function record data into data.json file
-- If the file does not exist it will create a new one
-- if the file does exist it will overwrite it
local function writeData(fileName, parsedData)
	local file = io.open(fileName, "w")
	local fileString = json.encode(parsedData)
	file:write(fileString)
	file:close()
end

-- Gets a property from data table
-- If the property does not exist it will return nil
-- If the property does exist it will return the value of the property
function data.getProperty(propName)
	return cachedParsedData[propName]
end

-- Writes a property to the data table and persists it to the file
function data.writeProperty(propName, value)
	cachedParsedData[propName] = value
	writeData(dataFileName, cachedParsedData)
end


return data