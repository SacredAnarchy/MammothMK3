data:extend{
  -----------------------------------------------------------------------
  -- SHOCKWAVE projectiles
  -----------------------------------------------------------------------
  {
    type = 'projectile',
    name = 'mini-atomic-bomb-wave-spawns-nuke-shockwave-explosion',
    flags = { 'not-on-map' },
    acceleration = 0,
    speed_modifier = { 1, 0.707 },
    action = {
      {
        type = 'direct',
        action_delivery = {
          type = 'instant',
          target_effects = {
            {
              type = 'create-explosion',
              entity_name = 'mini-atomic-nuke-shockwave',
              max_movement_distance = _ENV.max_nuke_shockwave_movement_distance,
              max_movement_distance_deviation = _ENV.max_nuke_shockwave_movement_distance_deviation,
              inherit_movement_distance_from_projectile = true,
              cycle_while_moving = true
            }
          }
        }
      }
    },
    animation = nil,
    shadow = nil
  }, {
    type = 'projectile',
    name = 'mini-atomic-bomb-wave-spawns-nuclear-smoke',
    flags = { 'not-on-map' },
    acceleration = 0,
    speed_modifier = { 1.000, 0.707 },
    action = {
      {
        type = 'direct',
        action_delivery = {
          type = 'instant',
          target_effects = {
            {
              repeat_count = 10,
              type = 'create-trivial-smoke',
              smoke_name = 'mini-nuclear-smoke',
              offset_deviation = { { -2, -2 }, { 2, 2 } },
              starting_frame = 10,
              starting_frame_deviation = 20,
              starting_frame_speed = 0,
              starting_frame_speed_deviation = 5,
              speed_from_center = 0.035
            }
          }
        }
      }
    },
    animation = nil,
    shadow = nil
  }, {
    type = 'projectile',
    name = 'mini-atomic-bomb-wave-spawns-fire-smoke-explosion',
    flags = { 'not-on-map' },
    acceleration = 0,
    speed_modifier = { 1, 0.707 },
    action = {
      {
        type = 'direct',
        action_delivery = {
          type = 'instant',
          target_effects = {
            {
              type = 'create-explosion',
              entity_name = 'mini-atomic-fire-smoke',
              max_movement_distance = _ENV.max_nuke_shockwave_movement_distance,
              max_movement_distance_deviation = _ENV.max_nuke_shockwave_movement_distance_deviation,
              inherit_movement_distance_from_projectile = true,
              cycle_while_moving = true
            }
          }
        }
      }
    },
    animation = nil,
    shadow = nil
  }, {
    type = 'projectile',
    name = 'mini-atomic-bomb-wave-spawns-cluster-nuke-explosion',
    flags = { 'not-on-map', 'hidden' },
    acceleration = 0.001,
    speed_modifier = { 1.0, 0.707 },
    action = {
      {
        type = 'direct',
        action_delivery = {
          type = 'instant',
          target_effects = {
            {
              type = 'create-entity',
              entity_name = 'mini-cluster-nuke-explosion'
              -- following properties are recognized only be "create-explosion" trigger
              -- max_movement_distance = max_nuke_shockwave_movement_distance,
              -- max_movement_distance_deviation = max_nuke_shockwave_movement_distance_deviation,
              -- inherit_movement_distance_from_projectile = true
            }
          }
        }
      }
    },
    animation = nil,
    shadow = nil
  }, {
    type = 'projectile',
    name = 'mini-atomic-bomb-wave',
    flags = { 'not-on-map' },
    acceleration = 0,
    speed_modifier = { 1.0, 0.707 },
    action = {
      {
        type = 'area',
        radius = 3,
        ignore_collision_condition = true,
        action_delivery = {
          type = 'instant',
          target_effects = {
            type = 'damage',
            vaporize = false,
            lower_distance_threshold = 0,
            upper_distance_threshold = 35,
            lower_damage_modifier = 1,
            upper_damage_modifier = 0.1,
            damage = { amount = 200, type = 'explosion' }
          }
        }
      }
    },
    animation = nil,
    shadow = nil
  }, {
    type = 'projectile',
    name = 'mini-atomic-bomb-ground-zero-projectile',
    flags = { 'not-on-map' },
    acceleration = 0,
    speed_modifier = { 1.0, 0.707 },
    action = {
      {
        type = 'area',
        radius = 3,
        ignore_collision_condition = true,
        action_delivery = {
          type = 'instant',
          target_effects = {
            type = 'damage',
            vaporize = true,
            lower_distance_threshold = 0,
            upper_distance_threshold = 35,
            lower_damage_modifier = 1,
            upper_damage_modifier = 0.01,
            damage = { amount = 100, type = 'explosion' }
          }
        }
      }
    },
    animation = nil,
    shadow = nil
  }
}
