local Rayfield = loadstring(game:HttpGet("https://raw.githubusercontent.com/voiddevprojects/gui-frameworks/main/rayfield-clean.lua"))()

local Window = Rayfield:CreateWindow({
   Name = "⚔️ Voidstrike Hub | Super League Soccer",
   LoadingTitle = "Voidstrike Hub",
   LoadingSubtitle = "v1.0 - SLS",
   ConfigurationSaving = {
      Enabled = false
   },
   Discord = {
      Enabled = false
   },
   KeySystem = false
})

local Tab = Window:CreateTab("⚽ SLS Hileleri", 4483362458)

Tab:CreateButton({
   Name = "🧲 Topu Kendine Çek",
   Callback = function()
      for _,v in pairs(workspace:GetDescendants()) do
         if v.Name == "Ball" then
            local char = game.Players.LocalPlayer.Character
            if char and char:FindFirstChild("HumanoidRootPart") then
               char.HumanoidRootPart.CFrame = v.CFrame + Vector3.new(0, 1, 0)
            end
         end
      end
   end
})

Tab:CreateToggle({
   Name = "⚽ Otomatik Gol",
   CurrentValue = false,
   Callback = function(state)
      _G.autoGoal = state
      while _G.autoGoal do
         task.wait(0.5)
         for _,v in pairs(workspace:GetDescendants()) do
            if v.Name == "Ball" then
               local char = game.Players.LocalPlayer.Character
               if char and char:FindFirstChild("HumanoidRootPart") then
                  char.HumanoidRootPart.CFrame = v.CFrame + Vector3.new(0, 1, 0)
                  task.wait(0.2)
                  local goal = workspace:FindFirstChild("Goal")
                  if goal then
                     char.HumanoidRootPart.CFrame = goal.CFrame + Vector3.new(0, 1, 0)
                  end
               end
            end
         end
      end
   end
})

Tab:CreateButton({
   Name = "🔁 Server Rejoin",
   Callback = function()
      game:GetService("TeleportService"):Teleport(game.PlaceId, game.Players.LocalPlayer)
   end
})

Rayfield:Notify({
   Title = "Voidstrike Hub",
   Content = "SLS GUI yüklendi!",
   Duration = 6,
   Image = 4483362458
})
