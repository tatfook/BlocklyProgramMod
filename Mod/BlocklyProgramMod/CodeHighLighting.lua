CodeHighLighting = commonlib.gettable("Mod.BlocklyProgramMod.CodeHighLighting")
CodeHighLighting.DefaultUIPos = {
	RestoreBtn = {
		alignment = "_lb",
		left = 2,
		top = -254 + 75,
		width = 21,
		height = 24,
		background = "Texture/Aries/ChatSystem/jiahao_32bits.png;0 0 21 24"
	},
	LogWnd = {alignment = "_lb", left = 2, top = -330, width = 320, height = 300},
	EditWnd = {alignment = "_lb", left = 2, top = -30, width = 700, height = 30},
	ParentWnd = {alignment = "_lb", left = 2, top = -335, width = 700, height = 330}
}

-- show the chat log page.
-- e.g. CodeHighLighting.ShowChatLogPage(true, "_lb", 0, -420, 450, 300)
function CodeHighLighting.ShowPage(bForceRefreshPage, alignment, left, top, width, height)
	if (bForceRefreshPage or not CodeHighLighting.page) then
		CodeHighLighting.page =
			Map3DSystem.mcml.PageCtrl:new(
			{
				url = "Mod/BlocklyProgramMod/CodeHighLighting.html",
				click_through = true
			}
		)
	end

	if (bForceRefreshPage) then
		ParaUI.Destroy("CodeHighLightingLogPage")
	end
	local _parent = ParaUI.GetUIObject("CodeHighLightingLogPage")

	if (not _parent or not _parent:IsValid()) then
		_parent =
			ParaUI.CreateUIObject(
			"container",
			"CodeHighLightingLogPage",
			alignment or CodeHighLighting.DefaultUIPos.LogWnd.alignment,
			left or CodeHighLighting.DefaultUIPos.LogWnd.left,
			top or CodeHighLighting.DefaultUIPos.LogWnd.top,
			width or CodeHighLighting.DefaultUIPos.LogWnd.width,
			height or CodeHighLighting.DefaultUIPos.LogWnd.height
		)
		_parent.background = ""
		_parent.visible = false
		_parent.zorder = -3
		_parent:GetAttributeObject():SetField("ClickThrough", true)

		_parent:AttachToRoot()

		CodeHighLighting.page:Create("CodeHighLighting.page", _parent, "_fi", 0, 0, 0, 0)
		CodeHighLighting.is_fade_out = nil
	end

	_parent.visible = true
	CodeHighLighting.is_shown = true
end

-- only called by CodeHighLighting.html
function CodeHighLighting.Init()
	CodeHighLighting.page = document:GetPageCtrl()
end

-- create the scroll bar
function CodeHighLighting.CreateTreeViewScrollBar(param, mcmlNode)
	local vscrollbar =
		ParaUI.CreateUIObject(
		"scrollbar",
		"CodeHighLighting_CreateTreeView_VScrollBar",
		"_lt",
		param.left,
		param.top,
		param.width,
		param.height
	)
	vscrollbar.visible = true
	vscrollbar:SetPageSize(param.height)
	vscrollbar.onchange = ";Mod.BlocklyProgramMod.CodeHighLighting.OnScrollBarChange()"

	--[[
	local states = {[1] = "highlight", [2] = "pressed", [3] = "disabled", [4] = "normal"};
	local i;
	for i = 1, 4 do
		vscrollbar:SetCurrentState(states[i]);
		texture=vscrollbar:GetTexture("track");
		texture.texture="Texture/Aries/ChatSystem/gundongtiaobg_32bits.png;0 0 16 32";
		texture=vscrollbar:GetTexture("up_left");
		texture.texture="Texture/Aries/ChatSystem/arrow1_32bits.png;6 6 16 16";
		texture=vscrollbar:GetTexture("down_right");
		texture.texture="Texture/Aries/ChatSystem/arrow2_32bits.png;6 6 16 20";
		texture=vscrollbar:GetTexture("thumb");
		texture.texture="Texture/Aries/ChatSystem/arrow3_32bits.png;0 0 16 31";
	end]]
	param.parent:AddChild(vscrollbar)
