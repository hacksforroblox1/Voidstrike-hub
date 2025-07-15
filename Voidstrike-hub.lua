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
