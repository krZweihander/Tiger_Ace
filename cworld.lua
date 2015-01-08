
cworld = Core.class(Sprite)

function cworld:init()
	self.world = b2.World.new(0, 0)
	
	self.background = Sprite.new()
	--self.background:setScale(scale)
	self.background.spritetable = {}
	local j = 1
	repeat
		self.background.spritetable[j] = "Sprite/BG/background_" .. j .. ".png"
		j = j + 1
	until j>100
	
	self.background.sprite = {}
	for i, v in ipairs(self.background.spritetable) do
		self.background.sprite[i] = Bitmap.new(Texture.new(v))
		self.background.sprite[i]:setScale(scale)
		self.background:addChild(self.background.sprite[i])
	end
	self:addChild(self.background)
	self.background.width = self.background.sprite[1]:getWidth() * 10
	self.background.height = self.background.sprite[1]:getHeight() * 10
	
	for i, v in ipairs(self.background.sprite) do
		if i<=10 then
			self.background.sprite[i]:setPosition(-(self.background.width/2) + ((i-1) * self.background.sprite[1]:getWidth()), -self.background.height/2)
		elseif i<=20 then
			self.background.sprite[i]:setPosition(-(self.background.width/2) + ((i-11) * self.background.sprite[1]:getWidth()), -self.background.height/2 + self.background.sprite[1]:getHeight())
		elseif i<=30 then
			self.background.sprite[i]:setPosition(-(self.background.width/2) + ((i-21) * self.background.sprite[1]:getWidth()), -self.background.height/2 + (self.background.sprite[1]:getHeight()*2))
		elseif i<=40 then
			self.background.sprite[i]:setPosition(-(self.background.width/2) + ((i-31) * self.background.sprite[1]:getWidth()), -self.background.height/2 + (self.background.sprite[1]:getHeight()*3))
		elseif i<=50 then
			self.background.sprite[i]:setPosition(-(self.background.width/2) + ((i-41) * self.background.sprite[1]:getWidth()), -self.background.height/2 + (self.background.sprite[1]:getHeight()*4))
		elseif i<=60 then
			self.background.sprite[i]:setPosition(-(self.background.width/2) + ((i-51) * self.background.sprite[1]:getWidth()), -self.background.height/2 + (self.background.sprite[1]:getHeight()*5))
		elseif i<=70 then
			self.background.sprite[i]:setPosition(-(self.background.width/2) + ((i-61) * self.background.sprite[1]:getWidth()), -self.background.height/2 + (self.background.sprite[1]:getHeight()*6))
		elseif i<=80 then
			self.background.sprite[i]:setPosition(-(self.background.width/2) + ((i-71) * self.background.sprite[1]:getWidth()), -self.background.height/2 + (self.background.sprite[1]:getHeight()*7))
		elseif i<=90 then
			self.background.sprite[i]:setPosition(-(self.background.width/2) + ((i-81) * self.background.sprite[1]:getWidth()), -self.background.height/2 + (self.background.sprite[1]:getHeight()*8))
		else
			self.background.sprite[i]:setPosition(-(self.background.width/2) + ((i-91) * self.background.sprite[1]:getWidth()), -self.background.height/2 + (self.background.sprite[1]:getHeight()*9))
		end
	end
	
	self.wall = {}
	
	self.wall.top = self.world:createBody{type = b2.STATIC_BODY, position = {x=0, y=-self.background.height*(7/8)}, fixedRodation = true}
	self.wall.top.name = "wall"
	self.wall.top.poly = b2.PolygonShape:new()
	self.wall.top.poly:setAsBox(self.background.width*(3/2), self.background.height*(3/4))
	self.wall.top.fixture = self.wall.top:createFixture({shape = self.wall.top.poly, density = 80000, friction = 0.2, restitution = 0.83})
	self.wall.top.fixture:setFilterData({categoryBits = mask.mapwall, maskBits = mask.player_armor, groupIndex = 0})
	
	self.wall.bottom = self.world:createBody{type = b2.STATIC_BODY, position = {x=0, y=self.background.height*(7/8)}, fixedRodation = true}
	self.wall.bottom.name = "wall"
	self.wall.bottom.poly = b2.PolygonShape:new()
	self.wall.bottom.poly:setAsBox(self.background.width*(3/2), self.background.height*(3/4))
	self.wall.bottom.fixture = self.wall.bottom:createFixture({shape = self.wall.bottom.poly, density = 80000, friction = 0.2, restitution = 0.83})
	self.wall.bottom.fixture:setFilterData({categoryBits = mask.mapwall, maskBits = mask.player_armor, groupIndex = 0})
	
	self.wall.left = self.world:createBody{type = b2.STATIC_BODY, position = {x=-self.background.width*(7/8), y=0}, fixedRodation = true}
	self.wall.left.name = "wall"
	self.wall.left.poly = b2.PolygonShape:new()
	self.wall.left.poly:setAsBox(self.background.width*(3/4), self.background.height*(3/2))
	self.wall.left.fixture = self.wall.left:createFixture({shape = self.wall.left.poly, density = 80000, friction = 0.2, restitution = 0.83})
	self.wall.left.fixture:setFilterData({categoryBits = mask.mapwall, maskBits = mask.player_armor, groupIndex = 0})
	
	self.wall.right = self.world:createBody{type = b2.STATIC_BODY, position = {x=self.background.width*(7/8), y=0}, fixedRodation = true}
	self.wall.right.name = "wall"
	self.wall.right.poly = b2.PolygonShape:new()
	self.wall.right.poly:setAsBox(self.background.width*(3/4), self.background.height*(3/2))
	self.wall.right.fixture = self.wall.right:createFixture({shape = self.wall.right.poly, density = 80000, friction = 0.2, restitution = 0.83})
	self.wall.right.fixture:setFilterData({categoryBits = mask.mapwall, maskBits = mask.player_armor, groupIndex = 0})
	
	self:addEventListener(Event.ENTER_FRAME, self.enter_frame, self)
