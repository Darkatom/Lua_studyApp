require('files')

function menu()
   printMenu()

   io.write("> ")
   local action = io.read()
   io.write("\n")

   while (action ~= "0" and tonumber(action) > 2) do
      io.write("--> You can not choose an action that doesn't exist!\n")
      io.write("\tNOTE: You can always go back with 0.\n")
      io.write("> ")
      action = io.read()
      io.write("\n")
   end

   while (action ~= "0") do
     if action == "1" then
        printData()
     elseif action == "2" then
        chooseFields()
     end

     printMenu()
     io.write("> ")
     action = io.read()
     io.write("\n")
     
     while (action ~= "0" and tonumber(action) > 2) do
        io.write("--> You can not choose an action that doesn't exist!\n")
        io.write("\tNOTE: You can always go back with 0.\n")
        action = io.read()
     end
   end
end


function printMenu()
    io.write("\n--------------------- Study App ---------------------\n")
    io.write("-------------------- by Darkatom --------------------\n")
    io.write("Select the NUMBER of the ACTION you want to execute: \n")
    io.write("1. See Stored Data\n")
    io.write("2. Start Studying!\n")
    io.write("0. - Exit -\n")
end

function chooseFields()
    local fieldTipNumber, fieldStudyNumber

    io.write("\n-----------------------------------------------------\n")
    io.write("-------------------- Study Time! --------------------\n")
    io.write("Select the NUMBER of the FIELD you want as a tip: \n")
    io.write("\t NOTE: Selecting as a tip a field where the value\n")
    io.write("\tis not unique is not advisable. Unless you want to\n")
    io.write("\tplay guesses.\n")
    printCategories()
    io.write("0. - Exit -\n")

    io.write("> ")
    fieldTipNumber = io.read()
    io.write("\n")

    while (fieldTipNumber ~= "0" and tonumber(fieldTipNumber) > #_CATEGORIES) do
       io.write("--> You can not choose a category that doesn't exist!\n")
       io.write("\tNOTE: You can always go back with 0.\n")
       io.write("> ")
       fieldTipNumber = io.read()
       io.write("\n")
    end

    if fieldTipNumber == "0" then
       return
    end
    
    io.write()
    io.write("Select the NUMBER of the FIELD you want to study: \n")
    printCategories()
    io.write("0. - Back -\n")

    io.write("> ")
    local fieldStudyNumber = io.read()
    io.write("\n")

    while (fieldStudyNumber ~= "0" and (tonumber(fieldStudyNumber) > #_CATEGORIES or fieldStudyNumber == fieldTipNumber)) do
       io.write("["..fieldStudyNumber.."] "..#_CATEGORIES.." ["..fieldTipNumber.."]\n")
       if fieldStudyNumber == fieldTipNumber then
           io.write("--> You can not choose the tip field as your study field!\n")
       elseif tonumber(fieldStudyNumber) > #_CATEGORIES then
           io.write("--> You can not choose a category that doesn't exist!\n")
       end
       io.write("\tNOTE: You can always go back with 0.\n")
       io.write("> ")
       fieldStudyNumber = io.read()
       io.write("\n")
    end

    if fieldStudyNumber == "0" then
       study()
       return
    end

    local fieldTip, fieldStudy

    fieldTipNumber = tonumber(fieldTipNumber)
    fieldStudyNumber = tonumber(fieldStudyNumber)
    fieldTip = _CATEGORIES[fieldTipNumber]
    fieldStudy = _CATEGORIES[fieldStudyNumber]

    io.write("You have chosen to study "..fieldStudy.." based on "..fieldTip..", let the Study Games begin and may the exams be ever in your favor.\n")
    io.write("\nNOTE: If a field has multiple values (a list of them), you will need to provide the same number of items before knowing if they're correct or not.\n")
    io.write("Also, because of programming reasons, you will have to provide them in the same order they appear in the data. (Sorry)\n")
    io.write("\nNOTE 2: You can always exit using 0.\n")

    study(fieldTip, fieldStudy)
end

function study(fieldTip, fieldStudy)
    local aux, tries, row, tip, guess

    while (guess ~= "0") do
        row = math.random(1, #_DATA) -- Select random row

        tip = ""
        if _DATA[row][fieldTip] ~= nil then
          for k = 1, #_DATA[row][fieldTip] do
              tip = tip.._DATA[row][fieldTip][k].." "   -- Get all values of the tip in a string
          end
          io.write("\n"..fieldTip..": "..tip.."\n")
  
          if #_DATA[row][fieldStudy] > 1 then
             guess = {}
  
             tries = 1
             while (aux ~= "0" and tries <= #_DATA[row][fieldStudy]) do
                io.write(fieldStudy.." "..tries.."? ")
                aux = io.read()
                table.insert(guess, aux)
                tries = tries + 1
             end
  
             io.write("\n")
  
             if aux ~= "0" then
               for i = 1, #_DATA[row][fieldStudy] do
                  io.write(i..". The correct answer was: ".._DATA[row][fieldStudy][i].."\n\tYour answer was: "..guess[i])
                  if string.lower(guess[i]) == string.lower(_DATA[row][fieldStudy][i]) then
                     io.write(" -> Correct!\n")
                  else
                     io.write(" -> Wrong!\n")
                  end
               end
             end
          else
             io.write(fieldStudy.."? ")
             guess = io.read()
             io.write("\n")
             if guess ~= "0" then
                if string.lower(guess) == string.lower(_DATA[row][fieldStudy][1]) then
                   io.write("Correct! Next.\n")
                else
                   io.write("Wrong answer. The correct answer was: ".._DATA[row][fieldStudy][1].."\n")
                end
             end
          end
       else
          io.write("--> Sorry. For some reason, studyApp is not loading line "..row.." of data.txt correctly. This is what is stored at said line:\n")
          io.write(printDataLine(row))
          io.write("Please, make sure there aren't any errors in the data.txt. If you are certain that data.txt is correct, please, contact me.\nNow, let's move to another one!\n")

       end
    end
end