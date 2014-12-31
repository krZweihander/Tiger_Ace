
cmsg = Core.class(Sprite)

function cmsg:init(text)
	
	self:setScale(guiscale)
	
	self.text = TextField.new(nil, text)
	self:addChild(self.text)
	
	self.text:setPosition(-self.text:getWidth()/2, self.text:getHeight()/2)
	
	self.alpha = 1
	
	self.destroyed = false
	
	table.insert(msgs, self)
	tworld:addChild(self)
	
end

function cmsg:enter_frame(event)
	
	self.alpha = self.alpha - 0.05
	self:setAlpha(self.alpha)
	
	self:setY(self:getY()-0.5)
	
	if self.alpha == 0 then
		self:destroy()
	end
	
end

function cmsg:destroy()
	self.destroyed = true
end