
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
	
	self.guide_gui = Sprite.new()
	self.guide_gui:setAlpha(0)
	self:addChild(self.guide_gui)
	
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
	
	self.fire_id = 0
	self.fire_mxdist = 0
	self.fire_start = false
	self.fire_pos = {}
	self.fire_pos.x = 0
	self.fire_pos.y = 0
	
	self.reloading = false
	
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
	
	self.mainscreen = Sprite.new()
	self.mainscreen:setScale(guiscale)
	self.mainscreen.sprite = Bitmap.new(Texture.new("Sprite/GUI/mainscreen.png"))
	self.mainscreen.sprite:setScale(0.16)
	self.mainscreen:addSprite(self.mainscreen.sprite)
	self.main_gui:addChild(self.mainscreen)
	
	self.title = Sprite.new()
	self.title:setScale(guiscale)
	self.title.sprite = TextField.new(nil, "Tiger Ace")
	self.title.sprite:setScale(5/2)
	self.title:addText(self.title.sprite)
	--self.main_gui:addChild(self.title)
	
	self.credit = Sprite.new()
	self.credit:setScale(guiscale)
	self.credit.text1 = TextField.new(nil, "Made By World of Chicken")
	self.credit.text1:setScale(3/4)
	self.credit.text2 = TextField.new(nil, "of Maseok High School")
	self.credit.text2:setScale(3/4)
	self.credit:addText(self.credit.text1)
	self.credit:addText(self.credit.text2)
	self.credit.text2:setY(self.credit.text2:getY() + (self.credit.text1:getHeight()/2) + 5)
	--self.main_gui:addChild(self.credit)
	
	self.start_button = Sprite.new()
	self.start_button:setScale(guiscale)
	--[[self.start_button.text = TextField.new(nil, "Start")
	self.start_button.sprite = Shape.new()
	self.start_button.sprite:setFillStyle(Shape.SOLID, 0x00ff00)
	self.start_button.sprite:drawbox(0, 0, self.start_button.text:getWidth() + 20, self.start_button.text:getHeight() + 20)
	self.start_button:addSprite(self.start_button.sprite)
	self.start_button:addText(self.start_button.text)]]--
	self.start_button.sprite = Bitmap.new(Texture.new("Sprite/GUI/startbutton.png"))
	self.start_button:setScale(2/3)
	self.start_button:addSprite(self.start_button.sprite)
	self.main_gui:addChild(self.start_button)
	
	self.startguidetext = Sprite.new()
	self.startguidetext:setScale(guiscale)
	self.startguidetext.lefttext = Sprite.new()
	self.startguidetext.righttext = Sprite.new()
	self.startguidetext.lefttext.text1 = TextField.new(nil, "Drag left screen")
	self.startguidetext.lefttext.text2 = TextField.new(nil, "to move the tank")
	self.startguidetext.righttext.text1 = TextField.new(nil, "Drag right screen")
	self.startguidetext.righttext.text2 = TextField.new(nil, "to rotate the turret")
	self.startguidetext.righttext.text3 = TextField.new(nil, "Tap right screen")
	self.startguidetext.righttext.text4 = TextField.new(nil, "to fire and reload")
	self.startguidetext.lefttext.text1:setScale(3/4)
	self.startguidetext.lefttext.text2:setScale(3/4)
	self.startguidetext.righttext.text1:setScale(3/4)
	self.startguidetext.righttext.text2:setScale(3/4)
	self.startguidetext.righttext.text3:setScale(3/4)
	self.startguidetext.righttext.text4:setScale(3/4)
	self.startguidetext.lefttext:addText(self.startguidetext.lefttext.text1)
	self.startguidetext.lefttext:addText(self.startguidetext.lefttext.text2)
	self.startguidetext.lefttext.text2:setY(self.startguidetext.lefttext.text2:getY() + self.startguidetext.lefttext.text2:getHeight() + 3)
	self.startguidetext.righttext:addText(self.startguidetext.righttext.text1)
	self.startguidetext.righttext:addText(self.startguidetext.righttext.text2)
	self.startguidetext.righttext:addText(self.startguidetext.righttext.text3)
	self.startguidetext.righttext:addText(self.startguidetext.righttext.text4)
	self.startguidetext.righttext.text2:setY(self.startguidetext.righttext.text1:getY() + self.startguidetext.righttext.text2:getHeight() + 3)
	self.startguidetext.righttext.text3:setY(self.startguidetext.righttext.text2:getY() + self.startguidetext.righttext.text3:getHeight() + 3)
	self.startguidetext.righttext.text4:setY(self.startguidetext.righttext.text3:getY() + self.startguidetext.righttext.text4:getHeight() + 3)
	self.startguidetext:addChild(self.startguidetext.lefttext)
	self.startguidetext:addChild(self.startguidetext.righttext)
	self.startguidetext.lefttext:setX(-(self.startguidetext.lefttext:getWidth()/2 + 10))
	self.startguidetext.righttext:setX((self.startguidetext.righttext:getWidth()/2))
	self.guide_gui:addChild(self.startguidetext)
	
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
	
	self.defguideguitimer = 300
	self.guideguitimer = self.defguideguitimer
	self.guidetexting = false
	
	self.tank = tiger
	
	self:addEventListener(Event.TOUCHES_BEGIN, self.touches_begin, self)
	self:addEventListener(Event.TOUCHES_MOVE, self.touches_move, self)
	self:addEventListener(Event.TOUCHES_END, self.touches_end, self)
	self:addEventListener(Event.KEY_DOWN, self.key_down, self)
	self:addEventListener(Event.KEY_UP, self.key_up, self)
	self:addEventListener(Event.APPLICATION_BACKGROUND, self.application_background, self)
	
	stage:addChild(self)
	
