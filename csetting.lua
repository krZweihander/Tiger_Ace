
csetting = Core.class(Sprite)

function csetting:init()
	
	stage:addChild(self)
	
	self.set = {}
	self.set.guiscale = set_guiscale * 10
	self.set.guialpha = set_guialpha * 10
	self.set.floatingstick = set_floatingstick
	
	self.lblscale = Sprite.new()
	self.lblscale:setScale(guiscale)
	self.lblscale.sprite = TextField.new(nil, "Scale")
	self.lblscale.sprite:setScale(2/3)
	self.lblscale:addText(self.lblscale.sprite)
	self:addChild(self.lblscale)
	
	self.scaleminusbutton = Sprite.new()
	self.scaleminusbutton:setScale(guiscale)
	self.scaleminusbutton.sprite = Bitmap.new(Texture.new("Sprite/GUI/minusbutton.png"))
	self.scaleminusbutton.sprite:setScale(1/10)
	self.scaleminusbutton:addSprite(self.scaleminusbutton.sprite)
	self:addChild(self.scaleminusbutton)
	
	self.txtscale = Sprite.new()
	self.txtscale:setScale(guiscale)
	self.txtscale.sprite = TextField.new(nil, self.set.guiscale)
	self.txtscale.sprite:setScale(1)
	self.txtscale:addText(self.txtscale.sprite)
	self:addChild(self.txtscale)
	
	self.scaleplusbutton = Sprite.new()
	self.scaleplusbutton:setScale(guiscale)
	self.scaleplusbutton.sprite = Bitmap.new(Texture.new("Sprite/GUI/plusbutton.png"))
	self.scaleplusbutton.sprite:setScale(1/10)
	self.scaleplusbutton:addSprite(self.scaleplusbutton.sprite)
	self:addChild(self.scaleplusbutton)
	
	self.lblalpha = Sprite.new()
	self.lblalpha:setScale(guiscale)
	self.lblalpha.sprite = TextField.new(nil, "Stick Transparency")
	self.lblalpha.sprite:setScale(2/3)
	self.lblalpha:addText(self.lblalpha.sprite)
	self:addChild(self.lblalpha)
	
	self.alphaminusbutton = Sprite.new()
	self.alphaminusbutton:setScale(guiscale)
	self.alphaminusbutton.sprite = Bitmap.new(Texture.new("Sprite/GUI/minusbutton.png"))
	self.alphaminusbutton.sprite:setScale(1/10)
	self.alphaminusbutton:addSprite(self.alphaminusbutton.sprite)
	self:addChild(self.alphaminusbutton)
	
	self.txtalpha = Sprite.new()
	self.txtalpha:setScale(guiscale)
	self.txtalpha.sprite = TextField.new(nil, self.set.guialpha)
	self.txtalpha.sprite:setScale(1)
	self.txtalpha:addText(self.txtalpha.sprite)
	self:addChild(self.txtalpha)
	
	self.alphaplusbutton = Sprite.new()
	self.alphaplusbutton:setScale(guiscale)
	self.alphaplusbutton.sprite = Bitmap.new(Texture.new("Sprite/GUI/plusbutton.png"))
	self.alphaplusbutton.sprite:setScale(1/10)
	self.alphaplusbutton:addSprite(self.alphaplusbutton.sprite)
	self:addChild(self.alphaplusbutton)
	
	self.lblfloatingstick = Sprite.new()
	self.lblfloatingstick:setScale(guiscale)
	self.lblfloatingstick.sprite = TextField.new(nil, "Floating Stick")
	self.lblfloatingstick.sprite:setScale(2/3)
	self.lblfloatingstick:addText(self.lblfloatingstick.sprite)
	self:addChild(self.lblfloatingstick)
	
	self.floatingstickcheckbutton = Sprite.new()
	self.floatingstickcheckbutton:setScale(guiscale)
	self.floatingstickcheckbutton.sprite_base = Bitmap.new(Texture.new("Sprite/GUI/checkbutton_base.png"))
	self.floatingstickcheckbutton.sprite_check = Bitmap.new(Texture.new("Sprite/GUI/checkbutton_check.png"))
	self.floatingstickcheckbutton.sprite_base:setScale(1/10)
	self.floatingstickcheckbutton.sprite_check:setScale(1/10)
	self.floatingstickcheckbutton:addSprite(self.floatingstickcheckbutton.sprite_base)
	self.floatingstickcheckbutton:addSprite(self.floatingstickcheckbutton.sprite_check)
	self:addChild(self.floatingstickcheckbutton)
	
	if self.set.floatingstick then
		self.floatingstickcheckbutton.sprite_check:setAlpha(1)
	else
		self.floatingstickcheckbutton.sprite_check:setAlpha(0)
	end
	
	self.confirmbutton = Sprite.new()
	self.confirmbutton:setScale(guiscale)
	self.confirmbutton.text = TextField.new(nil, "Confirm")
	self.confirmbutton.sprite = Shape.new()
	self.confirmbutton.sprite:setFillStyle(Shape.SOLID, 0xffff00)
	self.confirmbutton.sprite:drawbox(0, 0, self.confirmbutton.text:getWidth() + 10, self.confirmbutton.text:getHeight() + 10)
	self.confirmbutton:addSprite(self.confirmbutton.sprite)
	self.confirmbutton:addText(self.confirmbutton.text)
	self:addChild(self.confirmbutton)
	
	self.txtscale:setPosition(device_width*2/3, margin + margin + self.txtscale:getHeight()/2)
	self.scaleminusbutton:setPosition(self.txtscale:getX() - margin - margin - self.scaleminusbutton:getWidth()/2, self.txtscale:getY())
	self.scaleplusbutton:setPosition(self.txtscale:getX() + margin + margin + self.scaleplusbutton:getWidth()/2, self.txtscale:getY())
	self.lblscale:setPosition(self.scaleminusbutton:getX() - self.scaleminusbutton:getWidth()/2 - margin - self.lblscale:getWidth()/2, self.txtscale:getY())
	
	self.txtalpha:setPosition(device_width*2/3, self.txtscale:getY() + self.txtscale:getHeight()/2 + margin + margin + self.txtalpha:getHeight()/2)
	self.alphaminusbutton:setPosition(self.txtalpha:getX() - margin - margin - self.alphaminusbutton:getWidth()/2, self.txtalpha:getY())
	self.alphaplusbutton:setPosition(self.txtalpha:getX() + margin + margin + self.alphaplusbutton:getWidth()/2, self.txtalpha:getY())
	self.lblalpha:setPosition(self.alphaminusbutton:getX() - self.alphaminusbutton:getWidth()/2 - margin - self.lblalpha:getWidth()/2, self.txtalpha:getY())
	
	self.floatingstickcheckbutton:setPosition(device_width*2/3, self.txtalpha:getY() + self.txtalpha:getHeight()/2 + margin + margin + self.floatingstickcheckbutton:getHeight()/2)
	self.lblfloatingstick:setPosition(self.floatingstickcheckbutton:getX() - self.floatingstickcheckbutton:getWidth()/2 - margin - margin - self.lblfloatingstick:getWidth()/2, self.floatingstickcheckbutton:getY())
	
	self.confirmbutton:setPosition(device_width/2, self.floatingstickcheckbutton:getY() + self.floatingstickcheckbutton:getHeight()/2 + margin + self.confirmbutton:getHeight())
	
	--[[self.selectdlg = AlertDialog.new("Setting", "Select a setting to change\nSize : Size of the interface\nAlpha : Transparency of the interface", "Cancel", "Size", "Alpha")
	
	self.alphadlg = TextInputDialog.new("Interface Alpha", "Set the alpha of interface (1 ~ 10)", set_guialpha*10, "Cancel", "Confirm")
	self.alphadlg:setInputType(TextInputDialog.NUMBER)
	
	self.sizedlg = TextInputDialog.new("Interface Size", "Set the size of interface (1 ~ 20)", set_guiscale*10, "Cancel", "Confirm")
	self.sizedlg:setInputType(TextInputDialog.NUMBER)
	
	self.selectdlg:addEventListener(Event.COMPLETE, self.select_oncomplete, self)
	self.alphadlg:addEventListener(Event.COMPLETE, self.alpha_oncomplete, self)
	self.sizedlg:addEventListener(Event.COMPLETE, self.size_oncomplete, self)
	
	self.selectdlg:show()]]--
	
	self:setAlpha(0)
	
	self.gui_alpha = 0
	self.world_alpha = 0
	
	self.confirm_id = 0
	
	self:addEventListener(Event.TOUCHES_BEGIN, self.touches_begin, self)
	self:addEventListener(Event.TOUCHES_END, self.touches_end, self)
	self:addEventListener(Event.KEY_DOWN, self.key_down, self)
	
