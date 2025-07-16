-- TEST GUI (Rayfield + KRNL + Telefon %100 UYUMLU)
local Rayfield = loadstring(game:HttpGet("https://raw.githubusercontent.com/voiddevprojects/gui-frameworks/main/rayfield-clean.lua"))()

local Window = Rayfield:CreateWindow({
    Name = "🔥 Voidstrike GUI Test",
    LoadingTitle = "Yükleniyor...",
    LoadingSubtitle = "Bekle gardaş...",
    ConfigurationSaving = {Enabled = false},
    Discord = {Enabled = false},
    KeySystem = false
})

local MainTab = Window:CreateTab("🧪 Test Tab", 4483362458)

MainTab:CreateLabel("Rayfield GUI yüklendi!")

MainTab:CreateButton({
    Name = "GUI Kontrol",
    Callback = function()
        Rayfield:Notify({
            Title = "ÇALIŞIYOR!",
            Content = "Butona bastın gardaş 😎",
            Duration = 4
        })
    end
})