end

function cworld:enter_frame(event)
	
	if game_pause then return end
	
	local left, right, tr, fireb = gui:rtnv()
	tiger:setStatue(left, right, -tr, fireb)
	--t3485:setStatue(left, right, 0, false)
	
	for i, v in pairs(shells) do
		v:enter_frame(event)
		
		if v.destroyed then
			v.sprite.texture:removeFromParent()
			v.sprite.texture = nil
			v.sprite:removeFromParent()
			v.sprite = nil
			tworld.world:destroyBody(v.body)
			v.body = nil
			v:removeFromParent()
			v = nil
			shells[i] = nil
		end
	end
	
	for i, v in pairs(actors) do
		if not v.isPlayer then
			ai:enter_frame(v)
		end
		
		if v.destroyed then
			if not v.body_destroyed then
				tworld.world:destroyBody(v.hull)
				tworld.world:destroyBody(v.left)
				tworld.world:destroyBody(v.right)
				tworld.world:destroyBody(v.turret)
				tworld.world:destroyBody(v.cannon)
				tworld.world:destroyBody(v.armor.front)
				tworld.world:destroyBody(v.armor.back)
				tworld.world:destroyBody(v.armor.right)
				tworld.world:destroyBody(v.armor.left)
				v.hull = nil
				v.left = nil
				v.right = nil
				v.turret = nil
				v.cannon = nil
				v.armor.front = nil
				v.armor.back = nil
				v.armor.right = nil
				v.armor.left = nil
				v.armor = nil
				v.body_destroyed = true
			end
			v.deadtimer = v.deadtimer - 1
			if v.deadtimer <= 0 then
				v:setAlpha(v:getAlpha() - 0.05)
			end
			if v:getAlpha() <=0 then
				v.sprite.hull.texture:removeFromParent()
				v.sprite.hull:removeFromParent()
				v.sprite.turret.texture:removeFromParent()
				v.sprite.turret:removeFromParent()
				v.sprite.cannon.texture:removeFromParent()
				v.sprite.cannon:removeFromParent()
				v.sprite:removeFromParent()
				v.sprite.hull.texture = nil
				v.sprite.hull = nil
				v.sprite.turret.texture = nil
				v.sprite.turret = nil
				v.sprite.cannon.texture = nil
				v.sprite.cannon = nil
				v.sprite = nil
				v.destroyed_sprite.hull.texture:removeFromParent()
				v.destroyed_sprite.hull:removeFromParent()
				v.destroyed_sprite.turret.texture:removeFromParent()
				v.destroyed_sprite.turret:removeFromParent()
				v.destroyed_sprite:removeFromParent()
				v.destroyed_sprite.cannon.texture:removeFromParent()
				v.destroyed_sprite.cannon:removeFromParent()
				v.destroyed_sprite:removeFromParent()
				v.destroyed_sprite.hull.texture = nil
				v.destroyed_sprite.hull = nil
				v.destroyed_sprite.turret.texture = nil
				v.destroyed_sprite.turret = nil
				v.destroyed_sprite.cannon.texture = nil
				v.destroyed_sprite.cannon = nil
				v.destroyed_sprite = nil
				v:removeFromParent()
				v = nil
				actors[i] = nil
			end
		end
	end
	
	for i, v in pairs(particles) do
		v:enter_frame(event)
		
		if v.destroyed then
			v.sprite:removeFromParent()
			v.sprite = nil
			v:removeFromParent()
			particles[i] = nil
		end
	end
	
	for i, v in pairs(items) do
		v:enter_frame(event)
		
		if v.destroyed then
			tworld.world:destroyBody(v.body)
			v.body = nil
			v.sprite:removeFromParent()
			v.sprite = nil
			v:removeFromParent()
			items[i] = nil
		end
	end
	
	for i, v in pairs(msgs) do
		v:enter_frame(event)
		
		if v.destroyed then
			v.text:removeFromParent()
			v.text = nil
			v:removeFromParent()
			msgs[i] = nil
		end
	end
	
	for i, v in pairs(alerts) do
		v:enter_frame(event)
		
		if v.destroyed then
			v.sprite:removeFromParent()
			v.sprite = nil
			v:removeFromParent()
			alerts[i] = nil
		end
	end
	
	aim:enter_frame(tiger)
	reload:enter_frame(event)
	wave:enter_frame(event)
	
	--self:setPosition((device_width/2) - aim:getX(), (device_height/2) - aim:getY())
	if not tiger.destroyed then
		local trx, try = tiger.sprite.turret:getPosition()
		local dx, dy = (tiger.range/4)	* math.sin(tiger.turret:getAngle()+math.pi), -(tiger.range/4) * math.cos(tiger.turret:getAngle()+math.pi)
		local tx, ty = (device_width/2) - trx + dx, (device_height/2) - try + dy
		if tx-(device_width) < -self.background.width/2 then
			tx = -(self.background.width/2) + (device_width)
		elseif tx > self.background.width/2 then
			tx = (self.background.width/2)
		end
		if ty-(device_height) < -self.background.height/2 then
			ty = -(self.background.height/2) + (device_height)
		elseif ty > self.background.height/2 then
			ty = (self.background.height/2)
		end
		
		self:setPosition(tx, ty)
		--self:setPosition((device_width/2) - tiger:getX(), (device_height/2) - tiger:getY())
	end
	
	tworld.world:step(1/(application:getFps()), 8, 3)
	tworld.world:clearForces()
	
	collectgarbage()
	collectgarbage("collect")
	--print(math.floor(collectgarbage("count")))
end

function cworld:destroy()
	
	for i, v in pairs(shells) do
		v.sprite.texture:removeFromParent()
		v.sprite:removeFromParent()
		v:removeFromParent()
		tworld.world:destroyBody(v.body)
		shells[i] = nil
	end
	
	for i, v in pairs(actors) do
		tworld.world:destroyBody(v.hull)
		tworld.world:destroyBody(v.left)
		tworld.world:destroyBody(v.right)
		tworld.world:destroyBody(v.turret)
		tworld.world:destroyBody(v.cannon)
		tworld.world:destroyBody(v.armor.front)
		tworld.world:destroyBody(v.armor.back)
		tworld.world:destroyBody(v.armor.right)
		tworld.world:destroyBody(v.armor.left)
		v.sprite.hull.texture:removeFromParent()
		v.sprite.hull:removeFromParent()
		v.sprite.turret.texture:removeFromParent()
		v.sprite.turret:removeFromParent()
		v.sprite:removeFromParent()
		v:removeFromParent()
		actors[i] = nil
	end
	
	self.world = nil
	self:removeEventListener(Event.ENTER_FRAME, self.enter_frame, self)
	
	self:removeFromParent()
	
	self = nil
	
end
