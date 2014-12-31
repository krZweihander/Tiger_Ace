
require "box2d"

stage:setOrientation(Stage.LANDSCAPE_LEFT)

device_width = application:getDeviceHeight()
device_height = application:getDeviceWidth()

worldscale = 8 * (device_height/320)
scale = 0.25 * (device_height/320)
volume_scale = 0.3

b2.setScale(worldscale)

game_pause = true
game_ended = false

mask = {}
mask.object = 1
mask.empty = 2
mask.shell = 4
mask.hull = 8
mask.turret = 16
mask.cannon = 32
mask.armor = 64
mask.player_armor = 128
mask.player_shell = 256
mask.item = 512
mask.mapwall = 1024

--[[debug_text = TextField.new(nil, device_width .. " - " .. device_height)
debug_text:setScale(10)
debug_text:setPosition(0, debug_text:getHeight())
stage:addChild(debug_text)]]--

s_tiger = {}
s_tiger.sprite = {}
--s_tiger.sprite.turret = "Sprite/Tank/tiger_turret.png"
--s_tiger.sprite.hull = "Sprite/Tank/tiger_hull.png"
--s_tiger.sprite.cannon = "Sprite/Tank/tiger_cannon.png"
s_tiger.sprite.turret = "Sprite/Tank/Tiger/turret.png"
s_tiger.sprite.hull = "Sprite/Tank/Tiger/hull.png"
s_tiger.sprite.cannon = "Sprite/Tank/Tiger/cannon.png"
s_tiger.sprite.destroyed = {}
s_tiger.sprite.destroyed.hull = "Sprite/Tank/Tiger/hull_destroyed.png"
s_tiger.sprite.destroyed.turret = "Sprite/Tank/Tiger/turret_destroyed.png"
s_tiger.sprite.destroyed.cannon = "Sprite/Tank/Tiger/cannon_destroyed.png"
s_tiger.sprite.hull_center = {["y"] = 68/135, ["x"] = 1/2}
--s_t3485.sprite.hull_center = {["y"] = 38/79, ["x"] = 1/2}
--s_tiger.sprite.turret_position = {["y"] = 1/2, ["x"] = 1/2}
s_tiger.sprite.turret_center = {["y"] = 23/50, ["x"] = 1/2}
--s_tiger.sprite.turret_center = {["y"] = 18/38, ["x"] = 1/2}
s_tiger.hull_width = 3.73 *scale
s_tiger.hull_height = 6.20 *scale
s_tiger.turret_width = 2.38 *scale
s_tiger.turret_height = 2.72 *scale
s_tiger.cannon_width = 0.30 *scale
s_tiger.cannon_height = 3.78 *scale
s_tiger.turret_margin = 3.14 *scale
s_tiger.shell_velocity = 2000 * scale
s_tiger.fire_rate = 420
s_tiger.armor = {}
s_tiger.armor.front = 118
s_tiger.armor.right = 80.00
s_tiger.armor.left = 80.00
s_tiger.armor.back = 60.00
s_tiger.cannon_size = 88
s_tiger.pen = 130
s_tiger.health = 1800
s_tiger.damage = 300
s_tiger.range = 1600 * scale
s_tiger.speed = 7 --* scale
s_tiger.accel = 1.5 --* scale
s_tiger.tspeed = 0.8
s_tiger.deadtimer = 300

s_t3485 = {}
s_t3485.sprite = {}
--s_t3485.sprite.turret = "Sprite/Tank/tiger_turret.png"
--s_t3485.sprite.hull = "Sprite/Tank/tiger_hull.png"
--s_t3485.sprite.cannon = "Sprite/Tank/tiger_cannon.png"
s_t3485.sprite.turret = "Sprite/Tank/T3485/turret.png"
s_t3485.sprite.hull = "Sprite/Tank/T3485/hull.png"
s_t3485.sprite.cannon = "Sprite/Tank/T3485/cannon.png"
s_t3485.sprite.destroyed = {}
s_t3485.sprite.destroyed.hull = "Sprite/Tank/T3485/hull_destroyed.png"
s_t3485.sprite.destroyed.turret = "Sprite/Tank/T3485/turret_destroyed.png"
s_t3485.sprite.destroyed.cannon = "Sprite/Tank/T3485/cannon_destroyed.png"
s_t3485.sprite.hull_center = {["y"] = 132.5/278, ["x"] = 1/2}
s_t3485.sprite.turret_margin = 1/2
s_t3485.sprite.turret_center = {["y"] = 67/127, ["x"] = 1/2}
--s_t3485.sprite.turret_center = {["y"] = 18/38, ["x"] = 1/2}
s_t3485.hull_width = 3.00 *scale
s_t3485.hull_height = 6.75 *scale
s_t3485.turret_width = 2.13 *scale
s_t3485.turret_height = 3.08 *scale
s_t3485.cannon_width = 0.25 *scale
s_t3485.cannon_height = 3.59 *scale
s_t3485.turret_margin = 3.03 *scale
s_t3485.shell_velocity = 2000 * scale
s_t3485.fire_rate = 230
s_t3485.armor = {}
s_t3485.armor.front = 90.00
s_t3485.armor.right = 68
s_t3485.armor.left = 68
s_t3485.armor.back = 60
s_t3485.cannon_size = 85
s_t3485.pen = 128
s_t3485.health = 500
s_t3485.damage = 120
s_t3485.range = 1000 * scale
s_t3485.speed = 8 --* scale
s_t3485.accel = 1.8 --* scale
s_t3485.tspeed = 0.9
s_t3485.deadtimer = 130

