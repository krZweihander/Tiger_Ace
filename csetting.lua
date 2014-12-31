
csetting = Core.class(Sprite)

function csetting:init()
	
	self.selectdlg = AlertDialog.new("Setting", "Select a setting to change\nSize : Size of the interface\nAlpha : Transparency of the interface", "Cancel", "Size", "Alpha")
	
	self.alphadlg = TextInputDialog.new("Interface Alpha", "Set the alpha of interface (1 ~ 10)", set_guialpha*10, "Cancel", "Confirm")
	self.alphadlg:setInputType(TextInputDialog.NUMBER)
	
	self.sizedlg = TextInputDialog.new("Interface Size", "Set the size of interface (1 ~ 20)", set_guiscale*10, "Cancel", "Confirm")
	self.sizedlg:setInputType(TextInputDialog.NUMBER)
	
	self.selectdlg:addEventListener(Event.COMPLETE, self.select_oncomplete, self)
	self.alphadlg:addEventListener(Event.COMPLETE, self.alpha_oncomplete, self)
	self.sizedlg:addEventListener(Event.COMPLETE, self.size_oncomplete, self)
	
	self.selectdlg:show()
	
end

function csetting:select_oncomplete(event)
	
	if event.buttonText == "Size" then
		self.sizedlg:show()
	elseif event.buttonText == "Alpha" then
		self.alphadlg:show()
	end
	
end

function csetting:alpha_oncomplete(event)
	
	if event.buttonIndex == nil then
		return
	end
	
	local num = tonumber(event.text)
	
	if num==nil or num<1 or num>10 then
		return
	end
	
	set_guialpha = num / 10
	guialpha = set_guialpha
	
	for i = 1, gui.move_gui:getNumChildren() do
		gui.move_gui:getChildAt(i):setAlpha(guialpha)
	end
	
	dataSaver.saveValue("guialpha", set_guialpha)
	
end

function csetting:size_oncomplete(event)
	
	if event.buttonIndex == nil then
		return
	end
	
	local num = tonumber(event.text)
	
	if num==nil or num<1 or num>20 then
		return
	end
	
	set_guiscale = num / 10
	guiscale = default_guiscale * set_guiscale
	
	margin = 5 * guiscale
	
	for i = 1, gui.move_gui:getNumChildren() do
		gui.move_gui:getChildAt(i):setScale(guiscale)
	end
	
	for i = 1, gui.game_gui:getNumChildren() do
		gui.game_gui:getChildAt(i):setScale(guiscale)
	end
	
	for i = 1, gui.main_gui:getNumChildren() do
		gui.main_gui:getChildAt(i):setScale(guiscale)
	end
	
	for i = 1, gui.gameover_gui:getNumChildren() do
		gui.gameover_gui:getChildAt(i):setScale(guiscale)
	end
	
	for i = 1, gui.pause_gui:getNumChildren() do
		gui.pause_gui:getChildAt(i):setScale(guiscale)
	end
	
	for i = 1, reload:getNumChildren() do
		reload:getChildAt(i):setScale(guiscale)
	end
	
	gui:guisetposition()
	reload.reload:setPosition(device_width - margin - (reload.reload:getWidth()/2), margin)
	reload.reloader:setPosition(reload.reload:getX() - (reload.reload:getWidth()/2) + reload.reloader:getWidth(), margin)
	
	dataSaver.saveValue("guiscale", set_guiscale)
	
end
