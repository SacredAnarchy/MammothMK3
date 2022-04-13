--- Add new trigger effect names to this list!
--- @type table<string, string>
local trigger_effects = {
  ['fire-mammoth-dual-cannon'] = 'fire-mammoth-dual-cannon'
}

local offsets = {
  dual_cannon_right = require('prototypes/mammoth/right-barrel-offset')
}

-- If only there was a library mod that had all these functions :)

local function add_positions(one, two)
  local x1, y1 = one.x or one[1], one.y or one[2]
  local x2, y2 = two.x or two[1], two.y or two[2]
  return {x = x1 + x2, y = y1 + y2}
end

local function offset64(orientation)
  return math.modf((math.floor(orientation * 64) / 64) * 1000) / 1000
end
local function orientation_between(pos1, pos2)
  return offset64((1 - (math.atan2(pos2.x - pos1.x, pos2.y - pos1.y) / math.pi)) / 2)
end

--- @class Mammoth.actions
--- @field action string
--- @field next_tick uint
--- @field entity LuaEntity
--- @field ammo LuaItemStack

--- Keep our handler clear and call our on_tick functions here
local actions = {
  --- @param mammoth Mammoth.dual_cannon
  ['mammoth-shell-projectile'] = function(mammoth)
    mammoth.ammo.drain_ammo(1)

    local position = mammoth.entity.position
    local orientation_to_target = orientation_between(position, mammoth.target_position)
    local source_offset = offsets['dual_cannon_right'][orientation_to_target]
    local right_barrel_position = add_positions(position, source_offset)

    local orientation_from_target = orientation_between(mammoth.target_position, position)
    local target_offset = offsets['dual_cannon_right'][orientation_from_target]
    local right_barrel_target = add_positions(mammoth.target_position, target_offset)

    --- @type LuaSurface.create_entity_param
    local projectile_params = {
      name = 'mammoth-shell-projectile',
      position = right_barrel_position,
      target = right_barrel_target,
      -- position = mammoth.source_position,
      -- target = mammoth.target_position,
      speed = 1,
      force = mammoth.entity.force
    }

    mammoth.surface.create_entity {
      name = 'explosion-gunshot',
      position = right_barrel_position,
      target = right_barrel_target,
      -- position = mammoth.source_position,
      -- target = mammoth.target_position
    }

    mammoth.surface.play_sound { position = right_barrel_position, path = 'mammoth-gun-shot' }
    mammoth.surface.create_entity(projectile_params)
  end
}

local function add_to_tick(tick, mammoth)
  mammoth.next_tick = tick
  global.mammoths[tick] = global.mammoths[tick] or {}
  global.mammoths[tick][#global.mammoths[tick] + 1] = mammoth
  return mammoth
end

--- @param e on_script_trigger_effect
local function OnDualmammothAttack(e)
  local effect_id = trigger_effects[e.effect_id]
  if not effect_id then return end

  global.mammoths = global.mammoths or {} -- Todo move to init
  local surface = game.get_surface(e.surface_index) --- @type LuaSurface
  local target_position = e.target_position --- @type MapPosition
  local source_position = e.source_position --- @type MapPosition

  local entity = e.source_entity
  if not entity then return end

  local ammo = entity.get_inventory(defines.inventory.car_ammo)[entity.selected_gun_index] --- @type LuaItemStack
  if not ammo.valid_for_read then return end

  -- TODO: adjust cooldown modifier to be longer
  if effect_id == 'fire-mammoth-dual-cannon' then
    -- !Factorio Bug with source_effects, create entity causes crash so... just do it here manually
    surface.create_entity { name = 'explosion-gunshot', position = source_position, target = target_position }
    surface.play_sound { position = source_position, path = 'mammoth-gun-shot' }

    --- This is the data we pass to the tick handler
    --- @class Mammoth.dual_cannon: Mammoth.actions
    local mammoth = {
      entity = entity,
      target_position = target_position,
      source_position = source_position,
      ammo = ammo,
      tick = e.tick,
      surface = surface,
      action = 'mammoth-shell-projectile'
    }
    add_to_tick(e.tick + 5, mammoth)
  end

  -- if effect_id == 'my_effect_name' then
  --  local mammoth = {} -- put mammoth data here
  --  add_to_tick(ticks + ticks_from_now, mammoth)
  -- end
end
script.on_event(defines.events.on_script_trigger_effect, OnDualmammothAttack)

--- @param e on_tick
local function go_pew_pew(e)
  if not (global.mammoths and global.mammoths[e.tick]) then
    return
  end

  --- @type Mammoth.actions
  for _, mammoth in pairs(global.mammoths[e.tick]) do
    if mammoth.entity.valid and mammoth.ammo.valid_for_read then
      if mammoth.action and actions[mammoth.action] then
        actions[mammoth.action](mammoth)
      end
    end
  end
  global.mammoths[e.tick] = nil
end
script.on_event(defines.events.on_tick, go_pew_pew)
