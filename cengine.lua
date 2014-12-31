
cengine = Core.class(Sprite)

function cengine:init(_sound)
	
	self.sound = csound.new(_sound, 0)
	self.volume = 0
	self.sound:setlooping(true)
	
end

function cengine:setstatue(statue)
	
	local tvol = 0
	if statue == 0 then
		tvol=0.3
	elseif statue == 1 then
		tvol=0.7
	elseif statue == 2 then
		tvol=1
	end
	
	if math.abs(tvol - self.volume)<0.05 then
		self.volume = tvol
	end
	
	if self.volume>tvol then
		self.volume = self.volume - 0.05
	elseif self.volume<tvol then
		self.volume = self.volume + 0.05
	end
	
	self.sound:setvolume(self.volume)
	
end

function cengine:destroy()
	
	self.sound:destroy()
	self.sound = nil
	self.volume = nil
	self = nil
	
end