-------------------------------------------------------------------------------
-- Colors and Backdrop Helpers {{{
-------------------------------------------------------------------------------

function MBC:ApplyTextColor(Text, Color)
    return string.format("|cff%s%s|r", Color, Text)
end

function MBC:GetFont(FontFile)
    return "Interface\\AddOns\\MoronBoxCore\\Media\\Fonts\\"..FontFile
end

function MBC:ApplyCustomFont(FontString, Size, Flags)
    if not FontString then return end

    Size = Size or 14
    Flags = Flags or nil

    FontString:SetFont(MBC:GetFont("MoronFont.ttf"), Size, Flags)
end

function MBC:Print(Text)
    return Print(MBC:ApplyTextColor("MoronBox", MBC.COLORS.Title)..MBC:ApplyTextColor(": "..Text, MBC.COLORS.Text))
end

-------------------------------------------------------------------------------
-- Interface Helpers {{{
-------------------------------------------------------------------------------

function MBC:HideFrameIfShown(Frame)
    if Frame:IsShown() then
        HideUIPanel(Frame)
    end
end

function MBC:OpenAddonGeneralWindow(Name)
    if _G[Name] and type(_G[Name].GeneralSettingWindow) == "function" then
        _G[Name]:GeneralSettingWindow()
    else
        MBC:Print("No settings menu found for addon: " .. Name)
    end
end

function MBC:CalcRespHeight(NumAddons, BaseHeight, ButtonHeight, ButtonSpacing)
    return BaseHeight + (NumAddons * (ButtonHeight + ButtonSpacing))
end
