-- Voidstrike Hub v1.0 - Tam GUI Script (Rayfield ile)

-- 1) Rayfield GUI yükle
local Rayfield = loadstring(game:HttpGet("https://raw.githubusercontent.com/voiddevprojects/gui-frameworks/main/rayfield-clean.lua"))()

-- 2) Ana pencere oluştur
local Window = Rayfield:CreateWindow({
    Name = "⚔️ Voidstrike Hub",
    LoadingTitle = "Voidstrike Hub",
    LoadingSubtitle = "v1.0 - Oyun Hileleri",
    ConfigurationSaving = { Enabled = false },
    Discord = { Enabled = false },
    KeySystem = false
})

-- 3) Ana Menü Tabı
local MainTab = Window:CreateTab("Ana Menü", 4483362458)

MainTab:CreateLabel("Voidstrike Hub'a hoşgeldin!")

-- 4) Oyun Seçimi Tabları için placeholder
local SLSTab = Window:CreateTab("⚽ Super League Soccer", 4483362458)
local MM2Tab = Window:CreateTab("🔪 Murder Mystery 2", 4483362458)

-- 5) SLS için örnek butonlar

SLSTab:CreateButton({
    Name = "Topu Kendine Çek",
    Callback = function()
        local ball = workspace:FindFirstChild("Ball")
        local char = game.Players.LocalPlayer.Character
        if ball and char and char:FindFirstChild("HumanoidRootPart") then
            char.HumanoidRootPart.CFrame = ball.CFrame + Vector3.new(0,1,0)
        end
    end
})

SLSTab:CreateToggle({
    Name = "Otomatik Gol",
    CurrentValue = false,
    Callback = function(state)
        _G.autoGoal = state
        if state then
            spawn(function()
                while _G.autoGoal do
                    task.wait(0.5)
                    local ball = workspace:FindFirstChild("Ball")
                    local char = game.Players.LocalPlayer.Character
                    local goal = workspace:FindFirstChild("Goal")
                    if ball and char and char:FindFirstChild
