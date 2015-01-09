
ctank = Core.class(Sprite)

function ctank:init(world, sort, x, y, _isPlayer)
	
	table.insert(actors, self)
	
	self:setAlpha(0)
	
	--self.hull_width = sort.hull_width
	--self.hull_height = sort.hull_height
	--self.turret_width = sort.turret_width
	--self.turret_height = sort.turret_height
	self.shell_velocity = sort.shell_velocity
	self.cannon_size = sort.cannon_size
	self.mspeed = sort.speed
	self.tspeed = sort.tspeed
	self.accel = sort.accel
	
	self.isPlayer = _isPlayer or false
	
	self.pen = sort.pen
	self.damage = sort.damage
	self.mhealth = sort.health
	self.health = sort.health
	
	self.range = sort.range
	
	self.lspeed = 0
	self.rspeed = 0
	
	self.deadtimer = sort.deadtimer
	
	self.fire_rate = sort.fire_rate
	if self.isPlayer then
		self.require_reload = true
	end
	
	self.world = world
	
	self.sprite = Sprite.new()
	self.destroyed_sprite = Sprite.new()
	self.sprite:setAlpha(1)
	self.destroyed_sprite:setAlpha(0)
	
	self.sprite.hull = Sprite.new()
	self.sprite.hull:setScale(scale)
	self.sprite.hull.texture = Bitmap.new(Texture.new(sort.sprite.hull))
	self.sprite.hull:addSprite(self.sprite.hull.texture)
	--self.sprite.hull:addChild(self.sprite.hull.texture)
	--self.sprite.hull.texture:setPosition(-sort.sprite.hull_center.x * self.sprite.hull.texture:getWidth(), -sort.sprite.hull_center.y * self.sprite.hull.texture:getHeight())
	
	self.sprite.turret = Sprite.new()
	self.sprite.turret:setScale(scale)
	self.sprite.turret.texture = Bitmap.new(Texture.new(sort.sprite.turret))
	self.sprite.turret:addChild(self.sprite.turret.texture)
	self.sprite.turret.texture:setPosition(-sort.sprite.turret_center.x * self.sprite.turret.texture:getWidth(), -sort.sprite.turret_center.y * self.sprite.turret.texture:getHeight())
	--self.sprite.turret.texture:setPosition(-sort.sprite.turret_position.x * self.sprite.hull.texture:getWidth(), -sort.sprite.turret_position * self.sprite.hull.texture:getHeight())
	
	self.sprite.cannon = Sprite.new()
	self.sprite.cannon:setScale(scale)
	self.sprite.cannon.texture = Bitmap.new(Texture.new(sort.sprite.cannon))
	self.sprite.cannon:addSprite(self.sprite.cannon.texture)
	
	self.destroyed_sprite.hull = Sprite.new()
	self.destroyed_sprite.hull:setScale(scale)
	self.destroyed_sprite.hull.texture = Bitmap.new(Texture.new(sort.sprite.destroyed.hull))
	self.destroyed_sprite.hull:addSprite(self.destroyed_sprite.hull.texture)
	
	self.destroyed_sprite.turret = Sprite.new()
	self.destroyed_sprite.turret:setScale(scale)
	self.destroyed_sprite.turret.texture = Bitmap.new(Texture.new(sort.sprite.destroyed.turret))
	self.destroyed_sprite.turret:addChild(self.destroyed_sprite.turret.texture)
	self.destroyed_sprite.turret.texture:setPosition(-sort.sprite.turret_center.x * self.destroyed_sprite.turret.texture:getWidth(), -sort.sprite.turret_center.y * self.destroyed_sprite.turret.texture:getHeight())
	
	self.destroyed_sprite.cannon = Sprite.new()
	self.destroyed_sprite.cannon:setScale(scale)
	self.destroyed_sprite.cannon.texture = Bitmap.new(Texture.new(sort.sprite.destroyed.cannon))
	self.destroyed_sprite.cannon:addSprite(self.destroyed_sprite.cannon.texture)
	
	self.sprite:addChild(self.sprite.hull)
	self.sprite:addChild(self.sprite.turret)
	self.sprite:addChild(self.sprite.cannon)
	self.destroyed_sprite:addChild(self.destroyed_sprite.hull)
	self.destroyed_sprite:addChild(self.destroyed_sprite.turret)
	self.destroyed_sprite:addChild(self.destroyed_sprite.cannon)
	self:addChild(self.sprite)
	self:addChild(self.destroyed_sprite)
	
	tworld:addChild(self)
	
	--self.sprite:setAlpha(0.1)
	
	self.hull_width = self.sprite.hull:getWidth()-(7*scale)
	self.hull_height = self.sprite.hull:getHeight()-(8*scale)
	self.turret_width = self.sprite.turret:getWidth()-(10*scale)
	self.turret_height = self.sprite.turret:getHeight()-(10*scale)
	self.cannon_width = self.sprite.cannon:getWidth()
	self.cannon_height = self.sprite.cannon:getHeight()
	--self.turret_margin = (sort.sprite.hull_center.y * self.sprite.hull.texture:getHeight())*scale
	self.turret_margin = (sort.sprite.hull_center.y * self.hull_height) - (sort.sprite.turret_center.y * self.turret_height)
	--self.turret_position = sort.sprite.turret_position
	
	self.hull = self.world:createBody{type = b2.DYNAMIC_BODY, position = {x=x, y=y}, fixedRodation = true}
	self.hull.name = "hull"
	self.hull.poly = b2.PolygonShape:new()
	self.hull.poly:setAsBox(self.hull_width, self.hull_height)
	self.hull.fixture = self.hull:createFixture({shape = self.hull.poly, density = 80000, friction = 0.74, restitution = 0.83})
	self.hull.fixture:setFilterData({categoryBits = mask.hull, maskBits = mask.hull + mask.object + mask.item, groupIndex = 0})
	self.hull.parent = self
	self.leftf = 0
	self.rightf = 0
	
	self.left = self.world:createBody{type = b2.DYNAMIC_BODY, position = {x=x-(self.hull_width/4), y=y}, fixedRodation = true}
	self.left.poly = b2.PolygonShape:new()
	self.left.poly:setAsBox(self.hull_width/2, self.hull_height)
	self.left.fixture = self.left:createFixture({shape = self.left.poly, density = 8000, friction = 0.74, restitution = 0.83})
	self.left.fixture:setFilterData({categoryBits = mask.empty, maskBits = 0, groupIndex = 0})

	self.right = self.world:createBody{type = b2.DYNAMIC_BODY, position = {x=x+(self.hull_width/4), y=y}, fixedRodation = true}
	self.right.poly = b2.PolygonShape:new()
	self.right.poly:setAsBox(self.hull_width/2, self.hull_height)
	self.right.fixture = self.right:createFixture({shape = self.left.poly, density = 8000, friction = 0.74, restitution = 0.83})
	self.right.fixture:setFilterData({categoryBits = mask.empty, maskBits = 0, groupIndex = 0})

	self.leftjoint = self.world:createJoint(b2.createWeldJointDef(self.hull, self.left, x-(self.hull_width/4), y, x-(self.hull_width/2), y))
	self.rightjoint = self.world:createJoint(b2.createWeldJointDef(self.hull, self.right, x+(self.hull_width/4), y, x+(self.hull_width/2), y))

																		---sort.sprite.turret_center.x * self.sprite.turret.texture:getWidth(), -sort.sprite.turret_center.y * self.sprite.turret.texture:getHeight()
																		--y - (self.hull_height/2) + (sort.sprite.hull_center.y * self.hull_height) - (sort.sprite.turret_center.y * self.turret_height) + (self.turret_height/2)
																		--y-(self.hull_height/2)+self.turret_margin
	self.turret = self.world:createBody{type = b2.DYNAMIC_BODY, position = {x=x, y=y - (self.hull_height/2) + (sort.sprite.hull_center.y * self.hull_height) - (sort.sprite.turret_center.y * self.turret_height) + (self.turret_height/2)}, fixedRodation = true}
	self.turret.name = "turret"
	self.turret.poly = b2.PolygonShape:new()
	self.turret.poly:setAsBox(self.turret_width, self.turret_height)
	self.turret.fixture = self.turret:createFixture({shape = self.turret.poly, density = 8000, friction = 0.74, restitution = 0.83})
	self.turret.fixture:setFilterData({categoryBits = mask.turret, maskBits = 0, groupIndex = 0})
																								--y-(self.hull_height/2)+self.turret_margin
	self.turretjoint = self.world:createJoint(b2.createRevoluteJointDef(self.hull, self.turret, x, y - (self.hull_height/2) + (sort.sprite.hull_center.y * self.hull_height)))
	
	self.cannon = self.world:createBody({type = b2.DYNAMIC_BODY, position = {x = x, y = y-(self.hull_height/2)+self.turret_margin-(self.cannon_height/2)+(2*scale)}, fixedRodation = true})
	self.cannon.name = "cannon"
	self.cannon.poly = b2.PolygonShape:new()
	self.cannon.poly:setAsBox(self.cannon_width, self.cannon_height)
	self.cannon.fixture = self.cannon:createFixture({shape = self.cannon.poly, density = 8000, friction = 0.74, restistution = 0.83})
	self.cannon.fixture:setFilterData({categoryBits = mask.cannon, maskBits = 0, groupIndex = 0})
	
	self.cannonjoint = self.world:createJoint(b2.createWeldJointDef(self.turret, self.cannon, x, y-self.turret_margin-(self.turret_height/2)))
	
	self.armor = {}
	
	local mask_armor = {}
	local mask_anti_armor = {}
	
	if self.isPlayer then
		mask_armor = mask.player_armor
		mask_anti_armor = mask.shell + mask.mapwall
	else
		mask_armor = mask.armor
		mask_anti_armor = mask.player_shell
	end
	
	self.armor.front = self.world:createBody{type = b2.DYNAMIC_BODY, position = {x = x, y = y-(self.hull_height/2)+(self.hull_height/4)}, fixedRodation = true}
	self.armor.front.name = "armor"
	self.armor.front.poly = b2.PolygonShape:new()
	self.armor.front.poly:setAsBox(self.hull_width-2, self.hull_height/2)
	self.armor.front.fixture = self.armor.front:createFixture({shape = self.armor.front.poly, density = 8000, friction = 0.74, restitution = 0.83})
	self.armor.front.fixture:setFilterData({categoryBits = mask_armor, maskBits = mask_anti_armor, groupIndex = 0})
	self.armor.front.thick = sort.armor.front
	self.armor.front.parent = self
	self.armor.front.angle = 90
	
	self.armor.front.joint = self.world:createJoint(b2.createWeldJointDef(self.hull, self.armor.front, x, y-(self.hull_height/2)+(self.hull_height/4), x, y-(self.hull_height/2)))
	
	self.armor.left = self.world:createBody{type = b2.DYNAMIC_BODY, position = {x = x-(self.hull_width/2)+(self.hull_width/4), y = y}, fixedRodation = true}
	self.armor.left.name = "armor"
	self.armor.left.poly = b2.PolygonShape:new()
	self.armor.left.poly:setAsBox(self.hull_width/2, self.hull_height-2)
	self.armor.left.fixture = self.armor.left:createFixture({shape = self.armor.left.poly, density = 8000, friction = 0.74, restitution = 0.83})
	self.armor.left.fixture:setFilterData({categoryBits = mask_armor, maskBits = mask_anti_armor, groupIndex = 0})
	self.armor.left.thick = sort.armor.left
	self.armor.left.parent = self
	self.armor.left.angle = 0
	
	self.armor.left.joint = self.world:createJoint(b2.createWeldJointDef(self.hull, self.armor.left, x, y-(self.hull_height/2)+(self.hull_width/4), x, y-(self.hull_height/2)))
	
	self.armor.right = self.world:createBody{type = b2.DYNAMIC_BODY, position = {x = x+(self.hull_width/2)-(self.hull_width/4), y = y}, fixedRodation = true}
	self.armor.right.name = "armor"
	self.armor.right.poly = b2.PolygonShape:new()
	self.armor.right.poly:setAsBox(self.hull_width/2, self.hull_height-2)
	self.armor.right.fixture = self.armor.right:createFixture({shape = self.armor.right.poly, density = 8000, friction = 0.74, restitution = 0.83})
	self.armor.right.fixture:setFilterData({categoryBits = mask_armor, maskBits = mask_anti_armor, groupIndex = 0})
	self.armor.right.thick = sort.armor.right
	self.armor.right.parent = self
	self.armor.right.angle = 180
	
	self.armor.right.joint = self.world:createJoint(b2.createWeldJointDef(self.hull, self.armor.right, x, y+(self.hull_height/2)-(self.hull_height/4), x, y+(self.hull_height/2)))
	
	self.armor.back = self.world:createBody{type = b2.DYNAMIC_BODY, position = {x = x, y = y+(self.hull_height/2)-(self.hull_height/4)}, fixedRodation = true}
	self.armor.back.name = "armor"
	self.armor.back.poly = b2.PolygonShape:new()
	self.armor.back.poly:setAsBox(self.hull_width-2, self.hull_height/2)
	self.armor.back.fixture = self.armor.back:createFixture({shape = self.armor.back.poly, density = 8000, friction = 0.74, restitution = 0.83})
	self.armor.back.fixture:setFilterData({categoryBits = mask_armor, maskBits = mask_anti_armor, groupIndex = 0})
	self.armor.back.thick = sort.armor.back
	self.armor.back.parent = self
	self.armor.back.angle = 270
	
	self.armor.back.joint = self.world:createJoint(b2.createWeldJointDef(self.hull, self.armor.back, x, y+(self.hull_height/2)-(self.hull_height/4), x, y+(self.hull_height/2)))
	
	self.fired = false
	self.fireratecount = self.fire_rate
	
	self.destroyed = false
	self.body_destroyed = false
	
	if not self.isPlayer then
		self.ricochet_count = 0
		self.ricocheted = false
		self.hityou = false
		self.missed = false
		self.shot_fired = false
		
		self.timer1 = 200
		self.phase = 0
		
		self.rtn = {}
		self.rtn.left = 0
		self.rtn.right = 0
		self.rtn.tr = 0
		self.rtn.fireb = false
		
		self.defaicount = 5
		self.aicount = self.defaicount
		self.defapplyingtimer = 10
		self.applyingtimer = self.defapplyingtimer
		
		--[[self.accel = {}
		self.accel.left = false
		self.accel.right = false
		self.accel.dleft = 0
		self.accel.dright = 0
		
		self.decel = {}
		self.decel.left = false
		self.decel.right = false
		self.decel.dleft = 0
		self.decel.dright = 0]]--
		
		self.zeroing = math.randpm(10)
		
		self.alert = calert.new(tiger, self)
	end
	
	--self.engine = cengine.new(l_sound.engine)
	self.healthbar = chealth.new(self)
	self:addChild(self.healthbar)
	
	self.armor.front.angle = (math.deg(self.hull:getAngle()) + 90)%360
	self.armor.back.angle = (math.deg(self.hull:getAngle()) + 270)%360
	self.armor.left.angle = (math.deg(self.hull:getAngle()))%360
	self.armor.right.angle = (math.deg(self.hull:getAngle()) + 180)%360
	
	self.sprite.hull:setPosition(self.hull:getPosition())
	self.sprite.hull:setRotation(math.deg(self.hull:getAngle()))
	self.sprite.turret:setPosition(self.turret:getPosition())
	self.sprite.turret:setRotation(math.deg(self.turret:getAngle()))
	self.sprite.cannon:setPosition(self.cannon:getPosition())
	self.sprite.cannon:setRotation(math.deg(self.cannon:getAngle()))
	
	self.healthbar:enter_frame(self.health / self.mhealth)
	
	self:setAlpha(1)
	
