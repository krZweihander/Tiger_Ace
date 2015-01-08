
caim = Core.class(Sprite)

function caim:init(_tank)
	
	--self:setAlpha(0.8)
	self:setAlpha(0)
	self:setScale(guiscale/2)
	
	self.tank = _tank
	
	self.aim = Sprite.new()
	self.aim.sprite = Bitmap.new(Texture.new("Sprite/GUI/aim.png"))
	self.aim:addSprite(self.aim.sprite)
	self:addChild(self.aim)
	
	self.aiming_line = Sprite.new()
	self.aiming_line.line = Bitmap.new(Texture.new("Sprite/GUI/aiming_line.png"))
	self.aiming_line.line:setScale(1.2, 1.5)
	self.aiming_line:addSprite(self.aiming_line.line)
	self:addChild(self.aiming_line)
	
	--self.aim:setPosition(device_width/2, device_height/2)
	--self.aiming_line:setPosition(device_width/2, device_height/2)
	self:setPosition(device_width/2, device_height/2)
	
	--stage:addChild(self)
	tworld:addChild(self)
end

function caim:setTank(_tank)
	self.tank = _tank
end

function caim:enter_frame()
	
	if self.tank.destroyed or not self.tank then
		self:setAlpha(0)
		return
	end
	
	local cx, cy = self.tank.turret:getPosition()
	local ta = self.tank.turret:getAngle()
	local lta = math.rad(gui.trdesang)
	local ts = self.tank.range / 4
	local dx, dy = ts*(5/3) * math.sin(ta), -ts*(5/3) * math.cos(ta)
	local ldx, ldy = ts*(5/3) * math.sin(lta), -ts*(5/3) * math.cos(lta)
	
	--self.aiming_line:setRotation(math.deg(lta))
	--self.aiming_line:setPosition(cx + ldx, cy + ldy)
	self.aiming_line:setRotation(math.deg(ta))
	--self.aim:setPosition(cx + dx, cy + dy)
	self:setPosition(cx + dx, cy + dy)
	
	
end
