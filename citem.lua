
citem = Core.class(Sprite)

function citem:init(_world, sort, x, y, tx, ty, ta)
	
	self.world = _world
	
	tworld:addChild(self)
	
	self:setAlpha(0)
	
	self.sprite = Bitmap.new(Texture.new(sort.sprite))
	self.sprite:setScale(scale)
	self:addSprite(self.sprite)
	
	self.func = sort.func
	
	self.initx = x
	self.inity = y
	self.inittx = tx
	self.initty = ty
	self.initta = ta
	
	self.bodyinited = false
	self.destroyed = false
	
	self.world:addEventListener(Event.BEGIN_CONTACT, self.begin_contact, self)
	
	table.insert(items, self)
	
end

function citem:initbody()
	self.body = tworld.world:createBody{type = b2.DYNAMIC_BODY, position = {x=self.initx, y=self.inity}, fixedRodation = true}
	self.body.name = "item"
	self.body.poly = b2.PolygonShape:new()
	self.body.poly:setAsBox(self.sprite:getWidth(), self.sprite:getHeight())
	self.body.fixture = self.body:createFixture({shape = self.body.poly, density = 5000, friction = 0.74, restitution = 0.83})
	self.body.fixture:setFilterData({categoryBits = mask.item, maskBits = mask.hull + mask.object + mask.item, groupIndex = 0})
	self.body.parent = self
	
	self.body:setLinearVelocity(self.inittx, self.initty)
	self.body:setAngularVelocity(self.initta)
	
	self:setPosition(self.body:getPosition())
	self:setRotation(math.deg(self.body:getAngle()))
	
	self:setAlpha(1)
	
	self.bodyinited = true
end

function citem:work(data)
	if self.destroyed then return end
	self.func(data)
end

function citem:setfric()
	local lx, ly = self.body:getLinearVelocity()
	local av = self.body:getAngularVelocity()
	self.body:setLinearVelocity(lx*(19/20), ly*(19/20))
	self.body:setAngularVelocity(av*(19/20))
end

function citem:enter_frame(event)
	if not self.bodyinited then
		self:initbody()
		return
	end
	
	if self.destroyed then return end
	
	self:setfric()
	self:setPosition(self.body:getPosition())
	self:setRotation(math.deg(self.body:getAngle()))
end

function citem:begin_contact(event)
	
	local t_tank, t_item = {}, {}
	
	if event.fixtureA:getBody().name == "hull" and event.fixtureB:getBody().name == "item" then
		t_tank = event.fixtureA:getBody()
		t_item = event.fixtureB:getBody()
	elseif event.fixtureB:getBody().name == "hull" and event.fixtureA:getBody().name == "item" then
		t_item = event.fixtureA:getBody()
		t_tank = event.fixtureB:getBody()
	else
		return
	end
	
	if t_tank.parent.isPlayer then
		t_item.parent:work(t_tank.parent)
		t_item.parent:destroy()
	end
	
end

function citem:destroy()
	self.destroyed = true
	self = nil
end