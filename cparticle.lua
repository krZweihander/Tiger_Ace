
cparticle = Core.class(Sprite)

function cparticle:init(_sprite, _angle, _speed, _slowrate, _sizerate, _turnrate, _alpha)
	
	tworld:addChild(self)
	
	self:setAlpha(_alpha or 1)
	
	self:setScale(scale*3)
	
	self.sprite = _sprite
	self:addSprite(self.sprite)
	
	self.angle = _angle
	self.speed = _speed
	
	self.slowrate = _slowrate or (4/5)
	self.sizerate = _sizerate or 1
	self.turnrate = _turnrate or 1
	
	self:setRotation(self.angle)
	
	table.insert(particles, self)
	
end

function cparticle:enter_frame(event)
	
	self.speed = self.speed * self.slowrate
	self:setScale(self:getScale() * self.sizerate)
	self:setRotation(self:getRotation() * self.turnrate)
	
	local dx, dy = 0, 0
	dx = math.cos(math.rad(self.angle-90)) * self.speed
	dy = math.sin(math.rad(self.angle-90)) * self.speed
	dx = dx + self:getX()
	dy = dy + self:getY()
	
	self:setPosition(dx, dy)
	
	if self.speed < 1 then
		self:destroy()
	end
	
end

function cparticle:destroy()
	self.destroyed = true
end