
cgui = Core.class(Sprite)

function cgui:init()
	
	self.move_gui = Sprite.new()
	self.move_gui:setAlpha(0)
	self:addChild(self.move_gui)
	
	self.game_gui = Sprite.new()
	self.game_gui:setAlpha(0)
	self:addChild(self.game_gui)
	
	self.main_gui = Sprite.new()
	self.main_gui:setAlpha(1)
	self:addChild(self.main_gui)
	
	self.gameover_gui = Sprite.new()
	self.gameover_gui:setAlpha(0)
	self:addChild(self.gameover_gui)
	
	self.pause_gui = Sprite.new()
	self.pause_gui:setAlpha(0)
	self:addChild(self.pause_gui)
	
	--[[self.up = Sprite.new()
	self.up:setAlpha(0)--guialpha)
	self.up:setScale(guiscale)
	self.up.sprite = Bitmap.new(Texture.new("Sprite/GUI/up.png"))
	self.up:addSprite(self.up.sprite)
	self.move_gui:addChild(self.up)
	
	self.down = Sprite.new()
	self.down:setAlpha(0)--guialpha)
	self.down:setScale(guiscale)
	self.down.sprite = Bitmap.new(Texture.new("Sprite/GUI/down.png"))
	self.down:addSprite(self.down.sprite)
	self.move_gui:addChild(self.down)
	
	self.right = Sprite.new()
	self.right:setAlpha(0)--guialpha)
	self.right:setScale(guiscale)
	self.right.sprite = Bitmap.new(Texture.new("Sprite/GUI/right.png"))
	self.right:addSprite(self.right.sprite)
	self.move_gui:addChild(self.right)
	
	self.left = Sprite.new()
	self.left:setAlpha(0)--guialpha)
	self.left:setScale(guiscale)
	self.left.sprite = Bitmap.new(Texture.new("Sprite/GUI/left.png"))
	self.left:addSprite(self.left.sprite)
	self.move_gui:addChild(self.left)
	
	self.upleft = Sprite.new()
	self.upleft:setAlpha(0)--guialpha)
	self.upleft:setScale(guiscale)
	self.upleft.sprite = Bitmap.new(Texture.new("Sprite/GUI/up.png"))
	self.upleft.sprite:setScale(4/5)
	self.upleft:addSprite(self.upleft.sprite)
	self.upleft:setRotation(-45)
	self.move_gui:addChild(self.upleft)
	
	self.upright = Sprite.new()
	self.upright:setAlpha(0)--guialpha)
	self.upright:setScale(guiscale)
	self.upright.sprite = Bitmap.new(Texture.new("Sprite/GUI/up.png"))
	self.upright.sprite:setScale(4/5)
	self.upright:addSprite(self.upright.sprite)
	self.upright:setRotation(45)
	self.move_gui:addChild(self.upright)
	
	self.downleft = Sprite.new()
	self.downleft:setAlpha(0)--guialpha)
	self.downleft:setScale(guiscale)
	self.downleft.sprite = Bitmap.new(Texture.new("Sprite/GUI/down.png"))
	self.downleft.sprite:setScale(4/5)
	self.downleft:addSprite(self.downleft.sprite)
	self.downleft:setRotation(45)
	self.move_gui:addChild(self.downleft)
	
	self.downright = Sprite.new()
	self.downright:setAlpha(0)--guialpha)
	self.downright:setScale(guiscale)
	self.downright.sprite = Bitmap.new(Texture.new("Sprite/GUI/down.png"))
	self.downright.sprite:setScale(4/5)
	self.downright:addSprite(self.downright.sprite)
	self.downright:setRotation(-45)
	self.move_gui:addChild(self.downright)]]--
	
	self.mvstickarrow = Sprite.new()
	self.mvstickarrow:setAlpha(0)
	self.mvstickarrow:setScale(guiscale)
	self.mvstickarrow.sprite = Bitmap.new(Texture.new("Sprite/GUI/stick_base-arrow.png"))
	self.mvstickarrow.sprite:setScale(1/3)
	self.mvstickarrow:addSprite(self.mvstickarrow.sprite)
	self.move_gui:addChild(self.mvstickarrow)
	
	self.mvstickbase = Sprite.new()
	self.mvstickbase:setAlpha(0)
	self.mvstickbase:setScale(guiscale)
	self.mvstickbase.sprite = Bitmap.new(Texture.new("Sprite/GUI/stick_base.png"))
	self.mvstickbase.sprite:setScale(1/3)
	self.mvstickbase:addSprite(self.mvstickbase.sprite)
	self.move_gui:addChild(self.mvstickbase)
	
	self.mvstickkey = Sprite.new()
	self.mvstickkey:setAlpha(0)
	self.mvstickkey:setScale(guiscale)
	self.mvstickkey.sprite = Bitmap.new(Texture.new("Sprite/GUI/stick_key.png"))
	self.mvstickkey.sprite:setScale(1/3)
	self.mvstickkey:addSprite(self.mvstickkey.sprite)
	self.move_gui:addChild(self.mvstickkey)
	
	self.move_id = 0
	
	--[[self.trright = Sprite.new()
	self.trright:setAlpha(0)--guialpha)
	self.trright:setScale(guiscale)
	self.trright.sprite = Bitmap.new(Texture.new("Sprite/GUI/tr_right.png"))
	self.trright:addSprite(self.trright.sprite)
	self.move_gui:addChild(self.trright)
	
	self.trleft = Sprite.new()
	self.trleft:setAlpha(0)--guialpha)
	self.trleft:setScale(guiscale)
	self.trleft.sprite = Bitmap.new(Texture.new("Sprite/GUI/tr_left.png"))
	self.trleft:addSprite(self.trleft.sprite)
	self.move_gui:addChild(self.trleft)]]--
	
	self.trstickarrow = Sprite.new()
	self.trstickarrow:setAlpha(0)
	self.trstickarrow:setScale(guiscale)
	self.trstickarrow.sprite = Bitmap.new(Texture.new("Sprite/GUI/stick_base-arrow_turret.png"))
	self.trstickarrow.sprite:setScale(1/3)
	self.trstickarrow:addSprite(self.trstickarrow.sprite)
	self.move_gui:addChild(self.trstickarrow)
	
	self.trstickbase = Sprite.new()
	self.trstickbase:setAlpha(0)
	self.trstickbase:setScale(guiscale)
	self.trstickbase.sprite = Bitmap.new(Texture.new("Sprite/GUI/stick_base.png"))
	self.trstickbase.sprite:setScale(1/3)
	self.trstickbase:addSprite(self.trstickbase.sprite)
	self.move_gui:addChild(self.trstickbase)
	
	self.trstickkey = Sprite.new()
	self.trstickkey:setAlpha(0)
	self.trstickkey:setScale(guiscale)
	self.trstickkey.sprite = Bitmap.new(Texture.new("Sprite/GUI/stick_key.png"))
	self.trstickkey.sprite:setScale(1/3)
	self.trstickkey:addSprite(self.trstickkey.sprite)
	self.move_gui:addChild(self.trstickkey)
	
	self.turret_id = 0
	self.trstick_mxdist = 0
	self.trstick_start = false
	self.trstick_tap = false
	
	self.reloading = false
	
	--[[self.fire = Sprite.new()
	self.fire:setAlpha(0)--guialpha)
	self.fire:setScale(guiscale)
	self.fire.sprite = Bitmap.new(Texture.new("Sprite/GUI/fire.png"))
	self.fire:addSprite(self.fire.sprite)
	self.move_gui:addChild(self.fire)
	
	self.fire_id = 0
	
	self.reload = Sprite.new()
	self.reload:setAlpha(guialpha)
	self.reload:setScale(guiscale)
	self.reload.sprite = Bitmap.new(Texture.new("Sprite/GUI/reload_button.png"))
	self.reload:addSprite(self.reload.sprite)
	self.move_gui:addChild(self.reload)]]--
	
	self.wave = Sprite.new()
	self.wave:setScale(guiscale)
	self.wave.sprite = TextField.new(nil, "Wave 0")
	self.wave.sprite:setScale(3/4)
	self.wave:addText(self.wave.sprite)
	self.game_gui:addChild(self.wave)
	
	self.leftenemy = Sprite.new()
	self.leftenemy:setScale(guiscale)
	self.leftenemy.sprite = TextField.new(nil, "Enemy 0")
	self.leftenemy.sprite:setScale(3/4)
	self.leftenemy:addText(self.leftenemy.sprite)
	self.game_gui:addChild(self.leftenemy)
	
	self.pause_button = Sprite.new()
	self.pause_button:setScale(guiscale)
	self.pause_button.sprite1 = Bitmap.new(Texture.new("Sprite/GUI/pause.png"))
	self.pause_button.sprite1:setScale(4/7)
	self.pause_button.sprite2 = Shape:new()
	self.pause_button.sprite2:setScale(4/7)
	self.pause_button.sprite2:setFillStyle(Shape.SOLID, 0xffffff)
	self.pause_button.sprite2:drawbox(0, 0, self.pause_button.sprite1:getWidth()*3 ,self.pause_button.sprite1:getHeight()*3)
	self.pause_button.sprite2:setAlpha(0)
	self.pause_button:addSprite(self.pause_button.sprite1)
	self.pause_button:addSprite(self.pause_button.sprite2)
	self.game_gui:addChild(self.pause_button)
	
	self.title = Sprite.new()
	self.title:setScale(guiscale)
	self.title.sprite = TextField.new(nil, "Tiger Ace")
	self.title.sprite:setScale(5/2)
	self.title:addText(self.title.sprite)
	self.main_gui:addChild(self.title)
	
	self.credit = Sprite.new()
	self.credit:setScale(guiscale)
	self.credit.text1 = TextField.new(nil, "Made By World of Chicken")
	self.credit.text1:setScale(3/4)
	self.credit.text2 = TextField.new(nil, "of Maseok High School")
	self.credit.text2:setScale(3/4)
	self.credit:addText(self.credit.text1)
	self.credit:addText(self.credit.text2)
	self.credit.text2:setY(self.credit.text2:getY() + (self.credit.text1:getHeight()/2) + 5)
	self.main_gui:addChild(self.credit)
	
	self.start_button = Sprite.new()
	self.start_button:setScale(guiscale)
	self.start_button.text = TextField.new(nil, "Start")
	self.start_button.sprite = Shape.new()
	self.start_button.sprite:setFillStyle(Shape.SOLID, 0x00ff00)
	self.start_button.sprite:drawbox(0, 0, self.start_button.text:getWidth() + 20, self.start_button.text:getHeight() + 20)
	self.start_button:addSprite(self.start_button.sprite)
	self.start_button:addText(self.start_button.text)
	self.main_gui:addChild(self.start_button)
	
	self.gameover = Sprite.new()
	self.gameover:setScale(guiscale)
	self.gameover.sprite = TextField.new(nil, "Game Over")
	self.gameover.sprite:setScale(2)
	self.gameover:addText(self.gameover.sprite)
	self.gameover_gui:addChild(self.gameover)
	
	self.mwave = Sprite.new()
	self.mwave:setScale(guiscale)
	self.mwave.sprite = TextField.new(nil, "Wave : ")
	self.mwave.sprite:setScale(3/2)
	self.mwave:addText(self.mwave.sprite)
	self.gameover_gui:addChild(self.mwave)
	
	self.mkill = Sprite.new()
	self.mkill:setScale(guiscale)
	self.mkill.sprite = TextField.new(nil, "Kill : ")
	self.mkill.sprite:setScale(3/2)
	self.mkill:addText(self.mkill.sprite)
	self.gameover_gui:addChild(self.mkill)
	
	self.restart_button = Sprite.new()
	self.restart_button:setScale(guiscale)
	self.restart_button.text = TextField.new(nil, "Restart")
	self.restart_button.sprite = Shape.new()
	self.restart_button.sprite:setFillStyle(Shape.SOLID, 0xff0000)
	self.restart_button.sprite:drawbox(0, 0, self.restart_button.text:getWidth() + 20, self.restart_button.text:getHeight() + 20)
	self.restart_button:addSprite(self.restart_button.sprite)
	self.restart_button:addText(self.restart_button.text)
	self.gameover_gui:addChild(self.restart_button)
	
	self.pausescreen = Sprite.new()
	self.pausescreen.sprite = Shape.new()
	self.pausescreen.sprite:setFillStyle(Shape.SOLID, 0x000000)
	self.pausescreen.sprite:drawbox(0, 0, device_width, device_height)
	self.pausescreen.sprite:setAlpha(0.3)
	self.pausescreen:addChild(self.pausescreen.sprite)
	self.pause_gui:addChild(self.pausescreen)
	
	self.pausetext = Sprite.new()
	self.pausetext:setScale(guiscale)
	self.pausetext.sprite = TextField.new(nil, "Paused")
	self.pausetext.sprite:setScale(2)
	self.pausetext:addText(self.pausetext.sprite)
	self.pause_gui:addChild(self.pausetext)
	
	self.pauseguidetext = Sprite.new()
	self.pauseguidetext:setScale(guiscale)
	self.pauseguidetext.sprite = TextField.new(nil, "Touch to continue")
	self.pauseguidetext.sprite:setScale(3/2)
	self.pauseguidetext:addText(self.pauseguidetext.sprite)
	self.pause_gui:addChild(self.pauseguidetext)
	
	self.exitguidetext = Sprite.new()
	self.exitguidetext:setScale(guiscale)
	self.exitguidetext.sprite = TextField.new(nil, "Back button to exit")
	self.exitguidetext:addText(self.exitguidetext.sprite)
	self.pause_gui:addChild(self.exitguidetext)
	
	self.settingbutton = Sprite.new()
	self.settingbutton:setScale(guiscale)
	self.settingbutton.sprite = Bitmap.new(Texture.new("Sprite/GUI/setting.png"))
	self.settingbutton.sprite:setScale(1/6)
	self.settingbutton:addSprite(self.settingbutton.sprite)
	self.main_gui:addChild(self.settingbutton)
	
	self:guisetposition()
	
	--self.reload:setAlpha(0)
	
	self.rtn = {}
	self.rtn.left = 0
	self.rtn.right = 0
	self.rtn.tr = 0
	self.rtn.fireb = false
	
	self:addEventListener(Event.TOUCHES_BEGIN, self.touches_begin, self)
	self:addEventListener(Event.TOUCHES_MOVE, self.touches_move, self)
	self:addEventListener(Event.TOUCHES_END, self.touches_end, self)
	self:addEventListener(Event.KEY_DOWN, self.key_down, self)
	self:addEventListener(Event.KEY_UP, self.key_up, self)
	self:addEventListener(Event.APPLICATION_BACKGROUND, self.application_background, self)
	
	stage:addChild(self)
	
