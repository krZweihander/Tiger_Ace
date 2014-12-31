
cwave = Core.class(Sprite)

function cwave:init(_mytank, _enemytank, _world)
	
	self.mytank = _mytank
	self.enemytank = _enemytank
	self.world = _world
	
	self.enemy_qty = 1
	self.plus_qty = 2
	self.spawn_qty = 0
	self.now_qty = 0
	self.left_qty = 0
	self.diff_cnt = 0
	self.rpt_spawn = 1
	
	self.wave = 0
	
	self.spawning = false
	
	self.timer = 0
	self.spawn_delay = 500
	
	self.actor = {}
	
end

function cwave:rspawn(_angle, distance, index)
	
	local angle = math.rad(_angle)
	
	local tx = (math.cos(angle) * distance) + self.mytank:getX()
	local ty = (math.sin(angle) * distance) + self.mytank:getY()
	
	self.actor[index] = ctank.new(self.world, self.enemytank, tx, ty)
	
	alert = calert.new(self.mytank, self.actor[index])
	
end

function cwave:spawn_frame()
	
	if self.timer>0 then
		self.timer = self.timer - 1
	else
		self.timer = self.spawn_delay + math.randpm(300)
		
		local i = math.random(self.rpt_spawn)
		
		repeat
			if self.spawn_qty<=0 then
				self.spawning = false
				return
			end
			
			local angle = math.random(360)
			local distance = ((device_width + device_height) * (3/2)) + math.randpm(self.enemytank.range * (1/4))
			
			self.now_qty = self.now_qty + 1
			self.spawn_qty = self.spawn_qty - 1
			self:rspawn(angle, distance, self.spawn_qty)
			i = i - 1
		until i <= 0
	end
	
end

function cwave:enter_frame(event)

	if self.spawning and not self.mytank.destroyed then
		self:spawn_frame()
	end
	
	for i, v in pairs(self.actor) do
		if v.destroyed then
			self.now_qty = self.now_qty - 1
			self.left_qty = self.left_qty - 1
			self.actor[i] = nil
		end
	end
	
	if self.now_qty <= 0 and not self.spawning then
		self:next_wave()
	end
	
	if self.mytank.destroyed then
		self.spawning = false
		self:game_over()
	end
	
	gui.leftenemy.sprite:setText("Enemy " .. self.left_qty)
	
end

function cwave:spawn()
	self.spawning = true
end

function cwave:next_wave()

	self.enemy_qty = self.enemy_qty + math.random(self.plus_qty)
	self.left_qty = self.enemy_qty
	self.now_qty = 0
	self.spawn_qty = self.enemy_qty
	self.wave = self.wave + 1
	self.diff_cnt = self.diff_cnt + 1
	
	if self.diff_cnt >= 5 then
		self.rpt_spawn = self.rpt_spawn + 1
		self.diff_cnt = 1
	end
	
	gui.wave.sprite:setText("Wave " .. self.wave)
	tiger.health = tiger.health + (tiger.mhealth * (1/4))
	if tiger.health > tiger.mhealth then
		tiger.health = tiger.mhealth
	end
	
	self:spawn()
	
end

function cwave:game_over()
	
	gui.mwave.sprite:setText("Wave : " .. (self.wave))
	gui.mkill.sprite:setText("Kill : " .. kills)
	gui.move_gui:setAlpha(0)
	gui.game_gui:setAlpha(0)
	aim:setAlpha(0)
	gui.gameover_gui:setAlpha(1)
	game_ended = true
	
end