end

function cgui:guisetposition()
	
	if not movefloatingstick then
		self.mvstickarrow:setAlpha(guialpha)
		self.mvstickbase:setAlpha(guialpha)
		self.mvstickkey:setAlpha(guialpha)
	end
	if not turretfloatingstick then
		self.trstickarrow:setAlpha(guialpha)
		self.trstickbase:setAlpha(guialpha)
		self.trstickkey:setAlpha(guialpha)
	end
	
	self.mvstickbase:setPosition(margin + (self.mvstickarrow:getWidth()/2), device_height - margin - (self.mvstickarrow:getHeight()/2))
	self.mvstickarrow:setPosition(self.mvstickbase:getX(), self.mvstickbase:getY())
	self.mvstickkey:setPosition(self.mvstickbase:getX(), self.mvstickbase:getY())
	
	self.trstickbase:setPosition(device_width - margin - (self.trstickarrow:getWidth()/2), device_height - margin - (self.trstickarrow:getHeight()/2))
	self.trstickarrow:setPosition(self.trstickbase:getX(), self.trstickbase:getY())
	self.trstickkey:setPosition(self.trstickbase:getX(), self.trstickbase:getY())
	
	self.wave:setPosition((margin/10) + self.wave:getWidth(), (margin/10) + self.wave:getHeight())
	self.leftenemy:setPosition(self.wave:getX(), self.wave:getY() + (self.wave:getHeight()/2) + (margin/2))
	self.pause_button:setPosition(device_width / 2, (margin) + (self.pause_button:getHeight()/6))
	
	self.mainscreen:setPosition(device_width/2, device_height/2)
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
	
	self.startguidetext:setPosition(device_width/2, device_height/2)
	
	self.trstickarrow:setRotation(0)
end

function cgui:touches_begin(event)
	
	if settingpage:getAlpha() == 1 then
		return
	end
	
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
			self.guide_gui:setAlpha(1)
			aim:setAlpha(0.5)
			self.guideguitimer = self.defguideguitimer
			self.guidetexting = true
			return
		elseif self.settingbutton:hitTestPoint(event.touch.x, event.touch.y) then
			settingpage:start_setting()
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
		if movefloatingstick then
			if event.touch.x < device_width/2 then
				self.mvstickarrow:setAlpha(guialpha)
				self.mvstickbase:setAlpha(guialpha)
				self.mvstickkey:setAlpha(guialpha)
				self.mvstickarrow:setPosition(event.touch.x, event.touch.y)
				self.mvstickbase:setPosition(event.touch.x, event.touch.y)
				self.mvstickkey:setPosition(event.touch.x, event.touch.y)
				self.move_id = event.touch.id
			end
		else
			if self.mvstickbase:hitTestPoint(event.touch.x, event.touch.y) then
				if getdistance(event.touch.x, event.touch.y, self.mvstickbase:getPosition()) <= self.mvstickbase:getWidth()/2 then
					self.mvstickkey:setPosition(event.touch.x, event.touch.y)
				else
					local tx, ty = getrotation(self.mvstickbase:getWidth()/2, self.mvstickbase:getX(), self.mvstickbase:getY(), event.touch.x, event.touch.y)
					self.mvstickkey:setPosition(self.mvstickbase:getX() + tx, self.mvstickbase:getY() + ty)
				end
				self.move_id = event.touch.id
			end
		end
		if turretfloatingstick then
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
		else
			if self.trstickbase:hitTestPoint(event.touch.x, event.touch.y) then
				if getdistance(event.touch.x, event.touch.y, self.trstickbase:getPosition()) <= self.trstickbase:getWidth()/2 then
					self.trstickkey:setPosition(event.touch.x, event.touch.y)
				else
					local tx, ty = getrotation(self.trstickbase:getWidth()/2, self.trstickbase:getX(), self.trstickbase:getY(), event.touch.x, event.touch.y)
					self.trstickkey:setPosition(self.trstickbase:getX() + tx, self.trstickbase:getY() + ty)
				end
				if getdistance(event.touch.x, event.touch.y, self.trstickbase:getPosition()) > self.trstick_mxdist then
					self.trstick_mxdist = getdistance(event.touch.x, event.touch.y, self.trstickbase:getPosition())
				end
				self.turret_id = event.touch.id
			end
			
			if event.touch.x > device_width/2 then
				self.fire_id = event.touch.id
				self.fire_mxdist = 0
				self.fire_start = true
				self.fire_pos.x = event.touch.x
				self.fire_pos.y = event.touch.y
			end
		end
	end
	