end

function csetting:touches_begin(event)
	
	if self:getAlpha() == 0 then
		return
	end
	
	if self.scaleminusbutton:hitTestPoint(event.touch.x, event.touch.y) then
		self.set.guiscale = self.set.guiscale - 1
	elseif self.scaleplusbutton:hitTestPoint(event.touch.x, event.touch.y) then
		self.set.guiscale = self.set.guiscale + 1
	elseif self.alphaminusbutton:hitTestPoint(event.touch.x, event.touch.y) then
		self.set.guialpha = self.set.guialpha - 1
	elseif self.alphaplusbutton:hitTestPoint(event.touch.x, event.touch.y) then
		self.set.guialpha = self.set.guialpha + 1
	elseif self.floatingstickcheckbutton:hitTestPoint(event.touch.x, event.touch.y) then
		self.set.floatingstick = not self.set.floatingstick
	elseif self.confirmbutton:hitTestPoint(event.touch.x, event.touch.y) then
		self.confirm_id = event.id
	end
	
	if self.set.guiscale > 20 then
		self.set.guiscale = 20
	elseif self.set.guiscale < 1 then
		self.set.guiscale = 1
	end
	if self.set.guialpha > 10 then
		self.set.guialpha = 10
	elseif self.set.guialpha < 1 then
		self.set.guialpha = 1
	end
	
	self.txtscale.sprite:setText(self.set.guiscale)
	self.txtalpha.sprite:setText(self.set.guialpha)
	if self.set.floatingstick then
		self.floatingstickcheckbutton.sprite_check:setAlpha(1)
	else
		self.floatingstickcheckbutton.sprite_check:setAlpha(0)
	end
	
