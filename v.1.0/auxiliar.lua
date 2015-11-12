
-- STRING AUX ---

function split(s, token)
   -- Returns array with substrings of s contained between tokens
   local result = {}
   local aux, pointer, lastPointer

   aux = s
   pointer = string.find(aux, token)

   while(pointer ~= nil) do
      table.insert(result, string.sub(aux, 1, pointer-1))
      aux = string.sub(aux, pointer+1, #aux)
      lastPointer = pointer
      pointer = string.find(aux, token)
   end

   if lastPointer ~= nil and lastPointer < #s then
      table.insert(result, aux)
   end

   return result
end