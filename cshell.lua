
cshell = Core.class(Sprite)

function drawbox(self, x, y, width, height)
	self:moveTo(x, y)
	self:beginPath()
	self:lineTo(x+width, y)
	self:lineTo(x+width, y+height)
	self:lineTo(x, y+height)
	self:lineTo(x, y)
	self:endPath()
end

function cshell:init(world, x, y, tx, ty, size, pen, damage, _who, _isPlayer)
	
	self.world = world
	
	tworld:addChild(self)
	
	local mask_shell = {}
	local mask_anti_shell = {}
	
	self.isPlayer = _isPlayer
	
	if self.isPlayer then
		mask_shell = mask.player_shell
		mask_anti_shell = mask.object + mask.armor
	else
		mask_shell = mask.shell
		mask_anti_shell = mask.object + mask.player_armor
	end
	
	self.sprite = Sprite.new()
	self.sprite:setScale(scale)
	self.sprite.texture = Bitmap.new(Texture.new("Sprite/Tank/shell.png"))
	self.sprite:addSprite(self.sprite.texture)
	self:addChild(self.sprite)
	
	self.sprite:setAlpha(0.5)
	
	self.body = self.world:createBody{type = b2.DYNAMIC_BODY, position = {x=x, y=y}, fixedRodation = true}
	self.body.name = "shell"
	self.body.poly = b2.PolygonShape.new()
	self.body.circle = b2.CircleShape.new(0, 0, self.sprite:getWidth()/4)
	self.body.fixture = self.body:createFixture({shape = self.body.circle, density = 8000, friction = 0.74, restitution = 0.83})
	self.body.fixture:setFilterData({categoryBits = mask_shell, maskBits = mask_anti_shell, groupIndex = 0})
	self.body:setBullet(true)
	
	self.body.angle = math.deg(math.atan2(ty, tx) + (math.pi))
	
	self.body:setAngle(math.atan2(ty, tx) + math.rad(90))
	self.body:setLinearVelocity(tx, ty)
	
	self.sprite:setPosition(self.body:getPosition())
	self.sprite:setRotation(math.deg(self.body:getAngle()))
	
	self.body.pen = pen
	self.body.damage = damage
	
	self.body.parent = self
	self.who = _who
	
	self.timer = self.who.fire_rate - 50
	
	self.body.ricocheted = false
	
	self.world:addEventListener(Event.BEGIN_CONTACT, self.begin_contact, self)
	
	table.insert(shells, self)
	
end

function cshell:enter_frame(event)
	if not self.destroyed then
		local cx, cy = self.body:getLinearVelocity()
		if math.abs(cx)<1 and math.abs(cy)<1 then
			cx=0
			cy=0
		end
		if (cx==0 and cy==0) or self.timer == 0 then
			if not self.who.isPlayer then
				self.who.missed = true
			end
			self:destroy()
			return
		end
		
		if not self.body.ricocheted then
			--self.body:setLinearVelocity(cx*(99/100), cy*(99/100))
			self.timer = self.timer - 1
		else
			self.body:setLinearVelocity(cx*(4/5), cy*(4/5))
		end
		
		self.body.angle = math.deg(math.atan2(cy, cx))%360
		
		self.sprite:setPosition(self.body:getPosition())
		self.sprite:setRotation(math.deg(self.body:getAngle()))
		
		
	end
end

function cshell:destroy()
	--self.world:destroyBody(self.body)
	self.destroyed = true
	self = nil
end

function cshell:begin_contact(event)
	
	local t_armor, t_shell = {}, {}
	
	if event.fixtureA:getBody().name == "armor" and event.fixtureB:getBody().name == "shell" then
		t_armor = event.fixtureA:getBody()
		t_shell = event.fixtureB:getBody()
	elseif event.fixtureB:getBody().name == "armor" and event.fixtureA:getBody().name == "shell" then
		t_shell = event.fixtureA:getBody()
		t_armor = event.fixtureB:getBody()
	else
		return
	end
	
	if t_shell.parent.destroyed or t_shell.ricocheted then
		return
	end
	
	local armor_angle, shell_angle = t_armor.angle, t_shell.angle
	local angle_diff = math.abs(90 - (math.abs(armor_angle - shell_angle)%180))
	
	local armor_thick, shell_pen = t_armor.thick, t_shell.pen
	
	local angled_armor = armor_thick * (1/(math.sin(math.rad(angle_diff))))
	
	if t_armor.parent.destroyed then
		sound = csound.new(l_sound.pierce[math.random(3)])
		
		local i = math.random(3) + 3
		repeat
			local a = armor_angle + math.random(180) - 180
			local sh = Shape:new()
			sh:setFillStyle(Shape.SOLID, 0x695454)
			sh:drawbox(0, 0, 2, 2)
			local particle = cparticle.new(sh, a, 3, 14/15)
			particle:setPosition(t_shell:getPosition())
			i = i - 1
		until i<=0
		
		t_shell.parent:destroy()
		
		return
	end
	
	if shell_pen >= angled_armor then
		
		local f_damage = (shell_pen / (angled_armor*2)) * t_shell.damage
		
		msg = cmsg.new("-" .. round(f_damage))
		msg:setPosition(t_shell:getPosition())
		
		sound = csound.new(l_sound.pierce[math.random(3)])
		
		local i = math.random(3) + 3
		repeat
			local a = armor_angle + math.random(180) - 180
			local sh = Shape:new()
			sh:setFillStyle(Shape.SOLID, 0x695454)
			sh:drawbox(0, 0, 4, 4)
			local particle = cparticle.new(sh, a, 3, 14/15)
			particle:setPosition(t_shell:getPosition())
			i = i - 1
		until i<=0
		
		if not t_shell.parent.who.isPlayer then
			t_shell.parent.who.hityou = true
		end
		
		t_armor.parent:getHit(f_damage)
		t_shell.parent:destroy()
	else
		msg = cmsg.new("Ricochet")
		msg:setPosition(t_shell:getPosition())
		
		sound = csound.new(l_sound.ricochet[math.random(3)])
		
		local i = math.random(3) + 3
		repeat
			local a = armor_angle + math.random(180) - 180
			local sh = Shape:new()
			sh:setFillStyle(Shape.SOLID, 0xffff00)
			sh:drawbox(0, 0, 3, 12)
			local particle = cparticle.new(sh, a, 5, 14/15)
			particle:setPosition(t_shell:getPosition())
			i = i - 1
		until i<=0
		
		if not t_shell.parent.who.isPlayer then
			t_shell.parent.who.ricochet_count = t_shell.parent.who.ricochet_count + 1
			t_shell.parent.who.ricocheted = true
		end
		t_shell.ricocheted = true
	end
	
end

