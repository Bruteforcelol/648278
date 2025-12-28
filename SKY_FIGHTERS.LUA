do
    local function _c(t)local s=""for i=1,#t do s=s..string.char(t[i])end return s end
    local _k={78,79,84,84,84,72,85,66,45,83,75,45,49,50,53,53,65}
    local _d={84,104,101,32,107,101,121,32,105,115,32,112,114,111,118,105,100,101,100,32,105,110,32,111,117,114,32,68,105,115,99,111,114,100,32,115,101,114,118,101,114,46,32,74,111,105,110,32,116,111,32,103,101,116,32,116,104,101,32,107,101,121}
    local _u={104,116,116,112,115,58,47,47,114,97,119,46,103,105,116,104,117,98,117,115,101,114,99,111,110,116,101,110,116,46,99,111,109,47,108,105,103,104,116,121,109,121,115,116,101,114,105,111,117,115,45,111,115,115,47,68,65,72,69,78,45,72,85,66,47,114,101,102,115,47,104,101,97,100,115,47,109,97,105,110,47,83,107,121,37,50,48,70,105,103,104,116,101,114,115,46,108,117,97}
    local _dc={104,116,116,112,115,58,47,47,100,105,115,99,111,114,100,46,103,103,47,119,70,51,100,81,77,81,99}

    local p=game:GetService("Players").LocalPlayer
    local uis=game:GetService("UserInputService")

    local g=Instance.new("ScreenGui")
    g.ResetOnSpawn=false
    g.Parent=p:WaitForChild("PlayerGui")

    local m=Instance.new("Frame",g)
    m.Size=UDim2.new(0,560,0,360)
    m.Position=UDim2.new(0.5,-280,0.5,-180)
    m.BackgroundColor3=Color3.fromRGB(18,18,18)
    m.BorderSizePixel=0
    Instance.new("UICorner",m).CornerRadius=UDim.new(0,14)

    local top=Instance.new("Frame",m)
    top.Size=UDim2.new(1,0,0,55)
    top.BackgroundColor3=Color3.fromRGB(25,25,25)
    top.BorderSizePixel=0
    Instance.new("UICorner",top).CornerRadius=UDim.new(0,14)

    local title=Instance.new("TextLabel",top)
    title.Size=UDim2.new(1,-50,1,0)
    title.Position=UDim2.new(0,20,0,0)
    title.BackgroundTransparency=1
    title.Text="NotHub Key System"
    title.Font=Enum.Font.GothamBold
    title.TextSize=24
    title.TextColor3=Color3.fromRGB(255,255,255)
    title.TextXAlignment=Enum.TextXAlignment.Left

    local close=Instance.new("TextButton",top)
    close.Size=UDim2.new(0,40,0,40)
    close.Position=UDim2.new(1,-45,0.5,-20)
    close.BackgroundColor3=Color3.fromRGB(40,40,40)
    close.Text="X"
    close.Font=Enum.Font.GothamBold
    close.TextSize=18
    close.TextColor3=Color3.fromRGB(255,80,80)
    Instance.new("UICorner",close).CornerRadius=UDim.new(0,8)

    local desc=Instance.new("TextLabel",m)
    desc.Position=UDim2.new(0,35,0,85)
    desc.Size=UDim2.new(1,-70,0,60)
    desc.BackgroundTransparency=1
    desc.TextWrapped=true
    desc.Text=_c(_d)
    desc.Font=Enum.Font.Gotham
    desc.TextSize=17
    desc.TextColor3=Color3.fromRGB(190,190,190)

    local box=Instance.new("TextBox",m)
    box.Position=UDim2.new(0,35,0,165)
    box.Size=UDim2.new(1,-70,0,55)
    box.BackgroundColor3=Color3.fromRGB(30,30,30)
    box.PlaceholderText="Enter your key"
    box.Font=Enum.Font.Gotham
    box.TextSize=18
    box.TextColor3=Color3.fromRGB(255,255,255)
    box.ClearTextOnFocus=false
    Instance.new("UICorner",box).CornerRadius=UDim.new(0,10)

    local btn=Instance.new("TextButton",m)
    btn.Position=UDim2.new(0,35,0,240)
    btn.Size=UDim2.new(1,-70,0,55)
    btn.BackgroundColor3=Color3.fromRGB(45,120,255)
    btn.Text="Submit Key"
    btn.Font=Enum.Font.GothamBold
    btn.TextSize=18
    btn.TextColor3=Color3.fromRGB(255,255,255)
    Instance.new("UICorner",btn).CornerRadius=UDim.new(0,10)

    local drag=false
    local dragStart, startPos

    top.InputBegan:Connect(function(i)
        if i.UserInputType==Enum.UserInputType.MouseButton1 then
            drag=true
            dragStart=i.Position
            startPos=m.Position
        end
    end)

    top.InputEnded:Connect(function(i)
        if i.UserInputType==Enum.UserInputType.MouseButton1 then
            drag=false
        end
    end)

    uis.InputChanged:Connect(function(i)
        if drag and i.UserInputType==Enum.UserInputType.MouseMovement then
            local delta=i.Position-dragStart
            m.Position=UDim2.new(startPos.X.Scale,startPos.X.Offset+delta.X,startPos.Y.Scale,startPos.Y.Offset+delta.Y)
        end
    end)

    close.MouseButton1Click:Connect(function()
        g:Destroy()
    end)

    btn.MouseButton1Click:Connect(function()
        if box.Text==_c(_k) then
            g:Destroy()
            loadstring(game:HttpGet(_c(_u)))()
        else
            btn.Text="Invalid Key"
            task.wait(1)
            btn.Text="Submit Key"
        end
    end)

    pcall(function()
        if setclipboard then
            setclipboard(_c(_dc))
        end
    end)
end