end

-- create the treeview for log display
function CodeHighLighting.CreateTreeView(param, mcmlNode)
	local _container =
		ParaUI.CreateUIObject("container", "CodeHighLighting_tvcon", "_lt", param.left, param.top, param.width, param.height)
	_container.background = ""
	_container:GetAttributeObject():SetField("ClickThrough", true)
	param.parent:AddChild(_container)

	-- create get the inner tree view
	local ctl = CodeHighLighting.GetTreeView(nil, _container, 0, 0, param.width, param.height)
	ctl:Show(true, nil, true)
	local _parentctl = ParaUI.GetUIObject(ctl.name)
	_parentctl:GetChild("main").onmousewheel =
		string.format(";Mod.BlocklyProgramMod.CodeHighLighting.OnTreeViewMouseWheel()")
end

function CodeHighLighting.OnTreeViewMouseWheel()
	--commonlib.echo("!!:OnTreeViewMouseWheel");
	CommonCtrl.TreeView.OnTreeViewMouseWheel("Mod.BlocklyProgramMod.CodeHighLighting.TreeView")
	CodeHighLighting.RefreshScrollBar()
end

function CodeHighLighting.OnScrollBarChange()
	local ctl = CodeHighLighting.GetTreeView()
	local vscrollbar = ParaUI.GetUIObject("CodeHighLighting_CreateTreeView_VScrollBar")
	if (ctl and vscrollbar:IsValid()) then
		ctl.ClientY = vscrollbar.value
		ctl:RefreshUI()
	end
end

function CodeHighLighting.RefreshScrollBar()
	local ctl = CodeHighLighting.GetTreeView()
	local vscrollbar = ParaUI.GetUIObject("CodeHighLighting_CreateTreeView_VScrollBar")
	if (ctl and vscrollbar:IsValid()) then
		local TreeViewHeight = ctl.height
		-- update track range and thumb location.
		vscrollbar:SetTrackRange(0, ctl.RootNode.LogicalBottom)
		if (ctl.VerticalScrollBarStep > (ctl.RootNode.LogicalBottom - TreeViewHeight) / 2) then
			vscrollbar:SetStep((ctl.RootNode.LogicalBottom - TreeViewHeight) / 2)
		else
			vscrollbar:SetStep(ctl.VerticalScrollBarStep)
		end

		vscrollbar.value = ctl.ClientY
		vscrollbar.scrollbarwidth = ctl.VerticalScrollBarWidth
	end
end

-- render callback for each text node in tree view.
function CodeHighLighting.DrawTextNodeHandler(_parent, treeNode)
	if (_parent == nil or treeNode == nil) then
		return
	end
	local _this
	local height = 12 -- just big enough
	local nodeWidth = treeNode.TreeView.ClientWidth
	local oldNodeHeight = treeNode:GetHeight()
	local chatdata = treeNode.chatdata
	local words = chatdata.words or ""
	words = words:gsub("\n", "<br/>")

	local use_shadow = "class='bordertext'" -- @note: replace this if one wants to use shadow: "class='bordertext'"

	local bEmptyChannelName = (chatdata.channelname == "")

	mcmlStr =
		string.format(
		[[<div style="line-height:14px;font-size:12px;color:#%s;" %s>%s</div>]],
		chatdata.color,
		use_shadow,
		words
	)
	if (mcmlStr ~= nil) then
		local xmlRoot = ParaXML.LuaXML_ParseString(mcmlStr)
		if (type(xmlRoot) == "table" and table.getn(xmlRoot) > 0) then
			local xmlRoot = Map3DSystem.mcml.buildclass(xmlRoot)

			local myLayout = Map3DSystem.mcml_controls.layout:new()
			myLayout:reset(0, 0, nodeWidth - 5, height)
			Map3DSystem.mcml_controls.create("bbs_lobby", xmlRoot, nil, _parent, 0, 0, nodeWidth - 5, height, nil, myLayout)
			local usedW, usedH = myLayout:GetUsedSize()
			if (usedH > height) then
				return usedH
			end
		end
	end