end

function ctank:setStatue(leftf, rightf, turretf, fireboolean)
	if self.destroyed then return end
	
	--self.left:setLinearVelocity(math.sin(self.hull:getAngle())*leftf, -math.cos(self.hull:getAngle())*leftf)
	--self.right:setLinearVelocity(math.sin(self.hull:getAngle())*rightf, -math.cos(self.hull:getAngle())*rightf)
	--self:setleft(leftf)
	--self:setright(rightf)
	self:setlr(leftf, rightf)
	self.turret:setAngularVelocity((turretf*self.tspeed)+self.hull:getAngularVelocity())
	self:setfric()
	
	if self.hull:getAngularVelocity()>0.7 then
		self.hull:setAngularVelocity(0.7)
	end
	if self.hull:getAngularVelocity()<-0.7 then
		self.hull:setAngularVelocity(-0.7)
	end
	if fireboolean then
		self:fire()
	end
	if self.fired and not self.require_reload then
		self.fireratecount = self.fireratecount - 1
		if self.fireratecount<=0 then
			self.fireratecount = self.fire_rate
			self.fired = false
		end
	end
	
	self.armor.front.angle = (math.deg(self.hull:getAngle()) + 90)%360
	self.armor.back.angle = (math.deg(self.hull:getAngle()) + 270)%360
	self.armor.left.angle = (math.deg(self.hull:getAngle()))%360
	self.armor.right.angle = (math.deg(self.hull:getAngle()) + 180)%360
	
	self.sprite.hull:setPosition(self.hull:getPosition())
	self.sprite.hull:setRotation(math.deg(self.hull:getAngle()))
	self.sprite.turret:setPosition(self.turret:getPosition())
	self.sprite.turret:setRotation(math.deg(self.turret:getAngle()))
	self.sprite.cannon:setPosition(self.cannon:getPosition())
	self.sprite.cannon:setRotation(math.deg(self.cannon:getAngle()))
	self.destroyed_sprite.hull:setPosition(self.hull:getPosition())
	self.destroyed_sprite.hull:setRotation(math.deg(self.hull:getAngle()))
	self.destroyed_sprite.turret:setPosition(self.turret:getPosition())
	self.destroyed_sprite.turret:setRotation(math.deg(self.turret:getAngle()))
	self.destroyed_sprite.cannon:setPosition(self.cannon:getPosition())
	self.destroyed_sprite.cannon:setRotation(math.deg(self.cannon:getAngle()))
	
	self.healthbar:enter_frame(self.health / self.mhealth)
	
