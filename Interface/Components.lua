-------------------------------------------------------------------------------
-- Interface Addon GUI Window {{{
-------------------------------------------------------------------------------

function MBC:CreateOptionsWindow(aName)

    local OptionsFrame = CreateFrame("Frame", nil, InterfaceOptionsFramePanelContainer)
    OptionsFrame.name = aName -- Do not change .name here
    InterfaceOptions_AddCategory(OptionsFrame)

    local Title = OptionsFrame:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    Title:SetText(MBC:ApplyTextColor(aName, MBC.COLORS.Title))
    Title:SetPoint("TOPLEFT", 16, -16)
    MBC:ApplyCustomFont(Title, 20)

    OptionsFrame.Title = Title
    return OptionsFrame
end

-------------------------------------------------------------------------------
-- Buttons {{{
-------------------------------------------------------------------------------

function MBC:CreateToggleButton(Parent, Title, IsActive, XAsis)
    if not Parent or not Title then return end

    IsActive = IsActive or false
    XAsis = XAsis or -48.5

    local ToggleButton = CreateFrame("Button", nil, Parent, "UIPanelButtonTemplate")
    ToggleButton:SetSize(120, 30)
    ToggleButton:SetText(Title)
    ToggleButton:SetPoint("CENTER", Parent, "TOP", XAsis, -55)

    local function UpdateButtonAppearance()
        local TextColor = IsActive and {1, 0.82, 0} or {0.5, 0.5, 0.5}
        ToggleButton:SetNormalTexture(IsActive and "Interface\\Buttons\\UI-Panel-Button-Up" or "Interface\\Buttons\\UI-Panel-Button-Disabled")
        ToggleButton:GetFontString():SetTextColor(unpack(TextColor))
    end

    ToggleButton:SetScript("OnEnter", function() 
        ToggleButton:GetFontString():SetTextColor(1, 0.82, 0) 
    end)

    ToggleButton:SetScript("OnLeave", function() UpdateButtonAppearance() end)

    UpdateButtonAppearance()

    return ToggleButton, function(isActive) 
        IsActive = isActive
        UpdateButtonAppearance() 
    end
end

function MBC:CreateButton(Parent, Width, Height, Label)
    if not Parent or not Label then return end

    local Button = CreateFrame("Button", nil, Parent)
    Button:SetSize(Width, Height)
    Button:SetBackdrop(MBC.BACKDROPS.Basic)
    Button:SetBackdropColor(unpack(MBC.COLORS.Background))
    MBC:ApplyHoverEffect(Button, MBC.COLORS.Background, MBC.COLORS.HoverBackground)

    local ButtonText = Button:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    ButtonText:SetPoint("CENTER", Button, "CENTER", 0, 0)
    ButtonText:SetTextColor(unpack(MBC.COLORS.TextLight))
    ButtonText:SetFont(MBC:GetFont("MoronFont.ttf"), 15)
    ButtonText:SetText(Label)

    Button.Text = ButtonText
    return Button
end

function MBC:ApplyHoverEffect(Frame, NormalColor, HoverColor)

    local HighlightOverlay = Frame:CreateTexture(nil, "OVERLAY")
    HighlightOverlay:SetAllPoints(Frame)
    HighlightOverlay:SetTexture("Interface\\AddOns\\MoronBoxCore\\Textures\\Highlight.tga")
    HighlightOverlay:SetVertexColor(1, 1, 1, 0.1)
    HighlightOverlay:Hide()

    Frame:SetScript("OnEnter", function(self)
        self:SetBackdropColor(unpack(HoverColor))
        HighlightOverlay:Show()
    end)

    Frame:SetScript("OnLeave", function(self)
        self:SetBackdropColor(unpack(NormalColor))
        HighlightOverlay:Hide()
    end)
end

function MBC:CloseButton(Parent, Width, Height)
    if not Parent then return end

    Width = Width or 16
    Height = Height or 16

    local CloseButton = CreateFrame("Button", nil, Parent)
    CloseButton:SetSize(Width, Height)
    CloseButton:SetNormalTexture("Interface\\AddOns\\MoronBoxCore\\Media\\Icons\\Close.tga")
    CloseButton:SetPushedTexture("Interface\\AddOns\\MoronBoxCore\\Media\\Icons\\Close.tga")
    CloseButton:SetPoint("TOPRIGHT", Parent, "TOPRIGHT", -Width / 2, -Height / 2)

    CloseButton:GetNormalTexture():SetVertexColor(unpack(MBC.COLORS.CloseButtonNormal))
    CloseButton:GetPushedTexture():SetVertexColor(unpack(MBC.COLORS.CloseButtonHover))

    CloseButton:SetScript("OnEnter", function(self)
        self:GetNormalTexture():SetVertexColor(unpack(MBC.COLORS.CloseButtonHover))
    end)

    CloseButton:SetScript("OnLeave", function(self)
        self:GetNormalTexture():SetVertexColor(unpack(MBC.COLORS.CloseButtonNormal))
    end)

    return CloseButton
end

function MBC:ReturnButton(Parent, Width, Height)
    if not Parent then return end

    Width = Width or 16
    Height = Height or 16

    local ReturnButton = CreateFrame("Button", nil, Parent)
    ReturnButton:SetSize(Width, Height)
    ReturnButton:SetNormalTexture("Interface\\AddOns\\MoronBoxCore\\Media\\Icons\\Return.tga")
    ReturnButton:SetPushedTexture("Interface\\AddOns\\MoronBoxCore\\Media\\Icons\\Return.tga")
    ReturnButton:SetPoint("TOPLEFT", Parent, "TOPLEFT", Width / 2, -Height / 2)

    ReturnButton:GetNormalTexture():SetVertexColor(unpack(MBC.COLORS.ReturnButtonNormal))
    ReturnButton:GetPushedTexture():SetVertexColor(unpack(MBC.COLORS.ReturnButtonHover))

    ReturnButton:SetScript("OnEnter", function(self)
        self:GetNormalTexture():SetVertexColor(unpack(MBC.COLORS.ReturnButtonHover))
    end)

    ReturnButton:SetScript("OnLeave", function(self)
        self:GetNormalTexture():SetVertexColor(unpack(MBC.COLORS.ReturnButtonNormal))
    end)

    return ReturnButton
end

-------------------------------------------------------------------------------
-- CheckBox {{{
-------------------------------------------------------------------------------

function MBC:CreateCheckButton(Parent, Title, Value, XAsis)
    if not Parent or not Title then return end

    Value = Value or false
    XAsis = XAsis or -48.5

    local CheckButton = CreateFrame("CheckButton", nil, Parent, "OptionsCheckButtonTemplate")
    CheckButton:SetChecked(Value)

    local CheckButtonText = CheckButton:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    CheckButtonText:SetText(Title)
    CheckButtonText:SetPoint("RIGHT", CheckButton, "LEFT", XAsis, 0)

    CheckButton.CheckButtonText = CheckButtonText
    return CheckButton
end

-------------------------------------------------------------------------------
-- Frame {{{
-------------------------------------------------------------------------------

function MBC:CreateFrame(Parent, Backdrop, Width, Height)
    if not Parent or not Backdrop then return end

    Width = Width or 500
    Height = Height or 400

    local NewFrame = CreateFrame("Frame", nil, Parent)
    NewFrame:SetPoint("CENTER", UIParent, "CENTER")
    NewFrame:SetSize(Width, Height)
    NewFrame:SetBackdrop(Backdrop)

    return NewFrame
end

function MBC:CreateAddonGroupText(Parent)

    local GroupText = Parent:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    GroupText:SetPoint("CENTER", Parent, "BOTTOM", 0, 20)
    GroupText:SetJustifyH("CENTER")
    GroupText:SetText(
        MBC:ApplyTextColor("This addon is part of the ", MBC.COLORS.Text) ..
        MBC:ApplyTextColor("MoronBox", MBC.COLORS.Highlight) ..
        MBC:ApplyTextColor(" addon group!", MBC.COLORS.Text)
    )

    MBC:ApplyCustomFont(GroupText, 12)
    
    return GroupText
end

function MBC:MakeMoveable(Frame)
    if not Frame then return end

    Frame:SetMovable(true)
    Frame:EnableMouse(true)

    Frame:SetScript("OnMouseDown", function(self)
        self:StartMoving()
    end)

    Frame:SetScript("OnMouseUp", function(self)
        self:StopMovingOrSizing()
    end)
end
