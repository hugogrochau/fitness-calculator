-- Data module
-- Gets data from json file

-- External modules
json = require("json")


local dataFileName = "data.json"

local cachedParsedData = nil

-- Reads a file and returns the (json) parsed table
function getData(fileName)
	local file = io.open(fileName, "r")
	local fileString = file:read() 
	return json.decode(fileString)

-- Encodes data into json and writes it to a file
function writeData(fileName, parsedData)
	local file = io.open(fileName, "w")
	local fileString = json:encode(parsedData)
	file.write(fileString)

-- Gets a property from data table
function getProperty(propName)
	if cachedParsedData == nil then
		cachedParsedData = getData(dataFileName)
	
	return cachedParsedData[propName]

-- Writes a property to the data table and persists it to the file
function writeProperty(propName, value)
	if cachedParsedData == nil then
		cachedParsedData = getData(dataFileName)

	cachedParsedData[propName] = value
	writeData(dataFileName, cachedParsedData)