end

function ctank:setfric()
	
	local lx, ly = self.hull:getLinearVelocity()
	local av = self.hull:getAngularVelocity()
	--self.hull:setLinearVelocity(lx*(9/10), ly*(9/10))
	self.hull:setAngularVelocity(av*(19/20))
	
end

function ctank:setlr(lf, rf)
	
	if lf * rf < 0 then
		self:setleft(lf*(2/3))
		self:setright(rf*(2/3))
		--self.engine:setstatue(1)
	elseif lf * rf > 0 then
		self:setleft(lf)
		self:setright(rf)
		--self.engine:setstatue(2)
	else
		self:setleft(lf)
		self:setright(rf)
		--self.engine:setstatue(0)
	end
	
end

function ctank:setleft(f)
	
	local lefts = f * self.accel
	
	self.lspeed = self.lspeed + lefts
	
	if math.abs(self.lspeed) > math.abs(self.mspeed*f) then
		self.lspeed = self.mspeed * f
	end
	
	self.left:setLinearVelocity(math.sin(self.hull:getAngle())*self.lspeed, -math.cos(self.hull:getAngle())*self.lspeed)
	
end

function ctank:setright(f)
	
	local rights = f * self.accel
	
	self.rspeed = self.rspeed + rights
	
	if math.abs(self.rspeed) > math.abs(self.mspeed*f) then
		self.rspeed = self.mspeed * f
	end
	
	self.right:setLinearVelocity(math.sin(self.hull:getAngle())*self.rspeed, -math.cos(self.hull:getAngle())*self.rspeed)
	