end

function cgui:guisetposition()
	
	--[[self.down:setPosition(margin + self.left:getWidth() + (self.down:getWidth()/2), device_height - margin - (self.down:getHeight()/2))
	self.left:setPosition(margin + (self.left:getWidth()/2), device_height - margin - self.down:getHeight() - (self.left:getHeight()/2))
	self.up:setPosition(self.down:getX(), device_height - margin - self.down:getHeight() - self.left:getHeight() - (self.up:getHeight()/2))
	self.right:setPosition(margin + self.left:getWidth() + self.down:getWidth() + (self.right:getWidth()/2), self.left:getY())
	
	self.upleft:setPosition(self.left:getX(), self.up:getY())
	self.upright:setPosition(self.right:getX(), self.up:getY())
	self.downleft:setPosition(self.left:getX(), self.down:getY())
	self.downright:setPosition(self.right:getX(), self.down:getY())]]--
	
	self.mvstickbase:setPosition(margin + (self.mvstickarrow:getWidth()/2), device_height - margin - (self.mvstickarrow:getHeight()/2))
	self.mvstickarrow:setPosition(self.mvstickbase:getX(), self.mvstickbase:getY())
	self.mvstickkey:setPosition(self.mvstickbase:getX(), self.mvstickbase:getY())
	
	--[[self.trright:setPosition(device_width - margin - (self.trright:getWidth()/2), device_height - margin - (self.trright:getHeight()))
	self.trleft:setPosition(device_width - margin - self.trright:getWidth() - margin - (self.trleft:getWidth()/2), self.trright:getY())
	]]--
	self.trstickbase:setPosition(device_width - margin - (self.trstickarrow:getWidth()/2), device_height - margin - (self.trstickarrow:getHeight()/2))
	self.trstickarrow:setPosition(self.trstickbase:getX(), self.trstickbase:getY())
	self.trstickkey:setPosition(self.trstickbase:getX(), self.trstickbase:getY())
	
	--[[self.fire:setPosition(device_width - margin - self.right:getWidth() - (margin/2), self.trright:getY() - (self.trright:getHeight()/2) - (self.fire:getHeight()/2))
	self.reload:setPosition(device_width - margin - (self.reload:getWidth()/2), self.fire:getY() - (margin*2) - (self.reload:getHeight()/2))
	]]--
	self.wave:setPosition((margin/10) + self.wave:getWidth(), (margin/10) + self.wave:getHeight())
	self.leftenemy:setPosition(self.wave:getX(), self.wave:getY() + (self.wave:getHeight()/2) + (margin/2))
	self.pause_button:setPosition(device_width / 2, (margin) + (self.pause_button:getHeight()/6))
	
	self.title:setPosition(device_width/2, margin*3)
	self.credit:setPosition(device_width/2, self.title:getY() + (self.title:getHeight()/2) + (margin*2))
	self.start_button:setPosition(device_width/2, device_height - self.mkill:getHeight() - (margin*3))
	
	self.gameover:setPosition(device_width/2, margin*3)
	self.mkill:setPosition(device_width/2, self.gameover:getY() + (self.gameover:getHeight()/2) + (margin*2))
	self.mwave:setPosition(device_width/2, self.mkill:getY() + (self.mkill:getHeight()/2) + (margin))
	self.restart_button:setPosition(device_width/2, device_height - self.mkill:getHeight() - (margin*3))
	
	self.pausetext:setPosition(device_width/2, device_height/3)
	self.pauseguidetext:setPosition(device_width/2, self.pausetext:getY() + self.pausetext:getHeight() + margin)
	self.exitguidetext:setPosition(device_width/2, self.pauseguidetext:getY() + self.pauseguidetext:getHeight() + margin)
	
	self.settingbutton:setPosition(margin + (self.settingbutton:getWidth()/2), device_height - margin - (self.settingbutton:getHeight()/2))
	
