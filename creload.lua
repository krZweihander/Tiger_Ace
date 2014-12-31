
creload = Core.class(Sprite)

function creload:init()
	
	self.reload = Sprite.new()
	self.reload:setScale(guiscale)
	self.reload.sprite = Bitmap.new(Texture.new("Sprite/GUI/reload.png"))
	self.reload:addSprite(self.reload.sprite)
	self:addChild(self.reload)
	
	self.reloader = Sprite.new()
	self.reloader:setScale(guiscale)
	self.reloader.sprite = Bitmap.new(Texture.new("Sprite/GUI/reloader.png"))
	self.reloader:addSprite(self.reloader.sprite)
	self:addChild(self.reloader)
	
	self.reload:setPosition(device_width - margin - (self.reload:getWidth()/2), margin)
	self.reloader:setPosition(self.reload:getX() - (self.reload:getWidth()/2) + self.reloader:getWidth(), margin)
	
	self:setAlpha(0)
	
	self.active = false
	
	self.taped = false
	
	self.achive = false
	
	stage:addChild(self)
	
end

function creload:enter_frame(event)
	if not self.active then return end
	
	if self.achive then
		self.reloader:setX(self.reloader:getX() + (5*guiscale))
	else
		self.reloader:setX(self.reloader:getX() + (1.5*guiscale))
	end
	
	if self.reloader:getX() >= self.reload:getX() + (self.reload:getWidth()/2) - (self.reloader:getWidth()/2) then
		self.achive = false
		self.taped = false
		self.reloader:setPosition(self.reload:getX() - (self.reload:getWidth()/2) + self.reloader:getWidth(), margin)
		reloaded()
	end
	
end

function creload:tap()
	if self.taped then return end
	
	self.taped = true
	
	local base = self.reload:getX() - (self.reload:getWidth()/2) + (self.reloader:getWidth()*2.5)
	local length = self.reload:getWidth()
	
	if self.reloader:getX() >= base + length*(1/4) and self.reloader:getX() <= base + length*(2/4) then
		self.achive = true
	else
		self.achive = false
	end
end
