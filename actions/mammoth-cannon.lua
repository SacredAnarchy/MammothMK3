--- !API request: entity.cooldown
---@diagnostic disable-next-line: different-requires
local Position = require('lib/position')
local offsets = require('prototypes/mammoth/right-barrel-offsets')
local MAMMOTH_CANNON_RANGE = 35

--- @param mammoth Mammoth.data.dual_cannon
return function(mammoth)
  mammoth.ammo.drain_ammo(1)

  local position = mammoth.entity.position
  local orientation_to_target = Position.orientation_between(position, mammoth.target_position)
  local source_offset = offsets[orientation_to_target][2]
  local right_source_position = Position.add_positions(position, source_offset)
  local right_target_position = mammoth.target_position

  -- TODO ammo range cap?
  if Position.get_distance(position, right_target_position) > MAMMOTH_CANNON_RANGE then
    right_target_position = Position.offset_along_line(position, right_target_position,
      MAMMOTH_CANNON_RANGE - 1)
  end

  mammoth.surface.play_sound { position = right_source_position, path = 'mammoth-gun-shot' }
  mammoth.surface.create_entity {
    name = 'explosion-gunshot',
    position = right_source_position,
    target = right_target_position
  }
  mammoth.surface.create_entity {
    name = mammoth.projectile,
    position = right_source_position,
    target = right_target_position,
    speed = .5,
    force = mammoth.entity.force
  }
end
