local BS = BearSynergies

function BS.BuildMenu()
    local PanelData = BS.GetModulePanelData()

    local OptionsTable = {
        {
            type = "header",
            name = "|cFFFACDGeneral|r",
        },
        {
            type = "checkbox",
            name = "Account-Wide Settings",
            getFunc = function() return BearSynergiesSV.Default[GetDisplayName()]["$AccountWide"].isAccountWide end,
            setFunc = function(value)
                BearSynergiesSV.Default[GetDisplayName()]["$AccountWide"].isAccountWide = value

                if value then
                    BS.SavedVariables.isAccountWide = value
                    BS.SavedVariables = ZO_SavedVars:NewAccountWide(BS.svName, BS.svVersion, nil, BS.Default)
                else
                    BS.SavedVariables = ZO_SavedVars:NewCharacterIdSettings(BS.svName, BS.svVersion, nil, BS.Default)
                    BS.SavedVariables.isAccountWide = value
                end
            end,
        },
        {
            type = "header",
            name = "|cFFFACDModule Settings|r",
        },
        {
            type = "checkbox",
            name = "Synergy Block",
            width = "half",
            getFunc = function() return BS.SavedVariables.isBlock end,
            setFunc = function(value) BS.SavedVariables.isBlock = value end,
            requiresReload = true,
        },
        {
            type = "description",
            width = "half",
            text = "Enables the possibility of blocking specific synergies or all synergies in defined scenarios.",
        },
        {
            type = "checkbox",
            name = "Group Tracker",
            width = "half",
            getFunc = function() return BS.SavedVariables.isGroupTrack end,
            setFunc = function(value) BS.SavedVariables.isGroupTrack = value end,
            requiresReload = true,
        },
        {
            type = "description",
            width = "half",
            text = "Enables tracking of synergy cooldowns for group members, uptime of Alkosh and alerts for when Alkosh user needs your synergies."
        },
        {
            type = "checkbox",
            name = "Synergy Tracker",
            width = "half",
            getFunc = function() return BS.SavedVariables.isTrack end,
            setFunc = function(value) BS.SavedVariables.isTrack = value end,
            requiresReload = true,
        },
        {
            type = "description",
            width = "half",
            text = "Enables the possibility of tracking the cooldown of synergies.",
        }
    }

    LibAddonMenu2:RegisterAddonPanel(BS.name .. "Main", PanelData)
    LibAddonMenu2:RegisterOptionControls(BS.name .. "Main", OptionsTable)
end