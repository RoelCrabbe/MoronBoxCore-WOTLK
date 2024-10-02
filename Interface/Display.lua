------------------------------------------------------------------------------------------------------
----------------------------------------------- FRAME! -----------------------------------------------
------------------------------------------------------------------------------------------------------

function MBC:InterfaceOptionsFrame()
    local AddonGUI = MBC:CreateOptionsWindow("MoronBoxCore")
    local MaxWidth = AddonGUI:GetParent():GetWidth() - 30

    local Description = AddonGUI:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    Description:SetPoint("TOPLEFT", AddonGUI.Title, "BOTTOMLEFT", 0, -10)
    Description:SetWidth(MaxWidth)
    Description:SetJustifyH("LEFT")
    Description:SetHeight(0)
    Description:SetText(
        MBC:ApplyTextColor("MoronBoxCore", MBC.COLORS.Highlight) ..
        MBC:ApplyTextColor(" serves as the foundational add-on in the Moron Multi Box collection, providing essential mathematical and helper functions utilized by all associated add-ons. It empowers the ", MBC.COLORS.Text) ..
        MBC:ApplyTextColor("MoronBox", MBC.COLORS.Highlight) ..
        MBC:ApplyTextColor(" ecosystem with core functionalities for efficient multiboxing, ensuring seamless gameplay and enhancing the user experience.", MBC.COLORS.Text)
    )
    
    MBC:ApplyCustomFont(Description, 15)
    AddonGUI.Description = Description

    local Button = MBC:CreateButton(AddonGUI, 170, 45, "Open General Menu")
    Button:SetPoint("CENTER", AddonGUI, "CENTER", 0, 0)
    AddonGUI.Button = Button

    Button:SetScript("OnClick", function()  
        MBC:HideFrameIfShown(InterfaceOptionsFrame)
        MBC:HideFrameIfShown(GameMenuFrame)   
        MBC:CreateSettingsWindow()
    end)
end

function MBC:CreateSettingsWindow()

    local SettingsFrame = MBC:CreateFrame(UIParent, MBC.BACKDROPS.Basic, 500, 600)
    SettingsFrame:SetBackdropColor(unpack(MBC.COLORS.FrameBackground))

    local Title = SettingsFrame:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    Title:SetText(MBC:ApplyTextColor("Moron Box Menu", MBC.COLORS.Title))
    Title:SetPoint("TOP", SettingsFrame, "TOP", 0, -10)
    SettingsFrame.Title = Title
    MBC:ApplyCustomFont(Title, 30)

    local CloseButton = MBC:CloseButton(SettingsFrame, 20, 20)
    SettingsFrame.CloseButton = CloseButton

    CloseButton:SetScript("OnClick", function()
        SettingsFrame:Hide()
    end)
    
    local Description = SettingsFrame:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    Description:SetPoint("TOPLEFT", SettingsFrame, "TOPLEFT", 20, -60)
    Description:SetWidth(SettingsFrame:GetWidth())
    Description:SetJustifyH("LEFT")
    Description:SetHeight(0)
    Description:SetText(
        MBC:ApplyTextColor("Loaded AddOns that depend on  ", MBC.COLORS.Text) ..
        MBC:ApplyTextColor("MoronBoxCore", MBC.COLORS.Highlight) .. 
        MBC:ApplyTextColor(":\n\n", MBC.COLORS.Text)
    )

    SettingsFrame.Description = Description
    MBC:ApplyCustomFont(Description, 15)

    local Addons = MBC:GetDependingAddons()
    local OffsetY = -100
    
    for _, Addon in InTable(Addons) do

        local AddonButton = MBC:CreateButton(SettingsFrame, 180, 30, Addon)
        AddonButton:SetPoint("TOPLEFT", SettingsFrame, "TOPLEFT", 20, OffsetY)

        AddonButton:SetScript("OnClick", function()
            MBC:OpenAddonGeneralWindow(Addon)
            SettingsFrame:Hide()
        end)
    
        OffsetY = OffsetY - 40
    end

    SettingsFrame:SetHeight(MBC:CalcRespHeight(#Addons, 100, 30, 15))
    SettingsFrame:SetMovable(true)
    SettingsFrame:EnableMouse(true)

    SettingsFrame:SetScript("OnMouseDown", function(self)
        self:StartMoving()
    end)

    SettingsFrame:SetScript("OnMouseUp", function(self)
        self:StopMovingOrSizing()
    end)

    return SettingsFrame
end