end

function ctank:fire()
	
	if not self.fired then
		local cx, cy = self.cannon:getPosition()
		local px, py = cx+((self.cannon_height/2)*(math.sin(self.cannon:getAngle()))), cy-((self.cannon_height/2)*(math.cos(self.cannon:getAngle())))
		shell = cshell.new(self.world, px, py, math.sin(self.cannon:getAngle())*self.shell_velocity, -math.cos(self.cannon:getAngle())*self.shell_velocity, self.cannon_width, self.pen, self.damage, self, self.isPlayer)
		sound = csound.new(l_sound.gun[self.cannon_size], 2.5)
		
		--[[sh1 = Shape.new()
		sh1:setFillStyle(Shape.SOLID, 0xff0000)
		sh1:drawbox(0, 0, 10, 10)
		sh2 = Shape.new()
		sh2:setFillStyle(Shape.SOLID, 0xff0000)
		sh2:drawbox(0, 0, 10, 10)
		particle1 = cparticle.new(sh1, math.deg(self.cannon:getAngle()) + 90, 3, 14/15, 1.01, 0.3)
		particle2 = cparticle.new(sh2, math.deg(self.cannon:getAngle()) - 90, 3, 14/15, 1.01, 0.3)
		
		particle2:setPosition(px, py)]]--
		
		local i = 3
		local a = math.deg(self.cannon:getAngle()) + 90 - 30
		repeat
			local sh = Shape.new()
			sh:setFillStyle(Shape.SOLID, 0xca7b7b)
			sh:drawbox(0, 0, 10, 10)
			local particle = cparticle.new(sh, a, 3, 14/15, 1.01, math.randpm(10)/10, 0.3)
			particle:setPosition(px, py)
			a = a + 30
			i = i - 1
		until i<=0
		
		i = 3
		a = math.deg(self.cannon:getAngle()) - 90 - 30
		repeat
			local sh = Shape.new()
			sh:setFillStyle(Shape.SOLID, 0xca7b7b)
			sh:drawbox(0, 0, 10, 10)
			local particle = cparticle.new(sh, a, 3, 14/15, 1.01, math.randpm(10)/10, 0.3)
			particle:setPosition(px, py)
			a = a + 30
			i = i - 1
		until i<=0
		
		self.fired = true
		if self.require_reload then
			reloading()
		end
		
		if not self.isPlayer then
			self.shot_fired = true
		end
	end
	