end

function cgui:touches_begin(event)
	
	if game_pause and self.pause_gui:getAlpha() == 1 then
		self.pause_gui:setAlpha(0)
		game_pause = false
		return
	end
	
	if self.main_gui:getAlpha() ~= 0 and game_pause and not game_ended then
		if self.start_button:hitTestPoint(event.touch.x, event.touch.y) then
			game_pause = false
			tworld:setAlpha(1)
			self.game_gui:setAlpha(1)
			self.move_gui:setAlpha(1)
			self.main_gui:setAlpha(0)
			aim:setAlpha(0.5)
			return
		elseif self.settingbutton:hitTestPoint(event.touch.x, event.touch.y) then
			csetting.new()
			return
		end
	end
	
	if self.game_gui:getAlpha() ~= 0 and not game_pause and not game_ended then
		if self.pause_button:hitTestPoint(event.touch.x, event.touch.y) then
			self.pause_gui:setAlpha(1)
			game_pause = true
			return
		end
	end
	
	if self.gameover_gui:getAlpha() ~= 0 and game_ended then
		if self.restart_button:hitTestPoint(event.touch.x, event.touch.y) then
			gui:addEventListener(Event.TOUCHES_BEGIN, gui.touches_begin, gui)
			gui:addEventListener(Event.TOUCHES_END, gui.touches_end, gui)
			reload:removeFromParent()
			health:removeFromParent()
			gui:removeFromParent()
			aim:removeFromParent()
			reload = nil
			health = nil
			wave = nil
			ai = nil
			gui = nil
			aim = nil
			tworld:destroy()
			
			main()
			return
		end
	end
	
	if self.move_gui:getAlpha() ~= 0 and not game_pause and not game_ended then
		--[[if self.up:hitTestPoint(event.touch.x, event.touch.y) then
			self.rtn.left = 1
			self.rtn.right = 1
			self.move_id = event.touch.id
			self.up:setAlpha(1)
		elseif self.down:hitTestPoint(event.touch.x, event.touch.y) then
			self.rtn.left = -1
			self.rtn.right = -1
			self.move_id = event.touch.id
			self.down:setAlpha(1)
		elseif self.right:hitTestPoint(event.touch.x, event.touch.y) then
			self.rtn.left = 1
			self.rtn.right = -1
			self.move_id = event.touch.id
			self.right:setAlpha(1)
		elseif self.left:hitTestPoint(event.touch.x, event.touch.y) then
			self.rtn.left = -1
			self.rtn.right = 1
			self.move_id = event.touch.id
			self.left:setAlpha(1)
		elseif self.upleft:hitTestPoint(event.touch.x, event.touch.y) then
			self.rtn.left = 0.5
			self.rtn.right = 1
			self.move_id = event.touch.id
			self.upleft:setAlpha(1)
		elseif self.upright:hitTestPoint(event.touch.x, event.touch.y) then
			self.rtn.left = 1
			self.rtn.right = 0.5
			self.move_id = event.touch.id
			self.upright:setAlpha(1)
		elseif self.downleft:hitTestPoint(event.touch.x, event.touch.y) then
			self.rtn.left = -0.5
			self.rtn.right = -1
			self.move_id = event.touch.id
			self.downleft:setAlpha(1)
		elseif self.downright:hitTestPoint(event.touch.x, event.touch.y) then
			self.rtn.left = -1
			self.rtn.right = -0.5
			self.move_id = event.touch.id
			self.downright:setAlpha(1)
		elseif self.trleft:hitTestPoint(event.touch.x, event.touch.y) then
			self.rtn.tr = 1
			self.turret_id = event.touch.id
			self.trleft:setAlpha(1)
		elseif self.trright:hitTestPoint(event.touch.x, event.touch.y) then
			self.rtn.tr = -1
			self.turret_id = event.touch.id
			self.trright:setAlpha(1)
		elseif self.fire:hitTestPoint(event.touch.x, event.touch.y) then
			self.rtn.fireb = true
			self.fire_id = event.touch.id
			self.fire:setAlpha(1)
		elseif self.reload:hitTestPoint(event.touch.x, event.touch.y) then
			if self.reload:getAlpha()~=0 then
				reload_tap()
			end
		end]]--
		
		if event.touch.x < device_width/2 then
			self.mvstickarrow:setAlpha(guialpha)
			self.mvstickbase:setAlpha(guialpha)
			self.mvstickkey:setAlpha(guialpha)
			self.mvstickarrow:setPosition(event.touch.x, event.touch.y)
			self.mvstickbase:setPosition(event.touch.x, event.touch.y)
			self.mvstickkey:setPosition(event.touch.x, event.touch.y)
			self.move_id = event.touch.id
		end
		
		if event.touch.x > device_width/2 then
			self.trstickarrow:setAlpha(guialpha)
			self.trstickbase:setAlpha(guialpha)
			self.trstickkey:setAlpha(guialpha)
			self.trstickarrow:setPosition(event.touch.x, event.touch.y)
			self.trstickbase:setPosition(event.touch.x, event.touch.y)
			self.trstickkey:setPosition(event.touch.x, event.touch.y)
			self.turret_id = event.touch.id
			self.trstick_mxdist = 0
			self.trstick_start = true
		end
	end
	