s_repairpack = {}
s_repairpack.sprite = "Sprite/Item/repairpack.png"
s_repairpack.func = function (who)
	who.health = who.health + (who.mhealth * (1/5))
	if who.health > who.mhealth then
		who.health = who.mhealth
	end
end

l_sound = {}
l_sound.pierce = {"Sound/armor_pierce_01.wav",
				"Sound/armor_pierce_02.wav",
				"Sound/armor_pierce_03.wav"}
l_sound.ricochet = {"Sound/ricochet_01.wav",
					"Sound/ricochet_02.wav",
					"Sound/ricochet_03.wav"}
l_sound.destruction = {"Sound/tank_destruction_01.wav",
						"Sound/tank_destruction_02.wav",
						"Sound/tank_destruction_03.wav"}
l_sound.gun = {}
l_sound.gun[88] = "Sound/88mm.mp3"--wav"
l_sound.gun[85] = "Sound/85mm.mp3"--wav"
l_sound.engine = "Sound/tank_engine.mp3"

b2.PolygonShape.setasbox = b2.PolygonShape.setAsBox
function b2.PolygonShape:setAsBox(width, height)
	self:setasbox(width/2, height/2)
end

function math.randpm(num)
	return math.random(num*2)-num
end

function Shape:drawbox(x, y, width, height)
	self:beginPath()
	self:moveTo(x, y)
	self:lineTo(x + width, y)
	self:lineTo(x + width, y + height)
	self:lineTo(x, y + height)
	self:lineTo(x, y)
	self:endPath()
end

function Sprite:addSprite(sprite)
	self:addChild(sprite)
	sprite:setPosition(-sprite:getWidth()/2, -sprite:getHeight()/2)
end

function Sprite:addText(sprite)
	self:addChild(sprite)
	sprite:setPosition(-sprite:getWidth()/2, sprite:getHeight()/2)
end

function TextField:refreshpos()
	self:setPosition(-self:getWidth()/2, self:getHeight()/2)
end

function round(x)
  if x%2 ~= 0.5 then
    return math.floor(x+0.5)
  end
  return x-0.5
end

function getpn(x)
	if x>0 then return 1 end
	if x<0 then return -1 end
	if x==0 then return 0 end
	return nil
end

function getdistance(x1, y1, x2, y2)
	return math.sqrt(((x1-x2)*(x1-x2))+((y1-y2)*(y1-y2)))
end

function getrotation(v, cx, cy, tx, ty)
	local dx = (v*(math.abs(tx-cx)))/getdistance(cx, cy, tx, ty) * getpn(tx - cx)
	local dy = (v*(math.abs(ty-cy)))/getdistance(cx, cy, tx, ty) * getpn(ty - cy)
	
	return dx, dy
end

function load_setting()
	default_guiscale = 2.8 * (device_height/320)
	
	set_guiscale = dataSaver.loadValue("guiscale") or 1
	set_guialpha = dataSaver.loadValue("guialpha") or 0.5
	--set_guiscale = 1
	--set_guialpha = 0.5
	
	guiscale = default_guiscale * set_guiscale
	guialpha = set_guialpha
	margin = 5 * guiscale
end

actors = {}
shells = {}
particles = {}
items = {}
msgs = {}
alerts = {}

kills = 0

function main()
	
	load_setting()
	
	game_pause = true
	game_ended = false
	
	actors = {}
	shells = {}
	particles = {}
	msgs = {}

	kills = 0
	
	tworld = cworld.new()
	tworld:setAlpha(0)
	
	stage:addChild(tworld)
	
	gui = cgui.new()
	reload = creload.new()
	health = chealth.new()
	
	--[[debugDraw = b2.DebugDraw.new()
	tworld.world:setDebugDraw(debugDraw)
	tworld:addChild(debugDraw)]]--
	
	tiger = ctank.new(tworld.world, s_tiger, 0, 0, true)
	--[[t3485 = ctank.new(tworld.world, s_t3485, device_width/4, 50)
	t3485_1 = ctank.new(tworld.world, s_t3485, device_width*(2/4), 50)
	t3485_2 = ctank.new(tworld.world, s_t3485, device_width*(3/4), 50)]]--
	
	aim = caim.new(tiger)
	
	wave = cwave.new(tiger, s_t3485, tworld.world)
	wave:next_wave()
	
	ai = cai.new()
	ai:found(tiger)
	
	--aim:setTank(tiger)
	
	--stt = csetting.new()
	
end

function reloading()
	reload.active = true
	reload:setAlpha(1)
	gui.reload:setAlpha(guialpha)
end

function reload_tap()
	reload:tap()
end

function reloaded()
	tiger.fired = false
	reload.active = false
	reload:setAlpha(0)
	gui.reload:setAlpha(0)
end

math.randomseed(os.time())

main()