--[[
random integer generator version 1.0
generates an integer between 1 and the maximum entered with no repetition.
requires enter between numbers as a break

- Keystroke Cascade

https://repl.it/@KeystrokeCascad/randintlua
]]

function Set (list)
  local set = {}
  for _, l in ipairs(list) do set[l] = true end
  return set
end

print("Uses a maximum value to generate a list \nof numbers between 1 and [maximum] with \nno repeating integers.\n")

failed = 0
while not tonumber(max) do
  if (failed > 0) then
    print("Invalid input.")
  end
  io.flush()
  print("Enter maximum value:")
  max = io.read()
  failed = failed + 1
end

print("\n")
max = tonumber(max)
math.randomseed(os.time())
count = max
local numbers = Set {}
while (count > 0) do
  num = math.random(max)
  if not numbers[num] then
    print(num)
    numbers[num] = true
    count = count - 1
    io.read()
  end
end
