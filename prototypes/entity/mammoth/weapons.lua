local path = ('__MammothMK3__')

local dual_shell_ammo_category = {
  type = "ammo-category",
  name = "dual-shell"
}

local mammoth_tank_gun = {
  type = 'gun',
  name = 'mammothcannon',
  icon = path .. '/graphics/icons/mammothcannon.png',
  icon_size = 64,
  flags = { 'hidden' },
  subgroup = 'gun',
  order = 'z[tank]-a[cannon]',
  attack_parameters = {
    type = 'projectile',
    ammo_categories = { 'cannon-shell' --[['dual-shell'--]] },
    cooldown = 80 * 1,
    movement_slow_down_factor = 0,
    projectile_creation_distance = 0,
    projectile_orientation_offset = 0,
    projectile_center = { 0, 0 },
    projectile_creation_parameters = require('prototypes/entity/mammoth/left-barrel-offsets'),
    range = 35,
    sound = require('prototypes/sounds')
  },
  stack_size = 1
}

local mammoth_shell_recipe = {
  type = 'recipe',
  name = 'mammoth-shell',
  enabled = false,
  energy_required = 5,
  ingredients = { { 'explosive-cannon-shell', 1 }, { 'uranium-238', 1 } },
  result = 'mammoth-shell'
}

local mammoth_shell_item = {
  type = 'ammo',
  name = 'mammoth-shell',
  icon = path .. '/graphics/icons/mammothshell.png',
  icon_size = 64,
  pictures = {
    layers = {
      { size = 64, filename = path .. '/graphics/icons/mammothshell.png', scale = 0.25 }, {
        draw_as_light = true,
        flags = { 'light' },
        size = 64,
        filename = path .. '/graphics/icons/mammothshelllight.png',
        scale = 0.25
      }
    }
  },
  ammo_type = {
    category = 'cannon-shell',
    target_type = 'direction',
    action = {
      type = 'direct',
      action_delivery = {
        type = 'projectile',
        projectile = 'mammoth-shell-projectile',
        starting_speed = 1,
        -- direction_deviation = 0.1,
        -- range_deviation = 0.1,
        max_range = 35,
        min_range = 0,
        target_effects = { { type = 'script', effect_id = 'fire-mammoth-dual-cannon' } }
      }
    }
  },
  subgroup = 'ammo',
  order = 'd[explosive-cannon-shell]-c[uranium]',
  cooldown_modifier = 1,
  stack_size = 80
}

local mammoth_shell_projectile = {
  type = 'projectile',
  name = 'mammoth-shell-projectile',
  flags = { 'not-on-map' },
  acceleration = 0.010,
  turn_speed = 0.009,
  turning_speed_increases_exponentially_with_projectile_speed = true,
  action = {
    type = 'direct',
    action_delivery = {
      type = 'instant',
      target_effects = require('prototypes.entity.mammoth.projectile-target-effects')
    }
  },
  animation = {
    filename = '__base__/graphics/entity/bullet/bullet.png',
    draw_as_glow = true,
    frame_count = 1,
    width = 3,
    height = 50,
    priority = 'high'
  }
  -- light = {intensity = 0.8, size = 15},
}

data:extend{ mammoth_tank_gun, mammoth_shell_recipe, mammoth_shell_item, mammoth_shell_projectile, dual_shell_ammo_category }
