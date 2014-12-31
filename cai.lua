
cai = Core.class(Sprite)

function cai:init()
	
	self.range = 0
	
	self.phase = 0
	self.target = nil
	
	self.funcs = {}
	self.target = nil
	
	self.destroyed = false
	
	self.timer1 = 200
	
	self.funcs[0] = cai.phase0
	self.funcs[1] = cai.phase1
	self.funcs[2] = cai.phase2
	self.funcs[3] = cai.phase3
	self.funcs[4] = cai.phase4
	self.funcs[5] = cai.phase5
	self.funcs[6] = cai.phase6
	
end

function cai:enter_frame(mtank)
	self.tank = mtank
	
	self.range = mtank.range
	
	if not self.tank then
		return
	end
	
	if self.tank.destroyed then
		return
	end
	
	if self.destroyed then
		return
	end
	
	self:phasecheck(self.target)
	
	--self.funcs[self.tank.phase](self, self.target)
	self.tank:setStatue(self:setStatue())
end

function cai:found(_target)
	self.target = _target
end

function cai:phasecheck(target)
	
	self.tank.rtn.left = 0
	self.tank.rtn.right = 0
	
	self.tank.rtn.tr = 0
	
	self.tank.rtn.fireb = false
	
	if not target then
		self.tank.phase = 0
		return
	end
	
	if target.destroyed then
		target = nil
		self.tank.phase = 0
		return
	end
	
	local tx, ty = target.hull:getPosition()
	local mx, my = self.tank.hull:getPosition()
	
	local desrot = (math.deg(math.atan2(ty - my, tx - mx))+90)
	local adesrot  = (math.deg(math.atan2(my - ty, mx - tx))+180) % 360
	--local mrot = (math.deg(self.tank.hull:getAngle())) % 360
	
	local hull_angle = math.deg(self.tank.hull:getAngle())
	local adv = false
	
	local lowhealth = false
	
	if self.tank.health < 400 then
		--local tdesrot = (math.deg(math.atan2(ty - my, tx - mx))+90) % 180
		
		--if math.abs(tdesrot - mrot) % 180 < 10 then
		--	self.tank.phase = 5
		--end
		
		hull_angle = desrot + 30
		adv = false
		lowhealth = true
	end
	
	if self.tank.ricochet_count >= 2 then
		
		hull_angle = desrot + 80
		
		adv = true
	--[[else
		
		hull_angle = desrot
		adv = false
		]]--
	end
	
	if self.tank:getDistance(target) > self.range then
		hull_angle = desrot
		adv = true
		self:turret_center()
	end
	
	--if self.tank.shot_fired then
		if self.tank.ricocheted then
			if self.tank.zeroing >= 0 then
				self.tank.zeroing = self.tank.zeroing - math.random(5)
			else
				self.tank.zeroing = self.tank.zeroing + math.random(5)
			end
			self.tank.ricocheted = false
		elseif self.tank.missed then
			if self.tank.zeroing >= 0 then
				self.tank.zeroing = self.tank.zeroing - math.random(5)
			else
				self.tank.zeroing = self.tank.zeroing + math.random(5)
			end
			self.tank.missed = false
		end
		if self.tank.hityou then
			self.tank.ricochet_count = 0
			self.tank.ricocheted = false
			self.tank.hityou = false
		end
		self.tank.shot_fired = false
	--end
	
	if self.tank:getDistance(target) <= self.range then
		self:aim(target)
	end
	
	if hull_angle < 0 then
		hull_angle = hull_angle + 360
	end
	
	hull_angle = hull_angle % 360
	
	local marg = 15
	if lowhealth then
		marg = 15
	else
		marg = 15 + math.random(30)
	end
	
	self:setHullAngle(hull_angle, adv, marg)
	
end

function cai:setHullAngle(angle, adv, _margin)
	
	local marg = _margin or 15
	
	local mrot = (math.deg(self.tank.hull:getAngle())) % 360
	
	if math.abs(angle - mrot) > marg then
		local diff = 0 - mrot
		local desangle = angle + diff
		if desangle < 0 then
			desangle = desangle + 360
		end
		if desangle > 180 then
			self:rotate_left()
		else
			self:rotate_right()
		end
	elseif adv then
		self:advance()
	end
	
end

function cai:aim(target)
	
	local tx, ty = target.hull:getPosition()
	local mx, my = self.tank.hull:getPosition()
	
	local desrot = (math.deg(math.atan2(ty - my, tx - mx))+360) % 360
	local trot = (math.deg(self.tank.turret:getAngle())+450) % 360
	
	if math.abs(desrot - (trot + self.tank.zeroing)+180)%360 > 3 then
		local diff = 0 - (trot + self.tank.zeroing)
		local desangle = desrot + diff
		if desangle < 0 then
			desangle = desangle + 360
		end
		
		if desangle > 180 then
			self:turret_rotate_right()
		else
			self:turret_rotate_left()
		end
	else
		self:fire()
	end
	
end

function cai:turret_center()
	
	--local tx, ty = target.hull:getPosition()
	--local mx, my = self.tank.hull:getPosition()
	
	local desrot = (math.deg(self.tank.hull:getAngle())+270) % 360
	local trot = (math.deg(self.tank.turret:getAngle())+450) % 360
	
	if math.abs(desrot - trot)%360 > 3 then
		local diff = 0 - trot
		local desangle = desrot + diff
		if desangle < 0 then
			desangle = desangle + 360
		end
		
		if desangle > 180 then
			self:turret_rotate_right()
		else
			self:turret_rotate_left()
		end
	end
	
end

function cai:rotate_right()

	self.tank.rtn.right = -1
	self.tank.rtn.left = 1
	
end

function cai:rotate_left()
	
	self.tank.rtn.right = 1
	self.tank.rtn.left = -1
	
end

function cai:turret_rotate_right()
	
	self.tank.rtn.tr = 1
	
end

function cai:turret_rotate_left()
	
	self.tank.rtn.tr = -1
	
end

function cai:advance()
	
	self.tank.rtn.right = 1
	self.tank.rtn.left = 1
	
end

function cai:fire()
	self.tank.rtn.fireb = true
end

function cai:setStatue()
	return self.tank.rtn.left, self.tank.rtn.right, self.tank.rtn.tr, self.tank.rtn.fireb
end
