
calert = Core.class(Sprite)

function calert:init(_mytank, _enmtank)
	
	self:setScale(guiscale)
	self:setAlpha(0)
	
	self.sprite = Bitmap.new(Texture.new("Sprite/GUI/alert.png"))
	self.sprite:setScale(1/10)
	self:addSprite(self.sprite)
	
	self.mytank = _mytank
	self.enmtank = _enmtank
	
	self.destroyed = false
	
	local mx, my = tworld:getPosition()
	local ex, ey = self.enmtank:getPosition()
	local dw, dh = device_width / 2, device_height / 2
	local tx, ty = getrotation(dh - (self.sprite:getWidth()/2), mx, my, ex, ey)--0, 0
	
	self:setPosition(tx, ty)
	
	--tworld:addChild(self)
	gui.game_gui:addChild(self)
	table.insert(alerts, self)
	
end

function calert:enter_frame(event)
	
	if not self.enmtank or self.enmtank.destroyed or not self.mytank or self.mytank.destroyed then
		self:destroy()
		return
	end
	
	local dw, dh = device_width / 2, device_height / 2
	local mx, my = tworld:getPosition()--self.mytank:getPosition()--
	local mtx, mty = self.mytank:getPosition()
	mx = dw - mx
	my = dh - my
	local ex, ey = self.enmtank:getPosition()
	
	if self:getAlpha() == 0 then
		if getdistance(mtx, mty, ex, ey) < self.mytank.range then
			self:setAlpha(1)
		end
	end
	
	if self.destroyed or self:getAlpha() == 0 then
		return
	end
	
	if getdistance(mx, my, ex, ey) < dh + (self.sprite:getWidth()/2) then
		self:setAlpha(0)
		return
	end
	
	local tx, ty = getrotation(dh - (self.sprite:getWidth()/2), mx, my, ex, ey)--0, 0
	
	self:setPosition(tx + dw, ty + dh)
end

function calert:destroy()
	
	self.destroyed = true
	self = nil
	
end