end

function csetting:touches_end(event)
	
	if self:getAlpha() == 0 then
		return
	end
	if self.confirm_id == event.id and self.confirmbutton:hitTestPoint(event.touch.x, event.touch.y) then
		self.confirm_id = 0
		self:end_setting()
	end
	
end

function csetting:key_down(event)
	if self:getAlpha() == 0 then
		return
	end
	if event.keyCode == KeyCode.BACK then
		self:end_setting()
	end
end

function csetting:start_setting()
	self.gui_alpha = gui:getAlpha()
	self.world_alpha = tworld:getAlpha()
	gui:setAlpha(0)
	tworld:setAlpha(0)
	self:setAlpha(1)
end

function csetting:end_setting()
	gui:setAlpha(self.gui_alpha)
	tworld:setAlpha(self.world_alpha)
	self:setAlpha(0)
	
	set_guiscale = self.set.guiscale / 10
	set_guialpha = self.set.guialpha / 10
	set_floatingstick = self.set.floatingstick
	guiscale = default_guiscale * set_guiscale
	guialpha = set_guialpha
	floatingstick = set_floatingstick
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
	
	for i = 1, self:getNumChildren() do
		self:getChildAt(i):setScale(guiscale)
	end
	
	gui:guisetposition()
	reload.reload:setPosition(device_width - margin - (reload.reload:getWidth()/2), margin)
	reload.reloader:setPosition(reload.reload:getX() - (reload.reload:getWidth()/2) + reload.reloader:getWidth(), margin)
	
	dataSaver.saveValue("guiscale", set_guiscale)
	dataSaver.saveValue("guialpha", set_guialpha)
	
end
