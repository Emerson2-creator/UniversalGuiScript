local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/Emerson2-creator/Universal-GUI-Script/refs/heads/main/RealCode'))()

 --Settings GUI

local Window = Rayfield:CreateWindow({
    Name = "Universal GUI",
    Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
    LoadingTitle = "Universal Hub",
    LoadingSubtitle = "By BOITONETO",
    Theme = "DarkBlue", -- Check https://docs.sirius.menu/rayfield/configuration/themes
 
    DisableRayfieldPrompts = false,
    DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface
 
    ConfigurationSaving = {
       Enabled = false,
       FolderName = nil, -- Create a custom folder for your hub/game
       FileName = "Just Hub"
    },
 
    Discord = {
       Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
       Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
       RememberJoins = true -- Set this to false to make them join the discord every time they load it up
    },
 
    KeySystem = false, -- Set this to true to use our key system
    KeySettings = {
       Title = "Untitled",
       Subtitle = "Key System",
       Note = "No method of obtaining the key is provided", -- Use this to tell the user how to get a key
       FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
       SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
       GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
       Key = {"Hello"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
    }
 })

  --Tab

 local MainTab = Window:CreateTab("🏠Home", nil) -- Title, Image

 --Section

 local MainSection = MainTab:CreateSection("Basic Settings")

 Rayfield:Notify({
    Title = "You executed the script",
    Content = "Very good GUI",
    Duration = 4.5,
    Image = nil,
 })

 --Speed

 local Input = MainTab:CreateInput({
   Name = "WalkSpeed (Default is 16)",
   CurrentValue = "16",
   PlaceholderText = "Put the WalkSpeed",
   RemoveTextAfterFocusLost = false,
   Flag = "Input1",
   Callback = function(Text)
   game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = (Text)
   end,
})

   --Jump

local Input = MainTab:CreateInput({
   Name = "Jump power (Default is 50)",
   CurrentValue = "50",
   PlaceholderText = "Put the JumpPower",
   RemoveTextAfterFocusLost = false,
   Flag = "Input2",
   Callback = function(Text)
   game.Players.LocalPlayer.Character.Humanoid.JumpPower = (Text)
   end,
})

   --Gravity

local Input = MainTab:CreateInput({
   Name = "Gravity (Default is 196.2)",
   CurrentValue = "",
   PlaceholderText = "Put the gravity",
   RemoveTextAfterFocusLost = false,
   Flag = "Input3",
   Callback = function(Text)
   game.Workspace.Gravity = (Text)
   end,
})

   --No stun

local Input = MainTab:CreateInput({
   Name = "No Stun WalkSpeed (put -1 to decrease)",
   CurrentValue = "",
   PlaceholderText = "No Stun WalkSpeed",
   RemoveTextAfterFocusLost = false,
   Flag = "Input4",
   Callback = function(Text)

      function isNumber(str) if tonumber(str) ~= nil or str == 'inf' then return true end end local tspeed = (Text) local hb = game:GetService("RunService").Heartbeat local tpwalking = true local player = game:GetService("Players") local lplr = player.LocalPlayer local chr = lplr.Character local hum = chr and chr:FindFirstChildWhichIsA("Humanoid") while tpwalking and hb:Wait() and chr and hum and hum.Parent do if hum.MoveDirection.Magnitude > 0 then if tspeed and isNumber(tspeed) then chr:TranslateBy(hum.MoveDirection * tonumber(tspeed)) else chr:TranslateBy(hum.MoveDirection) end end end
   end,
})

   --Sit

local Button = MainTab:CreateButton({
   Name = "Sit Buttom",
   Callback = function()
   game.Players.LocalPlayer.Character.Humanoid.Sit = true
   end,
})

   --Noclip

   local player = game.Players.LocalPlayer
local noClipEnabled = false
local connections = {} -- Armazena as conexões para desligar depois

-- Função para ativar/desativar o noclip
local function toggleNoClip(state)
    noClipEnabled = state

    if noClipEnabled then
        -- Ativa o noclip, removendo colisão de todas as partes do personagem
        for _, part in pairs(player.Character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = false -- Desativa colisão
            end
        end

        -- Conexão para novos objetos que forem adicionados ao personagem
        local newPartConn = player.Character.DescendantAdded:Connect(function(part)
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end)
        table.insert(connections, {newPartConn})

    else
        -- Desativa o noclip, restaurando colisão nas partes do personagem
        for _, part in pairs(player.Character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = true -- Restaura a colisão
            end
        end

        -- Desconecta as funções para novos objetos
        for _, conn in pairs(connections) do
            conn[1]:Disconnect()
        end
        connections = {} -- Reseta a lista de conexões
    end
end

-- Toggle para ativar/desativar o Noclip
local Toggle = MainTab:CreateToggle({
    Name = "Noclip", -- Nome do Toggle
    CurrentValue = false, -- Valor inicial
    Flag = "ToggleNoclip", -- A flag é o identificador para o arquivo de configuração
    Callback = function(Value)
        toggleNoClip(Value) -- Chama a função de ativar/desativar Noclip
    end,
})

   

   --ESP

local player = game.Players.LocalPlayer
local espEnabled = false
local connections = {} -- Armazena as conexões para desligar depois

-- Função para criar ESP em um jogador
local function createESP(plr)
    if plr == player then return end -- Evita criar ESP em si mesmo

    local character = plr.Character or plr.CharacterAdded:Wait()
    local highlight = Instance.new("Highlight")
    highlight.Parent = character
    highlight.FillColor = Color3.fromRGB(255, 0, 0) -- Cor vermelha
    highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
    highlight.FillTransparency = 0.5
    highlight.OutlineTransparency = 0

    -- Guarda a conexão para remover depois
    local conn = plr.CharacterAdded:Connect(function(newChar)
        highlight.Parent = newChar
    end)
    table.insert(connections, {plr, highlight, conn})
end

-- Função para ativar/desativar ESP
local function toggleESP(state)
    espEnabled = state

    if espEnabled then
        -- Ativa o ESP para todos os jogadores
        for _, plr in pairs(game.Players:GetPlayers()) do
            createESP(plr)
        end

        -- Conexão para novos jogadores que entrarem no jogo
        local newPlayerConn = game.Players.PlayerAdded:Connect(function(plr)
            createESP(plr)
        end)
        table.insert(connections, {nil, nil, newPlayerConn})
    else
        -- Remove o ESP de todos os jogadores
        for _, data in pairs(connections) do
            if data[2] then data[2]:Destroy() end -- Remove Highlight
            if data[3] then data[3]:Disconnect() end -- Desconecta eventos
        end
        connections = {} -- Reseta a lista
    end
end

-- Toggle para ativar/desativar o ESP
local Toggle = MainTab:CreateToggle({
    Name = "ESP", -- Nome do Toggle
    CurrentValue = false, -- Valor inicial
    Flag = "Toggle2", -- A flag é o identificador para o arquivo de configuração
    Callback = function(Value)
        toggleESP(Value) -- Chama a função de ativar/desativar ESP
    end,
})

   --Xray

   local player = game.Players.LocalPlayer
local xrayEnabled = false
local connections = {} -- Armazena as conexões para desligar depois

-- Função para ativar/desativar o efeito Xray
local function toggleXray(state)
    xrayEnabled = state

    if xrayEnabled then
        -- Ativa o Xray para todos os objetos (exceto o personagem)
        for _, part in pairs(game.Workspace:GetDescendants()) do
            if part:IsA("BasePart") and part.Parent ~= player.Character then
                part.CanCollide = true -- Remove colisão para "ver" através de paredes
                part.Transparency = 0.5 -- Deixa os objetos parcialmente transparentes
            end
        end

        -- Conexão para novos objetos que forem adicionados ao jogo
        local newPartConn = game.Workspace.DescendantAdded:Connect(function(part)
            if part:IsA("BasePart") and part.Parent ~= player.Character then
                part.CanCollide = true
                part.Transparency = 0.5
            end
        end)
        table.insert(connections, {newPartConn})
    else
        -- Desativa o Xray, restaurando a transparência e colisão dos objetos
        for _, part in pairs(game.Workspace:GetDescendants()) do
            if part:IsA("BasePart") and part.Parent ~= player.Character then
                part.CanCollide = true
                part.Transparency = 0 -- Restaura a transparência original
            end
        end

        -- Desconecta a função de novos objetos
        for _, conn in pairs(connections) do
            conn[1]:Disconnect()
        end
        connections = {} -- Reseta a lista de conexões
    end
end

-- Toggle para ativar/desativar o Xray
local Toggle = MainTab:CreateToggle({
    Name = "Xray", -- Nome do Toggle
    CurrentValue = false, -- Valor inicial
    Flag = "ToggleXray", -- A flag é o identificador para o arquivo de configuração
    Callback = function(Value)
        toggleXray(Value) -- Chama a função de ativar/desativar Xray
    end,
})

   --Fly

   local Button = MainTab:CreateButton({
      Name = "Fly",
      Callback = function()

         loadstring(game:HttpGet("https://raw.githubusercontent.com/Emerson2-creator/Universal-GUI-Script/refs/heads/main/Fly%20Script%20GUI"))()
         
      end,
   })

   --Spin

   local spinSpeed = 50  -- Velocidade da rotação

-- Criação do toggle para ativar/desativar o Spin
local Toggle = MainTab:CreateToggle({
    Name = "Spin",  -- Nome do toggle
    CurrentValue = false,  -- Valor inicial (desligado)
    Flag = "SpinToggle",  -- Flag para configurar a persistência
    Callback = function(Value)
        local plr = game:GetService("Players").LocalPlayer
        repeat task.wait() until plr.Character
        local humRoot = plr.Character:WaitForChild("HumanoidRootPart")
        plr.Character:WaitForChild("Humanoid").AutoRotate = false

        if Value then
            -- Ativa a rotação
            local velocity = Instance.new("AngularVelocity")
            velocity.Attachment0 = humRoot:WaitForChild("RootAttachment")
            velocity.MaxTorque = math.huge
            velocity.AngularVelocity = Vector3.new(0, spinSpeed, 0)
            velocity.Parent = humRoot
            velocity.Name = "Spinbot"
        else
            -- Desativa a rotação
            for _, child in pairs(humRoot:GetChildren()) do
                if child.Name == "Spinbot" then
                    child:Destroy()
                end
            end
        end
    end
})


