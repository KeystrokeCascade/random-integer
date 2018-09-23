space = 16
screen = platform.window
w = screen:width()
input = ""
err = false

function Set (list)
  local set = {}
  for _, l in ipairs(list) do set[l] = true end
  return set
end

function menu_txt()
    function on.paint(gc)
        menu1 = "Uses a maximum value to generate a list"
        menu2 = "of numbers between 1 and [maximum]"
        menu3 = "with no repeating integers"
        menu4 = "Enter maximum value> "..input
        gc:setFont("sansserif", "r", 12)
        if (err == true) then
            menu1 = "That is not a valid integer"
            menu2 = "please try again"
            menu3 = ""
        end
        local sw1 = gc:getStringWidth(menu1)
        local sw2 = gc:getStringWidth(menu2)
        local sw3 = gc:getStringWidth(menu3)
        local sw4 = gc:getStringWidth(menu4)
        gc:drawString(menu1, w/2 - sw1/2,10+(space*0))
        gc:drawString(menu2, w/2 - sw2/2,10+(space*1))
        gc:drawString(menu3, w/2 - sw3/2,10+(space*2))
        gc:drawString(menu4, w/2 - sw4/2,10+(space*4))
    end
    screen:invalidate()
end

function random()
    function on.charIn()
    end
    function on.backspaceKey()
    end

    max = tonumber(input)
    count = max
    numbers = Set {}
    
    num = math.random(max)
        function on.paint(gc)
            gc:setFont("sansserif", "r", 40)
            local sw1 = gc:getStringWidth(num)
            gc:drawString(num, w/2 - sw1/2,10+(space*4))
        end
        screen:invalidate()
        numbers[num] = true
        count = count - 1
    
    function on.enterKey()
        if (count > 0) then
            num_done = false
            while (num_done == false) do
                num = math.random(max)
                if not numbers[num] then
                    
                    numbers[num] = true
                    count = count - 1
                    num_done = true
                end
            end
            function on.paint(gc)
                gc:setFont("sansserif", "r", 40)
                local sw1 = gc:getStringWidth(num)
                gc:drawString(num, w/2 - sw1/2,10+(space*4))
            end
            screen:invalidate()
        else
            function on.paint(gc)
                function on.enterKey()
                end
                local end1 = "End"
                local end2 = "Press \"esc\" to reset"
                gc:setFont("sansserif", "r", 40)
                local sw1 = gc:getStringWidth(end1)
                gc:drawString(end1, w/2 - sw1/2,10+(space*4))
                gc:setFont("sansserif", "r", 12)
                local sw2 = gc:getStringWidth(end2)
                gc:drawString(end2, w/2 - sw2/2,10+(space*7))
            end
            screen:invalidate()
        end
    end
end

function menu()
    menu_txt()
    
    function on.charIn(char)
        if (string.len(input) < 4) then
            input = input..char
        end
        screen:invalidate()
        menu_txt()
    end
    
    function on.backspaceKey()
        input = input:usub(0,-2)
        screen:invalidate()
    end
    
    function on.enterKey()
        if not tonumber(input) or tonumber(input) < 1 then
            err = true
            input = ""
            screen:invalidate()
            return
        else
            err = false
            random()
        end
        input = ""
    end
end

function on.escapeKey()
    input = ""
    err = false
    max = ""
    count = ""
    numbers = ""
    num =  ""
    menu()
end

menu()