end

function CodeHighLighting.GetTreeView(name, parent, left, top, width, height, NoClipping)
	name = name or "CodeHighLighting.TreeView"
	local ctl = CommonCtrl.GetControl(name)
	if (not ctl) then
		ctl =
			CommonCtrl.TreeView:new {
			name = name,
			alignment = "_lt",
			left = left or 0,
			top = top or 0,
			width = width or 350,
			height = height or 200,
			parent = parent,
			container_bg = nil,
			DefaultIndentation = 2,
			NoClipping = NoClipping == true,
			ClickThrough = true,
			DefaultNodeHeight = 14,
			VerticalScrollBarStep = 14,
			VerticalScrollBarPageSize = 14 * 5,
			VerticalScrollBarWidth = 10,
			HideVerticalScrollBar = true,
			IsExternalScrollBar = true,
			DrawNodeHandler = CodeHighLighting.DrawTextNodeHandler
		}
	elseif (parent) then
		ctl.parent = parent
	end

	if (width) then
		ctl.width = width
	end

	if (height) then
		ctl.height = height
	end

	if (left) then
		ctl.left = left
	end

	if (top) then
		ctl.top = top
	end
	return ctl
end

function CodeHighLighting.AddBroadCastLine(chatdata)
	local use_treeview_broadcast = true
	if (use_treeview_broadcast) then
		local ctl = CodeHighLighting.GetTreeView("BroadCast.TreeView")
		local rootNode = ctl.RootNode

		if (rootNode:GetChildCount() >= max_broadcast_message) then
			rootNode:RemoveChildByIndex(1)
		end

		rootNode:AddChild(
			CommonCtrl.TreeNode:new(
				{
					Name = "text",
					chatdata = chatdata
				}
			)
		)

		local parent = ParaUI.GetUIObject("broadcast_tvcon")
		if (parent:IsValid()) then
			ctl.parent = parent
			ctl:Update(true)
		end

		CodeHighLighting.bbs_timer =
			CodeHighLighting.bbs_timer or
			commonlib.Timer:new(
				{
					callbackFunc = function(timer)
						local ctl = CodeHighLighting.GetTreeView("BroadCast.TreeView")
						local rootNode = ctl.RootNode
						rootNode:RemoveChildByIndex(1)

						local parent = ParaUI.GetUIObject("broadcast_tvcon")
						if (parent:IsValid()) then
							ctl.parent = parent
							ctl:Update(true)
						end
						if (rootNode:GetChildCount() == 0) then
							timer:Change()
						end
					end
				}
			)
		CodeHighLighting.bbs_timer:Change(max_broadcast_msg_show_time, max_broadcast_msg_show_time)
	else
		-- the old scrolling broadcast
		if (CodeHighLighting.sysmsg == nil) then
			CodeHighLighting.sysmsg = {}
		end
		local channelname = chatdata.channelname or "喇叭"
		local words = Encoding.EncodeStr(chatdata.words or "")
		local from = Encoding.EncodeStr(chatdata.from or "")
		local fromname = Encoding.EncodeStr(chatdata.fromname or "")
		local str = string.format("【%s】%s(%s)说:%s", channelname, fromname, from, words)
		table.insert(CodeHighLighting.sysmsg, {ChannelIndex = chatdata.ChannelIndex, words = str, state = 0})
		CodeHighLighting.CheckSysMsg()
	end
end

