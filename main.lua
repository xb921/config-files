function Wait(n)
  os.execute("sleep " .. n)
end

function Bootloader()
  os.execute("clear")
  System()
end


function System()
  local isroot = false
  local prompt = "noroot@luaOS "
  ::goto1::
  io.write(prompt)
  local mainPromptRead = io.read()
  if mainPromptRead == "root" then
    ::rootPromtStart::
    io.write("input password: ")
    local rootPrompt = io.read()
    if rootPrompt == "666" then
      prompt = "root@luaOS "
      isroot = true
      goto goto1
      else
        print("Wrong password. Please try again.")
        goto rootPromtStart
    end
  elseif mainPromptRead == "clear" then
    os.execute("clear")
    goto goto1
  elseif mainPromptRead == "exit" then
    return
  elseif mainPromptRead == "keyctl" then
    local keyctlPrompt = "[keyctl]# "
    if isroot ~= false then
      io.write(keyctlPrompt)
      KeyctlInput = io.read()
      if keyctlPrompt ~= nil then
        goto goto1
      end
    else
      print("This command can not be used unless you are root.")
      goto goto1
    end
  elseif mainPromptRead == "ls keys" then
    if KeyctlInput ~= nil then
      print(KeyctlInput)
      goto goto1
    else
      print("no keys")
      goto goto1
    end
  else
    print("luaOS: " .. mainPromptRead .. " Is not a command")
    goto goto1
  end
end

Bootloader()
