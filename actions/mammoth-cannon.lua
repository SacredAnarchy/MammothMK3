--- !API request: entity.cooldown
local Position = require('libs/position')
local offsets = require('prototypes/mammoth/right-barrel-offsets')
local MAMMOTH_CANNON_RANGE = 35

--- @param mammoth Mammoth.dual_cannon
return function(mammoth)
  mammoth.ammo.drain_ammo(1)

  local position = mammoth.entity.position
  local orientation_to_target = Position.orientation_between(position, mammoth.target_position)
  local source_offset = offsets[orientation_to_target]
  local right_barrel_position = Position.add_positions(position, source_offset)
  local right_barrel_target = mammoth.target_position

  -- TODO ammo range cap?
  if Position.get_distance(position, right_barrel_target) > MAMMOTH_CANNON_RANGE then
    right_barrel_target = Position.offset_along_line(position, right_barrel_target,
      MAMMOTH_CANNON_RANGE - 1)
  end

  mammoth.surface.play_sound { position = right_barrel_position, path = 'mammoth-gun-shot' }
  mammoth.surface.create_entity {
    name = 'explosion-gunshot',
    position = right_barrel_position,
    target = right_barrel_target
  }
  mammoth.surface.create_entity {
    name = mammoth.projectile,
    position = right_barrel_position,
    target = right_barrel_target,
    speed = 1,
    force = mammoth.entity.force
  }
end
