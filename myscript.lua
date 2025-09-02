--// Key System + GUI หลัก
local ScreenGui = Instance.new("ScreenGui")
local KeyFrame = Instance.new("Frame")
local KeyCorner = Instance.new("UICorner")
local KeyBox = Instance.new("TextBox")
local KeyButton = Instance.new("TextButton")
local KeyTitle = Instance.new("TextLabel")

local MainFrame = Instance.new("Frame")
local MainCorner = Instance.new("UICorner")
local Title = Instance.new("TextLabel")
local Button = Instance.new("TextButton")
local ButtonCorner = Instance.new("UICorner")
local MinimizeButton = Instance.new("TextButton")
local MinimizeCorner = Instance.new("UICorner")

local MiniFrame = Instance.new("Frame")
local MiniCorner = Instance.new("UICorner")
local MiniIcon = Instance.new("ImageButton")

-- GUI เข้าเกม
ScreenGui.Parent = game:GetService("CoreGui")

-- Key Frame
KeyFrame.Parent = ScreenGui
KeyFrame.Size = UDim2.new(0, 250, 0, 150)
KeyFrame.Position = UDim2.new(0.5, -125, 0.5, -75)
KeyFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
KeyCorner.Parent = KeyFrame

KeyTitle.Parent = KeyFrame
KeyTitle.Size = UDim2.new(1, 0, 0, 30)
KeyTitle.BackgroundTransparency = 1
KeyTitle.Text = "🔑 Enter Key to Continue"
KeyTitle.Font = Enum.Font.GothamBold
KeyTitle.TextSize = 16
KeyTitle.TextColor3 = Color3.fromRGB(0, 200, 255)

KeyBox.Parent = KeyFrame
KeyBox.Size = UDim2.new(0, 200, 0, 35)
KeyBox.Position = UDim2.new(0.5, -100, 0.4, 0)
KeyBox.PlaceholderText = "Enter Key..."
KeyBox.Text = ""
KeyBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
KeyBox.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyBox.Font = Enum.Font.Gotham
KeyBox.TextSize = 14

KeyButton.Parent = KeyFrame
KeyButton.Size = UDim2.new(0, 200, 0, 35)
KeyButton.Position = UDim2.new(0.5, -100, 0.7, 0)
KeyButton.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
KeyButton.Text = "Unlock"
KeyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyButton.Font = Enum.Font.GothamBold
KeyButton.TextSize = 16

-- Main GUI (ซ่อนก่อน)
MainFrame.Parent = ScreenGui
MainFrame.Size = UDim2.new(0, 220, 0, 120)
MainFrame.Position = UDim2.new(0.5, -110, 0.5, -60)
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
MainFrame.Visible = false
MainCorner.Parent = MainFrame

Title.Parent = MainFrame
Title.Size = UDim2.new(1, 0, 0, 30)
Title.BackgroundTransparency = 1
Title.Text = "⚡ MOMOMi GUI ⚡"
Title.Font = Enum.Font.GothamBold
Title.TextSize = 16
Title.TextColor3 = Color3.fromRGB(0, 200, 255)

Button.Parent = MainFrame
Button.Size = UDim2.new(0, 180, 0, 40)
Button.Position = UDim2.new(0.5, -90, 0.6, 0)
Button.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
Button.Text = "Start"
Button.TextColor3 = Color3.fromRGB(255, 255, 255)
Button.Font = Enum.Font.GothamBold
Button.TextSize = 16
ButtonCorner.Parent = Button

MinimizeButton.Parent = MainFrame
MinimizeButton.Size = UDim2.new(0, 25, 0, 25)
MinimizeButton.Position = UDim2.new(1, -30, 0, 5)
MinimizeButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
MinimizeButton.Text = "-"
MinimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
MinimizeButton.Font = Enum.Font.GothamBold
MinimizeButton.TextSize = 18
MinimizeCorner.Parent = MinimizeButton

-- Mini Frame (ตอนย่อ)
MiniFrame.Parent = ScreenGui
MiniFrame.Size = UDim2.new(0, 50, 0, 50)
MiniFrame.Position = UDim2.new(0.5, -25, 0.5, -25)
MiniFrame.BackgroundTransparency = 1
MiniFrame.Visible = false
MiniCorner.Parent = MiniFrame

MiniIcon.Parent = MiniFrame
MiniIcon.Size = UDim2.new(1, 0, 1, 0)
MiniIcon.BackgroundTransparency = 1
MiniIcon.Image = "https://sv1.img.in.th/7yKRkf.png"

-- ตรวจสอบ Key
KeyButton.MouseButton1Click:Connect(function()
    if KeyBox.Text == "MOMO" then
        KeyFrame.Visible = false
        MainFrame.Visible = true
    else
        KeyBox.Text = ""
        KeyBox.PlaceholderText = "❌ Wrong Key!"
        KeyBox.PlaceholderColor3 = Color3.fromRGB(255, 50, 50)
    end
end)

-- ปุ่มหลักทำงาน
Button.MouseButton1Click:Connect(function()
    local args = {"BaseWorld","Base_DinoWorld"}
    game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("SettingRE"):FireServer(unpack(args))
    Button.Text = "✔ Tidy!"
    Button.BackgroundColor3 = Color3.fromRGB(0, 200, 100)
    task.wait(2)
    Button.Text = "Start"
    Button.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
end)

-- ปุ่มย่อ/ขยาย
MinimizeButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
    MiniFrame.Visible = true
end)

MiniIcon.MouseButton1Click:Connect(function()
    MainFrame.Visible = true
    MiniFrame.Visible = false
end)