end

function cgui:touches_move(event)
	
	if self.move_gui:getAlpha() ~= 0 and not game_pause and not game_ended then
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
			if turretfloatingstick then
				if getdistance(event.touch.x, event.touch.y, self.trstickbase:getPosition()) > self.trstick_mxdist then
					self.trstick_mxdist = getdistance(event.touch.x, event.touch.y, self.trstickbase:getPosition())
				end
			end
		end
		
		if not turretfloatingstick and event.touch.id == self.fire_id then
			if getdistance(event.touch.x, event.touch.y, self.fire_pos.x, self.fire_pos.y) > self.fire_mxdist then
				self.fire_mxdist = getdistance(event.touch.x, event.touch.y, self.fire_pos.x, self.fire_pos.y)
			end
		end
	end
	
end

function cgui:touches_end(event)
	
	if event.touch.id == self.move_id then
		self.rtn.left = 0
		self.rtn.right = 0
		self.move_id = 0
		self.mvstickkey:setPosition(self.mvstickbase:getX(), self.mvstickbase:getY())
		if movefloatingstick then
			self.mvstickarrow:setAlpha(0)
			self.mvstickbase:setAlpha(0)
			self.mvstickkey:setAlpha(0)
		end
	end
	if event.touch.id == self.turret_id then
		self.rtn.tr = 0
		self.turret_id = 0
		self.trstickkey:setPosition(self.trstickbase:getX(), self.trstickbase:getY())
		if turretfloatingstick then
			self.trstickarrow:setAlpha(0)
			self.trstickbase:setAlpha(0)
			self.trstickkey:setAlpha(0)
			if self.trstick_mxdist < self.trstickbase:getWidth()/30 then
				self.trstick_tap = true
			end
			self.trstick_start = false
		end
	end
	if not turretfloatingstick and event.touch.id == self.fire_id then
		if self.fire_mxdist < self.trstickbase:getWidth()/30 then
			self.trstick_tap = true
		end
		self.fire_id = 0
		self.fire_start = false
	end
	
end

