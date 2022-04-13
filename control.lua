--- Add new trigger effect names to this list!
--- @type table<string, string>
local trigger_effects = {
  ['fire-mammoth-dual-cannon'] = 'fire-mammoth-dual-cannon'
}

--- Keep our handler clear and call our on_tick functions here
local actions = {
  ['mammoth-cannon'] = require('actions/mammoth-cannon')
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

  if effect_id == 'fire-mammoth-dual-cannon' then
    -- !BUG with source_effects, create entity causes crash so... just do it here manually
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
      action = 'mammoth-cannon',
      projectile = ammo.name:gsub('%-shell$', '-projectile')
    }
    add_to_tick(e.tick + 10, mammoth)
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