-- callback function whenever ChatChannel received a message.
-- @param chatdata: 参见ChatChannel.lua中的msgdata结构
-- @param needrefresh: bool	如为true,则会刷新聊天记录中的treeview
--]]---------------------------------------------------------------------------------------------------
function CodeHighLighting.AppendChatMessage(chatdata, needrefresh)
	if (chatdata == nil or type(chatdata) ~= "table") then
		commonlib.echo("error: chatdata 不可为空 in Mod.BlocklyProgramMod.CodeHighLighting.AppendChatMessage")
		return
	end

	local ctl = CodeHighLighting.GetTreeView()
	local rootNode = ctl.RootNode

	if (rootNode:GetChildCount() > 200) then
		rootNode:RemoveChildByIndex(1)
	end

	rootNode:AddChild(
		CommonCtrl.TreeNode:new(
			{
				Name = "text",
				chatdata = chatdata
			}
		)
	)

	if (needrefresh) then
		CodeHighLighting.RefreshTreeView()
	end
end

-- refresh the tree view.
-- TODO: only refresh whenever the tree view is visible, otherwise we will postpone until it is visible again.
function CodeHighLighting.RefreshTreeView()
	if (CodeHighLighting.page) then
		local ctl = CodeHighLighting.GetTreeView()
		if (ctl) then
			local parent = ParaUI.GetUIObject("CodeHighLighting_tvcon")
			if (parent:IsValid()) then
				ctl.parent = parent
				ctl:Update(true)
			end
		end

		CodeHighLighting.RefreshScrollBar()
	end
end

-- create a treeview to display broadcast message.
function CodeHighLighting.CreateBroadTreeView(param, mcmlNode)
	local _container =
		ParaUI.CreateUIObject("container", "broadcast_tvcon", "_lt", param.left, param.top, param.width, param.height)
	_container.background = ""
	_container:GetAttributeObject():SetField("ClickThrough", true)
	param.parent:AddChild(_container)

	-- create get the inner tree view
	local ctl = CodeHighLighting.GetTreeView("BroadCast.TreeView", _container, 0, 0, param.width, param.height, true)
	ctl:Show(true, nil, true)
end

-- create the broadcast view on top of the chat window for the most important messages.
function CodeHighLighting.CreateBroadView(param, mcmlNode)
	local name = "CodeHighLighting_CreateBroadView_" .. mcmlNode:GetString("id")
	local _this = ParaUI.CreateUIObject("container", name, "_lt", param.left, param.top, param.width, param.height)
	_this.background = ""
	_this.fastrender = false
	_this:GetAttributeObject():SetField("ClickThrough", true)
	param.parent:AddChild(_this)

	local _text = ParaUI.CreateUIObject("text", name .. "_text", "_lt", param.width, 3, param.width, param.height)
	_text.background = nil
	_text.text = ""
	_guihelper.SetFontColor(_text, "255 255 0")
	_text.font = System.DefaultBoldFontString
	_text.shadow = true
	_this:AddChild(_text)

	CodeHighLighting.CheckSysMsg()
end

-- TODO: optimize timer
function CodeHighLighting.BeginBroadViewScoll(id, msgdata)
	local name = "CodeHighLighting_CreateBroadView_" .. id
	local _con = ParaUI.GetUIObject(name)
	if (_con) then
		local _text = ParaUI.GetUIObject(name .. "_text")
		if (_text) then
			_text.text = msgdata.words
			_text:GetFont("text").format = 36 + 256 -- center and no clip
			_text.x = _con.width
			_text.width = _text:GetTextLineSize()

			local scroll_timer =
				commonlib.Timer:new(
				{
					callbackFunc = function(timer)
						local _broadcon = ParaUI.GetUIObject(name)
						if (_broadcon) then
							local _broadtext = ParaUI.GetUIObject(name .. "_text")
							if (_broadtext) then
								local x = _broadtext.x + _broadtext.width
								if (x >= 0) then
									_broadtext.x = _broadtext.x - 3
								else
									timer:Change()
									msgdata.state = msgdata.state + 1
									CodeHighLighting.EndBroadViewScoll(id, msgdata)
								end
							end
						end
					end
				}
			)
			scroll_timer:Change(20, 20)
			CodeHighLighting.isanimating = true
		end
	end
