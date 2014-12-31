
chealth = Core.class(Sprite)

function chealth:init(_tank)
	
	self.tank = _tank
	
	self:setScale(scale)
	
	self.border = Shape.new()
	self.border:setFillStyle(Shape.SOLID, 0x000000)
	self.border:drawbox(0, 0, 290, 40)
	self:addSprite(self.border)
	
	self.background = Shape.new()
	self.background:setFillStyle(Shape.SOLID, 0xffffff)
	self.background:drawbox(0, 0, 280, 30)
	self:addSprite(self.background)
	
	self.bar = Shape.new()
	self.bar:setFillStyle(Shape.SOLID, 0xff0000)
	self.bar:drawbox(0, 0, 280, 30)
	self:addSprite(self.bar)
	
end

function chealth:enter_frame(hp)
	
	self:setPosition(self.tank:getX(), self.tank:getY() + (self.tank.sprite:getHeight() / 2) + (50 * scale))
	--self:setPosition(0, 0)
	
	self.bar:setScaleX(hp)
	self.bar:setX(self.background:getX())
	
end

function chealth:destroy()

	self.tank = nil
	self.border = nil
	self.background = nil
	self.bar = nil
	
	self = nil
	
end