end

function cgui:touches_move(event)
	
	if self.move_gui:getAlpha() ~= 0 and not game_pause and not game_ended then
		--[[if event.touch.id == self.move_id then
			self.up:setAlpha(guialpha)
			self.down:setAlpha(guialpha)
			self.left:setAlpha(guialpha)
			self.right:setAlpha(guialpha)
			self.upleft:setAlpha(guialpha)
			self.upright:setAlpha(guialpha)
			self.downleft:setAlpha(guialpha)
			self.downright:setAlpha(guialpha)
			if self.up:hitTestPoint(event.touch.x, event.touch.y) then
				self.rtn.left = 1
				self.rtn.right = 1
				self.move_id = event.touch.id
				self.up:setAlpha(1)
			elseif self.down:hitTestPoint(event.touch.x, event.touch.y) then
				self.rtn.left = -1
				self.rtn.right = -1
				self.move_id = event.touch.id
				self.down:setAlpha(1)
			elseif self.right:hitTestPoint(event.touch.x, event.touch.y) then
				self.rtn.left = 1
				self.rtn.right = -1
				self.move_id = event.touch.id
				self.right:setAlpha(1)
			elseif self.left:hitTestPoint(event.touch.x, event.touch.y) then
				self.rtn.left = -1
				self.rtn.right = 1
				self.move_id = event.touch.id
				self.left:setAlpha(1)
			elseif self.upleft:hitTestPoint(event.touch.x, event.touch.y) then
				self.rtn.left = 0.5
				self.rtn.right = 1
				self.move_id = event.touch.id
				self.upleft:setAlpha(1)
			elseif self.upright:hitTestPoint(event.touch.x, event.touch.y) then
				self.rtn.left = 1
				self.rtn.right = 0.5
				self.move_id = event.touch.id
				self.upright:setAlpha(1)
			elseif self.downleft:hitTestPoint(event.touch.x, event.touch.y) then
				self.rtn.left = -0.5
				self.rtn.right = -1
				self.move_id = event.touch.id
				self.downleft:setAlpha(1)
			elseif self.downright:hitTestPoint(event.touch.x, event.touch.y) then
				self.rtn.left = -1
				self.rtn.right = -0.5
				self.move_id = event.touch.id
				self.downright:setAlpha(1)
			else
				self.rtn.left = 0
				self.rtn.right = 0
			end
		end]]--
		
		if event.touch.id == self.move_id then
			if getdistance(event.touch.x, event.touch.y, self.mvstickbase:getPosition()) <= self.mvstickbase:getWidth()/2 then
				self.mvstickkey:setPosition(event.touch.x, event.touch.y)
			else
				local tx, ty = getrotation(self.mvstickbase:getWidth()/2, self.mvstickbase:getX(), self.mvstickbase:getY(), event.touch.x, event.touch.y)
				self.mvstickkey:setPosition(self.mvstickbase:getX() + tx, self.mvstickbase:getY() + ty)
			end
		end
		
		if event.touch.id == self.turret_id then
			if getdistance(event.touch.x, event.touch.y, self.trstickbase:getPosition()) <= self.trstickbase:getWidth()/2 then
				self.trstickkey:setPosition(event.touch.x, event.touch.y)
			else
				local tx, ty = getrotation(self.trstickbase:getWidth()/2, self.trstickbase:getX(), self.trstickbase:getY(), event.touch.x, event.touch.y)
				self.trstickkey:setPosition(self.trstickbase:getX() + tx, self.trstickbase:getY() + ty)
			end
			if getdistance(event.touch.x, event.touch.y, self.trstickbase:getPosition()) > self.trstick_mxdist then
				self.trstick_mxdist = getdistance(event.touch.x, event.touch.y, self.trstickbase:getPosition())
			end
		end
		
		--[[if event.touch.id == self.turret_id then
			self.trleft:setAlpha(guialpha)
			self.trright:setAlpha(guialpha)
			if self.trleft:hitTestPoint(event.touch.x, event.touch.y) then
				self.rtn.tr = 1
				self.turret_id = event.touch.id
				self.trleft:setAlpha(1)
			elseif self.trright:hitTestPoint(event.touch.x, event.touch.y) then
				self.rtn.tr = -1
				self.turret_id = event.touch.id
				self.trright:setAlpha(1)
			else
				self.rtn.tr = 0
			end
		end]]--
	end
	