function cgui:key_down(event)
	
	if settingpage:getAlpha() == 1 then
		return
	end
	if event.keyCode == KeyCode.BACK then
		if not game_pause and not game_ended then
			self.pause_gui:setAlpha(1)
			game_pause = true
		else
			application:exit()
		end
	elseif event.keyCode == KeyCode.MENU then
		if game_pause then
			settingpage:start_setting()
		else
			self.pause_gui:setAlpha(1)
			game_pause = true
			settingpage:start_setting()
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
	
	self.rtn.left = 0
	self.rtn.right = 0
	self.rtn.tr = 0
	self.rtn.fireb = false
	
	
	
	if controlmethod == 1 then
	
	
	
	local mvang = math.deg(math.atan2(self.mvstickkey:getX() - self.mvstickbase:getX(), self.mvstickbase:getY() - self.mvstickkey:getY())) %360
	local trang = math.deg(math.atan2(self.trstickkey:getX() - self.trstickbase:getX(), self.trstickbase:getY() - self.trstickkey:getY())) %360
	local mvfactor = math.abs(getdistance(self.mvstickkey:getX(), self.mvstickkey:getY(), self.mvstickbase:getX(), self.mvstickbase:getY()) / (self.mvstickbase:getWidth()/2))
	local tnmvang = (2-math.abs(math.tan(math.rad(mvang))))/2
	local trfactor = math.abs(getdistance(self.trstickkey:getX(), self.trstickkey:getY(), self.trstickbase:getX(), self.trstickbase:getY()) / (self.trstickbase:getWidth()/2))
	local mtang = math.deg(self.tank:getRotation())%360
	local ttang = math.deg(self.tank.turret:getAngle())%360
	
	
	if mvfactor ~= 0 then
		local mvtdiff = 0 - mtang
		local mvdesangle = mvang + mvtdiff
		if mvdesangle < 0 then
			mvdesangle = mvdesangle + 360
		end
		if mvdesangle%360 >= 240 or mvdesangle%360 <= 120 then
			--if math.abs(mvang - mtang) > 45 then
			if mvdesangle%360 > 45 and mvdesangle%360 < 315 then
				if mvdesangle > 180 then
					self.rtn.left = -mvfactor
					self.rtn.right = mvfactor
				else
					self.rtn.left = mvfactor
					self.rtn.right = -mvfactor
				end
			elseif mvdesangle%360 > 30 and mvdesangle%360 < 330 then
				if mvdesangle > 180 then
					self.rtn.left = 0
					self.rtn.right = mvfactor
				else
					self.rtn.left = mvfactor
					self.rtn.right = 0
				end
			elseif mvdesangle%360 > 15 and mvdesangle%360 < 345 then
				if mvdesangle > 180 then
					self.rtn.left = mvfactor/2
					self.rtn.right = mvfactor
				else
					self.rtn.left = mvfactor
					self.rtn.right = mvfactor/2
				end
			else
				self.rtn.left = mvfactor
				self.rtn.right = mvfactor
			end
		else
			mtang = (mtang + 180) % 360
			mvtdiff = 0 - mtang
			mvdesangle = mvang + mvtdiff
			if mvdesangle < 0 then
				mvdesangle = mvdesangle + 360
			end
			--if math.abs(mvang - mtang) > 45 then
			if mvdesangle%360 > 45 and mvdesangle%360 < 315 then
				if mvdesangle > 180 then
					self.rtn.left = -mvfactor
					self.rtn.right = mvfactor
				else
					self.rtn.left = mvfactor
					self.rtn.right = -mvfactor
				end
			elseif mvdesangle%360 > 30 and mvdesangle%360 < 330 then
				if mvdesangle > 180 then
					self.rtn.left = -mvfactor
					self.rtn.right = -mvfactor/2
				else
					self.rtn.left = -mvfactor/2
					self.rtn.right = -mvfactor
				end
			elseif mvdesangle%360 > 15 and mvdesangle%360 < 345 then
				if mvdesangle > 180 then
					self.rtn.left = -mvfactor
					self.rtn.right = 0
				else
					self.rtn.left = 0
					self.rtn.right = -mvfactor
				end
			else
				self.rtn.left = -mvfactor
				self.rtn.right = -mvfactor
			end
		end
	end
	
	local rtrfactor = math.cos(math.rad(trang - ttang - 90)) * trfactor
	self.trstickarrow:setRotation(ttang)
	self.rtn.tr = -rtrfactor
	
	
	
	elseif controlmethod == 2 then
	
	
	
	local mvang = math.deg(math.atan2(self.mvstickkey:getX() - self.mvstickbase:getX(), self.mvstickbase:getY() - self.mvstickkey:getY())) %360
	local trang = math.deg(math.atan2(self.trstickkey:getX() - self.trstickbase:getX(), self.trstickbase:getY() - self.trstickkey:getY())) %360
	local mvfactor = getdistance(self.mvstickkey:getX(), self.mvstickkey:getY(), self.mvstickbase:getX(), self.mvstickbase:getY()) / (self.mvstickbase:getWidth()/2)
	local tnmvang = (2-math.abs(math.tan(math.rad(mvang))))/2
	local trfactor = (self.trstickkey:getX() - self.trstickbase:getX()) / (self.trstickbase:getWidth()/2)
	
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
	
	
	
	end
	
	
	
	if self.trstick_tap and not self.trstick_start and not self.fire_start then
		if self.reloading then
			reload_tap()
			self.trstick_tap = false
		else
			self.rtn.fireb = true
			self.trstick_tap = false
		end
	end
	
	if self.guidetexting then
		self.guideguitimer = self.guideguitimer - 1
		if self.guideguitimer <= 0 then
			self.guide_gui:setAlpha(self.guide_gui:getAlpha() - 0.03)
			if self.guide_gui:getAlpha() <= 0 then
				self.guidetexting = false
			end
		end
	end
	
	return self.rtn.left, self.rtn.right, self.rtn.tr, self.rtn.fireb
end
