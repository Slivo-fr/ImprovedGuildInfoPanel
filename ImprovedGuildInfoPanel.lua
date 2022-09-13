ImprovedGuildInfoPanel = select(2, ...)

ImprovedGuildInfoPanel.eventFrame = CreateFrame("Frame", "ImprovedGuildInfoPanel", UIParent)
ImprovedGuildInfoPanel.eventFrame:RegisterEvent("PLAYER_LOGIN")

ImprovedGuildInfoPanel.eventFrame:SetScript("OnEvent", function(self, event, ...)

    if (event == "PLAYER_LOGIN") then
        GuildInfoEditBox:HookScript(
            "OnShow",
            function()
                C_Timer.After(0,function()
                    GuildInfoEditBox:EnableMouse(1)
                end)
            end
        )

        hooksecurefunc(GuildInfoEditBox, 'SetText', function(_, text)
            GuildInfoEditBox.readonlyText = text
        end)

        GuildInfoEditBox:SetScript("OnChar", function()
            GuildInfoEditBox:SetText(GuildInfoEditBox.readonlyText)
            GuildInfoEditBox:HighlightText()
        end)

        if (not CanEditMOTD()) then
            hooksecurefunc("GuildStatus_Update", function(_, text)
                GuildMOTDEditButton:Enable()
            end)
        end
    end
end)

