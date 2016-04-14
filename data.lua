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
if data.dataFileExists() then
	local file = io.open(dataFileName, "r")
	local fileString = file:read() 
	cachedParsedData = json.decode(fileString)
	file:close()
end

-- Encodes data into json and writes it to a file
local function writeData(fileName, parsedData)
	local file = io.open(fileName, "w")
	local fileString = json.encode(parsedData)
	file:write(fileString)
	file:close()
end

-- Gets a property from data table
function data.getProperty(propName)
	return cachedParsedData[propName]
end

-- Writes a property to the data table and persists it to the file
function data.writeProperty(propName, value)
	cachedParsedData[propName] = value
	writeData(dataFileName, cachedParsedData)
end


return data