end

function cgui:touches_end(event)
	
	if event.touch.id == self.move_id then
		self.rtn.left = 0
		self.rtn.right = 0
		self.move_id = 0
		--[[self.up:setAlpha(guialpha)
		self.down:setAlpha(guialpha)
		self.left:setAlpha(guialpha)
		self.right:setAlpha(guialpha)
		self.upleft:setAlpha(guialpha)
		self.upright:setAlpha(guialpha)
		self.downleft:setAlpha(guialpha)
		self.downright:setAlpha(guialpha)]]--
		self.mvstickkey:setPosition(self.mvstickbase:getX(), self.mvstickbase:getY())
		self.mvstickarrow:setAlpha(0)
		self.mvstickbase:setAlpha(0)
		self.mvstickkey:setAlpha(0)
	end
	if event.touch.id == self.turret_id then
		self.rtn.tr = 0
		self.turret_id = 0
		--[[self.trleft:setAlpha(guialpha)
		self.trright:setAlpha(guialpha)]]--
		self.trstickkey:setPosition(self.trstickbase:getX(), self.trstickbase:getY())
		self.trstickarrow:setAlpha(0)
		self.trstickbase:setAlpha(0)
		self.trstickkey:setAlpha(0)
		if self.trstick_mxdist < self.trstickbase:getWidth()/50 then
			self.trstick_tap = true
		end
		self.trstick_start = false
	end
	if event.touch.id == self.fire_id then
		self.rtn.fireb = false
		self.fire_id = 0
		--self.fire:setAlpha(guialpha)
	end
	
