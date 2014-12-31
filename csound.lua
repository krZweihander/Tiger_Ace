
csound = Core.class(Sprite)

function csound:init(_sound, _volume)
	
	self.volume = _volume or 1
	
	self.sound = Sound.new(_sound)
	
	self.channel = self.sound:play()
	
	if self.channel then
		self.channel:setVolume(volume_scale * self.volume)
	end
	
	self:addEventListener(Event.COMPLETE, self.complete, self)
end

function csound:setvolume(_volume)
	
	if self.channel then
		self.channel:setVolume(volume_scale * _volume)
	end
	
end

function csound:setlooping(b)
	
	self.channel:setLooping(b)
	
end

function csound:destroy()
	
	self.channel:stop()
	self.channel = nil
	self.sound = nil
	self.volume = nil
	self = nil
	
end

function csound:complete(event)
	
	self:destroy()
	
end