end

-- TODO: optimize timer
function CodeHighLighting.EndBroadViewScoll(id, msgdata)
	local text_delay_timer =
		commonlib.Timer:new(
		{
			callbackFunc = function(timer)
				timer:Change()
				if (msgdata.state == 1) then
					CodeHighLighting.BeginBroadViewScoll(id, msgdata)
				elseif (msgdata.state == 2) then
					msgdata.state = 3
					CodeHighLighting.isanimating = false
					CodeHighLighting.CheckSysMsg()
				end
			end
		}
	)
	text_delay_timer:Change(1000)
end

function CodeHighLighting.parse(code)
	NPL.load("(gl)Mod/BlocklyProgramMod/ProgrammingAPI.lua")
	local API = commonlib.gettable("Mod.BlocklyProgramMod.ProgrammingAPI")
	local line_codes = {}
	while (string.find(code, "\n")) do
		local line_code=string.sub(code, 1, string.find(code, '\n') - 1)
		if line_code and line_code~="" then
			line_codes[#line_codes + 1] = line_code
		end
		code = string.sub(code, string.find(code, '\n') + 1)
	end
	if code and code ~= "" then
		line_codes[#line_codes + 1] = code
	end
	CodeHighLighting.mCodeShow = commonlib.clone(line_codes)
	for line_index, line_code in pairs(line_codes) do
		local finded = false
		for funcion_name, _ in pairs(API) do
			if string.find(line_code, "API."..funcion_name) then
				finded = true
				break
			end
		end
		if finded then
			line_codes[line_index] = "CodeHighLighting.highLighting(" .. tostring(line_index) .. ");\r\n" .. line_code
		end
	end
	local ret = "NPL.load('(gl)Mod/BlocklyProgramMod/CodeHighLighting.lua');\r\n"
	ret = ret .. "CodeHighLighting = commonlib.gettable('Mod.BlocklyProgramMod.CodeHighLighting');\r\n"
	for line_index, line_code in pairs(line_codes) do
		ret = ret .. line_code .. "\n"
	end
	echo("devilwalk----------------------------------------------------debug:CodeHighLighting.parse:ret:")
	echo(ret)
	echo("devilwalk----------------------------------------------------debug:CodeHighLighting.parse:CodeHighLighting.mCodeShow:")
	echo(CodeHighLighting.mCodeShow)
	return ret
end

NPL.load("(gl)Mod/BlocklyProgramMod/ProgrammingCommand.lua")
local HighLighting =
	commonlib.inherit(
	Mod.BlocklyProgramMod.ProgrammingCommand,
	commonlib.gettable("Mod.BlocklyProgramMod.ProgrammingCommand.HighLighting")
)
function HighLighting:ctor()
end
function HighLighting:executing()
	local ctl = CodeHighLighting.GetTreeView()
	local rootNode = ctl.RootNode
	while rootNode:GetChildCount()>0 do
		rootNode:RemoveChildByIndex(1)
	end
	for line_index,line_code in pairs(CodeHighLighting.mCodeShow) do
		local word_color=nil;
		if line_index==self.mContext.mLineIndex then
			word_color=666666;
		end
		CodeHighLighting.AppendChatMessage({words=line_code,color=word_color},true);
	end
	self.mState = Mod.BlocklyProgramMod.ProgrammingCommand.EState.Finish
end
function CodeHighLighting.highLighting(lineIndex)
	NPL.load("(gl)Mod/BlocklyProgramMod/ProgrammingCommandQueue.lua")
	NPL.load("(gl)Mod/BlocklyProgramMod/ProgrammingCommandManager.lua")
	local CommandManager = commonlib.gettable("Mod.BlocklyProgramMod.ProgrammingCommandManager").singleton()
	local CommandQueue = commonlib.gettable("Mod.BlocklyProgramMod.ProgrammingCommandQueue").singleton()
	CommandQueue:add(HighLighting:new({mContext = {mLineIndex = lineIndex}}))
end
