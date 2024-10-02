-------------------------------------------------------------------------------
-- Colors and Backdrop {{{
-------------------------------------------------------------------------------

MBC.COLORS = {
    Title = "7B68EE",        -- Medium Slate Blue
    Highlight = "00ccff",    -- Bright cyan
    Text = "A9A9A9",         -- Dark gray (as in your example)

    Background = {0.1, 0.1, 0.1}, -- Dark gray (RGB tuple)
    HoverBackground = {0.2, 0.2, 0.2}, -- Lighter gray (RGB tuple)
    TextLight = {0.9, 0.9, 0.9}, -- Light gray (RGB tuple)
    FrameBackground = {0.3, 0.3, 0.3, 0.7}, -- Dark Slate Gray (RGBA tuple)
    LineColor = {0.7, 0.7, 0.7, 1}, -- Line color (RGBA tuple)
    CloseButtonNormal = {0.55, 0, 0, 0.8}, -- Close button normal color (RGBA tuple)
    CloseButtonHover = {1, 0, 0, 0.8}, -- Close button hover color (RGBA tuple)
    ReturnButtonNormal = {0, 0.55, 0, 0.8}, -- Return button normal color (RGBA tuple)
    ReturnButtonHover = {0.0, 1, 0.0, 0.8} -- Darker green for return button hover (RGBA tuple)
}

MBC.BACKDROPS = {
    Basic = {
        bgFile = "Interface\\AddOns\\MoronBoxCore\\Media\\Icons\\Smooth.tga",
        edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
        tile = false,
        tileSize = 16,
        edgeSize = 16,
        insets = { left = 4, right = 4, top = 4, bottom = 4 },
    },

    No_Top = {
        bgFile = "Interface\\AddOns\\MoronBoxCore\\Media\\Icons\\Smooth.tga",
        edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
        tile = false,
        tileSize = 16,
        edgeSize = 12,
        insets = { left = 1, right = 1, top = 0, bottom = 1 },
    },

    Thin = {
        bgFile = "Interface\\AddOns\\MoronBoxCore\\Media\\Icons\\Smooth.tga",
        edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
        tile = false,
        tileSize = 16,
        edgeSize = 1,
        insets = { left = 0, right = 0, top = 0, bottom = 0 },
    },

    Hover = {
        edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
        tile = false,
        edgeSize = 24,
        insets = { left = -1, right = -1, top = -1, bottom = -1 },
    },

    Blizz_Background = {
        bgFile = "Interface\\AddOns\\MoronBoxCore\\Media\\Icons\\Smooth.tga",
        tile = true,
        tileSize = 8,
        insets = { left = 3, right = 3, top = 3, bottom = 3 },
    },

    Blizz_Border = {
        edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
        tile = false,
        edgeSize = 12,
        insets = { left = 3, right = 3, top = 3, bottom = 3 },
    },

    Blizz_Full = {
        bgFile = "Interface\\AddOns\\MoronBoxCore\\Media\\Icons\\Smooth.tga",
        edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
        tile = true,
        tileSize = 8,
        edgeSize = 12,
        insets = { left = 3, right = 3, top = 3, bottom = 3 },
    },
}