end

function ctank:getDistance(target)
	local x1, y1 = self.hull:getPosition()
	local x2, y2 = target.hull:getPosition()
	
	return math.sqrt(((x2-x1)^2) + ((y2-y1)^2)) 
end

function ctank:destroy()
	sound = csound.new(l_sound.destruction[math.random(3)])
	--self.engine:destroy()
	self.healthbar:removeFromParent()
	self.healthbar:destroy()
	
	if not self.isPlayer then
		self.alert:destroy()
		
		kills = kills + 1
		
		local i = math.random(9)
		if i==1 then
			local tan = math.random(360)
			local ta = math.random(6)
			local tx, ty = math.cos(math.rad(tan-90)) * 2, math.sin(math.rad(tan-90)) * 2
			newitem = citem.new(self.world, s_repairpack, self:getX(), self:getY(), tx, ty, ta)
		end
	end
	
	self.sprite:setAlpha(0)
	self.destroyed_sprite:setAlpha(1)
	
	self.destroyed = true
end

function ctank:getHit(damage)
	
	self.health = self.health - damage
	
	if self.health <= 0 then
		self:destroy()
	end
	
end

function ctank:testdraw(x, y)
	local radius = 5
	local body = self.world:createBody{type = b2.STATIC_BODY}
	body:setPosition(x, y)
	local circle = b2.CircleShape.new(0, 0, radius)
	local fixture = body:createFixture{shape = circle, density = 1.0, 
	friction = 0.1, restitution = 0.2}
	fixture:setFilterData({categoryBits = 0, maskBits = 0, groupIndex = 0})
	
end

ctank.getx = ctank.getX
ctank.gety = ctank.getY
function ctank:getX()
	local x, y = self.hull:getPosition()
	return x
end
function ctank:getY()
	local x, y = self.hull:getPosition()
	return y
end

ctank.getposition = ctank.getPosition
function ctank:getPosition()
	local x, y = self.hull:getPosition()
	return x, y
end

ctank.getrotataion = ctank.getRotation
function ctank:getRotation()
	if self.destroyed then
		return 0
	end
	return self.hull:getAngle()
end
