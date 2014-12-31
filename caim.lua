
caim = Core.class(Sprite)

function caim:init(_tank)
	
	--self:setAlpha(0.8)
	self:setAlpha(0)
	self:setScale(guiscale/2)
	
	self.tank = _tank
	
	self.aim = Bitmap.new(Texture.new("Sprite/GUI/aim.png"))
	self:addSprite(self.aim)
	
	self.aiming_line = Sprite.new()
	self.aiming_line.line = Bitmap.new(Texture.new("Sprite/GUI/aiming_line.png"))
	self.aiming_line:addSprite(self.aiming_line.line)
	self:addChild(self.aiming_line)
	
	self:setPosition(device_width/2, device_height/2)
	
	self.x = device_width/2
	self.y = device_height/2
	
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
	
	--[[local tx, ty = self.tank.hull:getPosition()
	local mx, my = self:getPosition()
	
	local desrot = (math.deg(math.atan2(ty - my, tx - mx))+90) % 360
	
	self.aiming_line:setRotation(desrot)
	
	local trx, try = self.tank.turret:getPosition()
	--local cx, cy = self.tank.cannon:getPosition()
	
	--local dx, dy = getrotation(self.tank.range, trx, try, cx, cy)
	--dx = dx*getpn(cx - trx)
	--dy = dy*getpn(cy - try)
	
	local dx, dy = self.tank.range*(3/2) * math.sin(self.tank.turret:getAngle()), -self.tank.range*(3/2) * math.cos(self.tank.turret:getAngle())
	
	print(trx, try, dx, dy)
	
	self:setPosition(trx + dx, try + dy)]]--
	
	local cx, cy = self.tank.turret:getPosition()
	local ta = self.tank.turret:getAngle()
	local ts = self.tank.range / 4
	local dx, dy = ts*(5/3) * math.sin(ta), -ts*(5/3) * math.cos(ta)
	
	self.aiming_line:setRotation(math.deg(ta))
	self:setPosition(cx + dx, cy + dy)
	
	
end

--[[caim.setposition = caim.setPosition
function caim:setPosition(x, y)
	self.x = x
	self.y = y
end

caim.getx = caim.getX
function caim:getX()
	return self.x
end

caim.gety = caim.getY
function caim:getY()
	return self.y
end

caim.getposition = caim.getPosition
function caim:getPosition()
	return self.x, self.y
end]]--

function getpn(x)
	if x>0 then return 1 end
	if x<0 then return -1 end
	if x==0 then return 0 end
	return nil
end

function getdistance(x1, y1, x2, y2)
	return math.sqrt(((x1-x2)*(x1-x2))+((y1-y2)*(y1-y2)))
end

function getrotation(v, cx, cy, tx, ty)
	local dx = (v*(math.abs(tx-cx)))/getdistance(cx, cy, tx, ty)
	local dy = (v*(math.abs(ty-cy)))/getdistance(cx, cy, tx, ty)
	
	return dx, dy
end