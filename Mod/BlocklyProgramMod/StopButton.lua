StopButton = commonlib.gettable("Mod.BlocklyProgramMod.StopButton")
function StopButton.showPage()
    if not StopButton.mShow then
        local params = {
            url = "Mod/BlocklyProgramMod/StopButton.html",
            name = "StopButton.showPage",
            isShowTitleBar = false,
            DestroyOnClose = true,
            bToggleShowHide = true,
            style = CommonCtrl.WindowFrame.ContainerStyle,
            allowDrag = false,
            --bShow = bShow,
            click_through = false,
            zorder = 2,
            directPosition = true,
            enable_esc_key = true,
            align = "_fi",
            x = 0,
            y = 0,
            width = 0,
            height = 0
        }
        System.App.Commands.Call("File.MCMLWindowFrame", params)
        StopButton.mShow = true
    end
end
function StopButton.close()
    if StopButton.mShow then
        StopButton.mShow = false
        StopButton.page:CloseWindow()
    end
end

-- only called by CodeHighLighting.html
function StopButton.Init()
    StopButton.page = document:GetPageCtrl()
end
