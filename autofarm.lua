--Moonsec is terrible
local Player = game.Players.LocalPlayer
local TS = game:GetService("TweenService")

while getgenv().BAutoFarmEnabled do
    task.wait()
    
    if not getgenv().BCharacter or getgenv().BToggled then
        continue
    end

    pcall(function()
    
        if not getgenv().BCharacter:FindFirstChild("HumanoidRootPart") then
            getgenv().BWaitForObject(getgenv().BCharacter, "HumanoidRootPart")
        end
        
        for _,v in pairs(workspace.Live:GetChildren()) do
            if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChildOfClass("Humanoid") and (v.Name:lower():match(getgenv().BNPCS[1]:lower()) or v.Name:lower():match(getgenv().BNPCS[2]:lower()) or v.Name:lower():match(getgenv().BNPCS[3]:lower()) or v.Name:lower():match(getgenv().BNPCS[4]:lower())) then
                if (getgenv().BNPCsMode and not v:FindFirstChild("Damagers")) or v.Humanoid.Health == 0 then
                    continue
                end
        
                local Target = v
        
                repeat
                    task.wait()
                    if not Target:FindFirstChild("HumanoidRootPart") or not getgenv().BAutoFarmEnabled or not Target:FindFirstChildOfClass("Humanoid") or (getgenv().BNPCsMode and not v:FindFirstChild("Damagers")) or getgenv().BToggled then
                        break
                    end

                    workspace.CurrentCamera.CFrame = CFrame.new(Player.Character.HumanoidRootPart.Position,Vector3.new(v.HumanoidRootPart.Position.X,Player.Character.HumanoidRootPart.Position.Y,v.HumanoidRootPart.Position.Z)) * CFrame.new(0,2,10)
                    local Distance = (Player.Character.HumanoidRootPart.Position - Target.HumanoidRootPart.Position).magnitude / 10000
                    TS:Create(Player.Character.HumanoidRootPart,TweenInfo.new(Distance,Enum.EasingStyle.Linear,Enum.EasingDirection.In,0,false,0),{CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0,0, getgenv().autoFarmDistance)}):Play()
                until Target.Humanoid.Health == 0
            end
        end
    end)
end
