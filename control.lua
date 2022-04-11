--[[
local player = game.player
local vehicle = player.vehicle
local event = {}
event.source_position = event.vehicle
--]] --
--- @param source MapPosition
--- @param target MapPosition
--- @return MapPosition
local function get_offsets(source, target)

  local angle = math.atan2((target.y - source.y), (target.x - source.x))
  local r = 0.4 -- distance away to make projectiles
  local u_rx = math.cos(angle)
  local u_ry = math.sin(angle)
  local r_along_vector = { x = r * u_rx, y = r * u_ry }
  local barrel_separation_offset_x = 0.2 * (u_ry)
  local barrel_separation_offset_y = 0.2 * (u_rx)
  return {
    { -- counter-clockwise = left-barrel
      x = source.x + r_along_vector.x - barrel_separation_offset_x,
      y = source.y + r_along_vector.y + barrel_separation_offset_y
    }, { -- clockwise = right-barrel
      x = source.x + r_along_vector.x + barrel_separation_offset_x,
      y = source.y + r_along_vector.y - barrel_separation_offset_y
    }
  }
end

--- @param e on_script_trigger_effect
local function OnDualmammothAttack(e)
  -- TODO: Add actual firing sounds, adjust cooldown modifier to be longer
  if e.effect_id == 'fire-mammoth-dual-cannon' then
    local entity = e.source_entity
    if not entity then
      return
    end

    local ammo = entity.get_inventory(defines.inventory.car_ammo)[entity.selected_gun_index] --- @type LuaItemStack
    if not ammo.valid_for_read then
      return
    end

    local next_shot = e.tick + 5
    local target_position = e.target_position --- @type MapPosition
    local source_position = e.source_position --- @type MapPosition
    local surface = game.get_surface(e.surface_index) --- @type LuaSurface
    local offsets = get_offsets(source_position, target_position)

    surface.create_entity {
      name = 'explosion-gunshot',
      position = source_position,
      target = target_position
    }
    surface.play_sound { position = source_position, path = 'mammoth-gun-shot' }

    global.mammoths = global.mammoths or {}
    global.mammoths[next_shot] = global.mammoths[next_shot] or {}
    local mammoths = global.mammoths[next_shot]

    --- @class Mammoth.mammoth
    local mammoth = {
      entity = entity,
      target_position = target_position,
      source_position = source_position,
      ammo = ammo,
      tick = e.tick,
      offsets = offsets,
      surface = surface,
      actions = {}
    }
    mammoths[#mammoths + 1] = mammoth
  end
end
script.on_event(defines.events.on_script_trigger_effect, OnDualmammothAttack)



--- @param e on_tick
local function go_pew_pew(e)
  if not (global.mammoths and global.mammoths[e.tick]) then
    return
  end

  --- @type Mammoth.mammoth
  for _, mammoth in pairs(global.mammoths[e.tick]) do
    if mammoth.entity.valid and mammoth.ammo.valid_for_read then

      --- @type LuaSurface.create_entity_param
      local projectile_params = {
        name = 'mammoth-shell-projectile',
        position = mammoth.source_position,
        target = mammoth.target_position,
        speed = 1,
        force = mammoth.entity.force

      }

      mammoth.surface.create_entity(projectile_params)

      mammoth.surface.create_entity {
        name = 'explosion-gunshot',
        position = mammoth.source_position,
        target = mammoth.target_position
      }

      mammoth.surface.play_sound { position = mammoth.source_position, path = 'mammoth-gun-shot' }
    end

  end
  global.mammoths[e.tick] = nil
end
script.on_event(defines.events.on_tick, go_pew_pew)
