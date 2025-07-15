--// Mustafa'nın Deluxe Ana Sayfa Hub'ı 😈

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Platform = tostring(UserSettings().GameSettings.TouchEnabled and "Mobile" or "PC")

-- Executor'a göre renk ayarı
local executor = identifyexecutor and identifyexecutor() or "Bilinmiyor"
local bgColor = Color3.fromRGB(20, 20, 20) -- varsayılan siyah

if executor:lower():find("krnl") then
    bgColor = Color3.fromRGB(0, 110, 255)
elseif executor:lower():find("delta") then
    bgColor = Color3.fromRGB(100, 100, 100)
end

-- GUI Elemanları
local gui = Instance.new("ScreenGui", game.CoreGui)
gui.Name = "MustafaHub"

local mainFrame = Instance.new("Frame", gui)
mainFrame.Size = UDim2.new(0, 400, 0, 250)
mainFrame.Position = UDim2.new(0.5, -200, 0.5, -125)
mainFrame.BackgroundColor3 = bgColor
mainFrame.BorderSizePixel = 0

-- Profil Fotoğrafı (sol üst)
local avatar = Instance.new("ImageLabel", mainFrame)
avatar.Size = UDim2.new(0, 80, 0, 80)
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Voidstrike Hub | Super League Soccer",
   LoadingTitle = "Voidstrike Hub",
   LoadingSubtitle = "SLS Module Active",
   ConfigurationSaving = {
      Enabled = false
   },
   Discord = {
      Enabled = false
   },
   KeySystem = false
})

local MainTab = Window:CreateTab("⚽ SLS Hileleri", 4483362458)

-- 🏃 Auto Ball Chase
MainTab:CreateToggle({
   Name = "🏃 Otomatik Topa Koş",
   CurrentValue = false,
   Callback = function(Value)
      if Value then
         _G.AutoChase = true
         while _G.AutoChase do
            task.wait()
            for _,v in pairs(workspace:GetDescendants()) do
               if v.Name == "Ball" then
                  game.Players.LocalPlayer.Character.Humanoid:MoveTo(v.Position)
               end
            end
         end
      else
         _G.AutoChase = false
      end
   end
})

-- 🧲 Topu Kendine Işınla
MainTab:CreateButton({
   Name = "🧲 Topu Kendine Çek",
   Callback = function()
      for _,v in pairs(workspace:GetDescendants()) do
         if v.Name == "Ball" then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame + Vector3.new(0, 2, 0)
         end
      end
   end
})

-- ⚡ Speed Boost
MainTab:CreateSlider({
   Name = "⚡ Hız Ayarı",
   Range = {16, 150},
   Increment = 2,
   CurrentValue = 16,
   Callback = function(Value)
      game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
   end
})

-- 🔁 Server Rejoin
MainTab:CreateButton({
   Name = "🔁 Server Rejoin",
   Callback = function()
      game:GetService("TeleportService"):Teleport(game.PlaceId, game.Players.LocalPlayer)
   end
})

-- 🔒 Anti-Kick
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
avatar.Position = UDim2.new(0, 10, 0, 10)
avatar.BackgroundTransparency = 1
avatar.Image = Players:GetUserThumbnailAsync(LocalPlayer.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size100x100)

-- Başlık
local title = Instance.new("TextLabel", mainFrame)
title.Size = UDim2.new(1, -20, 0, 30)
title.Position = UDim2.new(0, 90, 0, 15)
title.BackgroundTransparency = 1
title.Text = "Mustafa'nın Hub'ı"
title.Font = Enum.Font.GothamBold
title.TextSize = 22
title.TextColor3 = Color3.new(1, 1, 1)
title.TextXAlignment = Enum.TextXAlignment.Left

-- Bilgi Yazıları
local info = Instance.new("TextLabel", mainFrame)
info.Size = UDim2.new(1, -20, 0, 100)
info.Position = UDim2.new(0, 10, 0, 100)
info.BackgroundTransparency = 1
info.Font = Enum.Font.Gotham
info.TextSize = 18
info.TextColor3 = Color3.new(1, 1, 1)
info.TextXAlignment = Enum.TextXAlignment.Left
info.TextYAlignment = Enum.TextYAlignment.Top

-- Ülke belirleme
local locale = game:GetService("LocalizationService").RobloxLocaleId or "unknown"
local country = locale:sub(-2):upper()

info.Text = "🌍 Ülke: " .. country ..
    "\n💻 Executor: " .. executor ..
    "\n📱 Platform: " .. Platform
