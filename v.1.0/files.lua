require('auxiliar')


function loadData()
    local data = loadFile( "data.txt" )
    local categories = split(data[1], ";")

    for i = 1, #categories do
        table.insert(_CATEGORIES, categories[i])
    end

    local row, items, subItems

    for i = 2, #data do   -- Each row
        items = split(data[i], ";")
        row = {}

        for j = 1, #categories do  -- Each Category Key for the row
            row[categories[j]] = {}
            subItems = split(items[j], ",") -- Getting the Items that go in that category

            if #subItems > 0 then
               for k = 1, #subItems do
                  table.insert(row[categories[j]], subItems[k])
               end
            else
                table.insert(row[categories[j]], items[j])
            end
        end 
        
        table.insert(_DATA, row)
    end

end

function loadFile( fileName )
     local s = {}
     local file = io.open(fileName, "r")
     local line = file:read("*l")
     
     while line ~= nil do
        s[#s + 1] = line
        line = file:read("*l")
     end
     file.close(file)

     return s
end

function printData()
   for i = 1, #_DATA do   -- Each row
        io.write(printDataLine(i).."\n")
    end
end

function printDataLine(index)
    local s = ""
    for key, value in pairs(_DATA[index]) do  -- Each Category Key in the row
        s = s..key..": "

        for k = 1, #value do
            s = "\t"..s..value[k].."\n\t"
        end

        s = s.."\n\t"
    end
    return s
end

function printCategories()
    for i = 1, #_CATEGORIES do
       io.write(i..". ".._CATEGORIES[i].."\n")
    end
end
