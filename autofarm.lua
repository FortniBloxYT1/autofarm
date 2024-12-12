task.wait()

if not Character or Toggled then
    continue
end

if not Character:FindFirstChild("HumanoidRootPart") then
    WaitForObject(Character, "HumanoidRootPart")
end

for _,v in pairs(workspace.Live:GetChildren()) do
    if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChildOfClass("Humanoid") and (v.Name:lower():match(NPCS[1]:lower()) or v.Name:lower():match(NPCS[2]:lower()) or v.Name:lower():match(NPCS[3]:lower()) or v.Name:lower():match(NPCS[4]:lower())) then
        if (NPCsMode and not v:FindFirstChild("Damagers")) or v.Humanoid.Health == 0 then
            continue
        end

        local Target = v

        repeat
            task.wait()
            if not Target:FindFirstChild("HumanoidRootPart") or not AutoFarm.Value or not Target:FindFirstChildOfClass("Humanoid") or Toggled then
                break
            end

            workspace.CurrentCamera.CFrame = CFrame.new(Player.Character.HumanoidRootPart.Position,Vector3.new(v.HumanoidRootPart.Position.X,Player.Character.HumanoidRootPart.Position.Y,v.HumanoidRootPart.Position.Z)) * CFrame.new(0,2,10)
            local Distance = (Player.Character.HumanoidRootPart.Position - Target.HumanoidRootPart.Position).magnitude / 10000
            TS:Create(Player.Character.HumanoidRootPart,TweenInfo.new(Distance,Enum.EasingStyle.Linear,Enum.EasingDirection.In,0,false,0),{CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0,0, AutoFarmDistance)}):Play()
        until Target.Humanoid.Health == 0
    end
end