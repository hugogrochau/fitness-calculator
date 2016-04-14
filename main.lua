-- Fitness tracker by Hugo Grochau (hugogrochau) and Gustavo Marques (gugamm)

-- Main Module

local json = require("json")

--[[ 
	FName : printMenu
	FArgs   : null
	FRet     : null
	FCom  : print a menu in console
 --]]
function printMenu()
	io.write('******************\n');
	io.write('*      MENU      *\n');
	io.write('******************\n');
	io.write('\n');
	io.write('1- Check Statistics\n');
	io.write('2- Add new data\n');
	io.write('3- Save and exit\n');
	io.write('\n');
	io.write('Option : ');
end

--[[ 
	FName : load
	FArgs   : null
	FRet     : null
	FCom  : load previous data from pdata file (json)
 --]]
function load()

end

--[[ 
	FName : save
	FArgs   : null
	FRet     : null
	FCom  : save  data to pdata file (json)
 --]]
function save()

end

function main() 
	local option;
	os.execute("cls"); --[[Clear screen (Only for windows) --]]
	repeat 
		printMenu();
		option =  0 + io.read();  --[[ Convert io.read to number --]]
		
		if option == 1 then
		
		elseif option == 2 then
		
		elseif option ~= 3 then
			print('Please select a valid option\n' );
		end
	until option == 3; 
	save();
	print('Goodbye!');
end

main();