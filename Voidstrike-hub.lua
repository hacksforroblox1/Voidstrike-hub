-- Rayfield GUI yükleme (GitHub üzerinden kendi repomdan çekiyoruz)
local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/hacksforroblox1/Voidstrike-hub/main/rayfield.lua'))()

local Window = Rayfield:CreateWindow({
   Name = "Voidstrike Hub | SLS",
   LoadingTitle = "Voidstrike Hub",
   LoadingSubtitle = "Super League Soccer Modülü",
   ConfigurationSaving = {
      Enabled = false
   },
   Discord = {
      Enabled = false
   },
   KeySystem = false
})

local MainTab = Window:CreateTab("⚽ SLS Hileleri", 4483362458)

-- Otomatik topa koş
MainTab:CreateToggle({
   Name = "🏃 Otomatik Topa Koş",
   CurrentValue = false,
   Callback = function(Value)
      if Value then
         _G.AutoChase = true
         spawn(function()
            while _G.AutoChase do
               task.wait(0.1)
               local ball = nil
               for _,v in pairs(workspace:GetDescendants()) do
                  if v.Name == "Ball" then
                     ball = v
                     break
                  end
               end
               if ball and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
                  game.Players.LocalPlayer.Character.Humanoid:MoveTo(ball.Position)
               end
            end
         end)
      else
         _G.AutoChase = false
      end
   end
})

-- Topu kendine ışınla
MainTab:CreateButton({
   Name = "🧲 Topu Kendine Çek",
   Callback = function()
      local ball = nil
      for _,v in pairs(workspace:GetDescendants()) do
         if v.Name == "Ball" then
            ball = v
            break
         end
      end
      if ball and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
         game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = ball.CFrame + Vector3.new(0, 2, 0)
      end
   end
})

-- Hız ayarı slider
MainTab:CreateSlider({
   Name = "⚡ Hız Ayarı",
   Range = {16, 150},
   Increment = 2,
   CurrentValue = 16,
   Callback = function(Value)
      if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
         game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
      end
   end
})

-- Server Rejoin butonu
MainTab:CreateButton({
   Name = "🔁 Server Rejoin",
   Callback = function()
      local TeleportService = game:GetService("TeleportService")
      local Players = game:GetService("Players")
      TeleportService:Teleport(game.PlaceId, Players.LocalPlayer)
   end
})

-- Anti Kick butonu
MainTab:CreateButton({
   Name = "🔒 Anti Kick",
   Callback = function()
      local mt = getrawmetatable(game)
      setreadonly(mt, false)
      local old = mt.__namecall
      mt.__namecall = newcclosure(function(self, ...)
         local method = getnamecallmethod()
         if method == "Kick" then
            return
         end
         return old(self, ...)
      end)
   end
})

Rayfield:Notify({
   Title = "Voidstrike Hub",
   Content = "SLS Modülü Aktif Edildi!",
   Duration = 6,
   Image = 4483362458
})