end

function cgui:key_down(event)
	
	if event.keyCode == KeyCode.BACK then
		if not game_pause and not game_ended then
			self.pause_gui:setAlpha(1)
			game_pause = true
		else
			application:exit()
		end
	elseif event.keyCode == KeyCode.MENU then
		if game_pause then
			csetting.new()
		else
			self.pause_gui:setAlpha(1)
			game_pause = true
			csetting.new()
		end
	end
end

function cgui:key_up(event)
	
	--rem
	
end

function cgui:application_background(event)
	if not game_pause and not game_ended then
		self.pause_gui:setAlpha(1)
		game_pause = true
	end
end

function cgui:rtnv()
	
	self.wave.sprite:refreshpos()
	self.leftenemy.sprite:refreshpos()
	self.mkill.sprite:refreshpos()
	self.mwave.sprite:refreshpos()
	self.wave:setPosition((margin/10) + self.wave:getWidth(), (margin/10) + self.wave:getHeight())
	self.leftenemy:setPosition(self.wave:getX(), self.wave:getY() + (self.wave:getHeight()/2) + (margin/2))
	self.mkill:setPosition(device_width/2, self.gameover:getY() + (self.gameover:getHeight()/2) + (margin*2))
	self.mwave:setPosition(device_width/2, self.mkill:getY() + (self.mkill:getHeight()/2) + (margin))
	
	local mvang = math.deg(math.atan2(self.mvstickkey:getX() - self.mvstickbase:getX(), self.mvstickbase:getY() - self.mvstickkey:getY())) %360
	local trang = math.deg(math.atan2(self.trstickkey:getX() - self.trstickbase:getX(), self.trstickbase:getY() - self.trstickkey:getY())) %360
	local mvfactor = getdistance(self.mvstickkey:getX(), self.mvstickkey:getY(), self.mvstickbase:getX(), self.mvstickbase:getY()) / (self.mvstickbase:getWidth()/2)
	local tnmvang = (2-math.abs(math.tan(math.rad(mvang))))/2
	local trfactor = (self.trstickkey:getX() - self.trstickbase:getX()) / (self.trstickbase:getWidth()/2)
	
	self.rtn.left = 0
	self.rtn.right = 0
	self.rtn.tr = 0
	self.rtn.fireb = false
	
	if mvang>=60 and mvang<=120 then
		self.rtn.left = mvfactor
		self.rtn.right = -mvfactor
	elseif mvang>=240 and mvang<=300 then
		self.rtn.left = -mvfactor
		self.rtn.right = mvfactor
	elseif mvang>=0 and mvang<=90 then
		self.rtn.left = mvfactor
		self.rtn.right = tnmvang * mvfactor
	elseif mvang>=90 and mvang<=180 then
		self.rtn.left = -mvfactor
		self.rtn.right = -tnmvang * mvfactor
	elseif mvang>=180 and mvang<=270 then
		self.rtn.right = -mvfactor
		self.rtn.left = -tnmvang * mvfactor
	elseif mvang>=270 and mvang<=360 then
		self.rtn.right = mvfactor
		self.rtn.left = tnmvang * mvfactor
	end
	
	self.rtn.tr = -trfactor
	
	if self.trstick_tap and not self.trstick_start then
		if self.reloading then
			reload_tap()
			self.trstick_tap = false
		else
			self.rtn.fireb = true
			self.trstick_tap = false
		end
	end
	
	return self.rtn.left, self.rtn.right, self.rtn.tr, self.rtn.fireb
end
