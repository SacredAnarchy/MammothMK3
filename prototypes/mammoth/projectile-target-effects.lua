local sounds = require('__base__/prototypes/entity/sounds')

local a = { type = 'damage', damage = { amount = 200, type = 'explosion' } }

local b = {
  type = 'set-tile',
  tile_name = 'nuclear-ground',
  radius = 3,
  apply_projection = true,
  tile_collision_mask = { 'water-tile' }
}

local c = { type = 'destroy-cliffs', radius = 3, explosion = 'explosion' }

local d = { type = 'create-entity', entity_name = 'mininuke-explosion' }

local e = {
  type = 'camera-effect',
  effect = 'screen-burn',
  duration = 30,
  ease_in_duration = 5,
  ease_out_duration = 30,
  delay = 0,
  strength = 2,
  full_strength_max_distance = 100,
  max_distance = 400
}

local f = {
  type = 'play-sound',
  sound = sounds.nuclear_explosion(0.9),
  play_on_target_position = false,
  -- min_distance = 200,
  max_distance = 1000,
  -- volume_modifier = 1,
  audible_distance_modifier = 3
}

local g = {
  type = 'play-sound',
  sound = sounds.nuclear_explosion_aftershock(0.4),
  play_on_target_position = false,
  -- min_distance = 200,
  max_distance = 1000,
  -- volume_modifier = 1,
  audible_distance_modifier = 3
}

local h = {
  type = 'create-entity',
  entity_name = 'huge-scorchmark',
  offsets = { { 0, -0.5 } },
  scale = 0.2,
  check_buildability = true
}

local i = { type = 'invoke-tile-trigger', repeat_count = 1 }

local j = {
  type = 'destroy-decoratives',
  include_soft_decoratives = true, -- soft decoratives are decoratives with grows_through_rail_path = true
  include_decals = true,
  invoke_decorative_trigger = true,
  decoratives_with_trigger_only = false, -- if true, destroys only decoratives that have trigger_effect set
  radius = 4 -- large radius for demostrative purposes
}

local k = {
  type = 'create-decorative',
  decorative = 'nuclear-ground-patch',
  spawn_min_radius = 8,
  spawn_max_radius = 10,
  spawn_min = 30,
  spawn_max = 40,
  apply_projection = true,
  spread_evenly = true
}

------Damage wave-------
local l = {
  type = 'nested-result',
  action = {
    type = 'area',
    target_entities = false,
    trigger_from_target = true,
    repeat_count = 500,
    radius = 6,
    action_delivery = {
      type = 'projectile',
      projectile = 'mini-atomic-bomb-ground-zero-projectile',
      starting_speed = 0.6 * 0.8,
      scale = 0.2,
      starting_speed_deviation = _ENV.nuke_shockwave_starting_speed_deviation
    }
  }
}

local m = {
  type = 'nested-result',
  action = {
    type = 'area',
    target_entities = false,
    trigger_from_target = true,
    repeat_count = 500,
    radius = 6,
    action_delivery = {
      type = 'projectile',
      projectile = 'mini-atomic-bomb-wave',
      starting_speed = 0.5 * 0.7,
      scale = 0.2,
      starting_speed_deviation = _ENV.nuke_shockwave_starting_speed_deviation
    }
  }
}

--------Smoke------
local n = {
  type = 'nested-result',
  action = {
    type = 'area',
    show_in_tooltip = false,
    target_entities = false,
    trigger_from_target = true,
    repeat_count = 500,
    radius = 1,
    action_delivery = {
      type = 'projectile',
      projectile = 'mini-atomic-bomb-wave-spawns-cluster-nuke-explosion',
      starting_speed = 0.5 * 0.7,
      starting_speed_deviation = _ENV.nuke_shockwave_starting_speed_deviation
    }
  }
}

----smoke wave-----
local o = {
  type = 'nested-result',
  action = {
    type = 'area',
    show_in_tooltip = false,
    target_entities = false,
    trigger_from_target = true,
    repeat_count = 700,
    radius = 2,
    action_delivery = {
      type = 'projectile',
      projectile = 'mini-atomic-bomb-wave-spawns-fire-smoke-explosion',
      starting_speed = 0.5 * 0.65,
      scale = 0.2,
      starting_speed_deviation = _ENV.nuke_shockwave_starting_speed_deviation
    }
  }
}

------sparkle wave------
local p = {
  type = 'nested-result',
  action = {
    type = 'area',
    show_in_tooltip = false,
    target_entities = false,
    trigger_from_target = true,
    repeat_count = 500,
    radius = 2,
    action_delivery = {
      type = 'projectile',
      projectile = 'mini-atomic-bomb-wave-spawns-nuke-shockwave-explosion',
      starting_speed = 0.5 * 0.65,
      scale = 0.2,
      starting_speed_deviation = _ENV.nuke_shockwave_starting_speed_deviation
    }
  }
}
local q = {
  type = 'nested-result',
  action = {
    type = 'area',
    show_in_tooltip = false,
    target_entities = false,
    trigger_from_target = true,
    repeat_count = 300,
    radius = 2,
    action_delivery = {
      type = 'projectile',
      projectile = 'mini-atomic-bomb-wave-spawns-nuclear-smoke',
      starting_speed = 0.5 * 0.65,
      starting_speed_deviation = _ENV.nuke_shockwave_starting_speed_deviation
    }
  }
}

local r = {
  type = 'nested-result',
  action = {
    type = 'area',
    show_in_tooltip = false,
    target_entities = false,
    trigger_from_target = true,
    repeat_count = 10,
    radius = 2,
    action_delivery = {
      type = 'instant',
      target_effects = {
        {
          type = 'create-entity',
          entity_name = 'mini-nuclear-smouldering-smoke-source',
          scale = 0.2,
          tile_collision_mask = { 'water-tile' }
        }
      }
    }
  }
}

local effects = { a, --[[ b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r ]] }

return effects
