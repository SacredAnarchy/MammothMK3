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
    ammo_categories = { 'cannon-shell', 'dual-shell' },
    cooldown = 60 * 1.5,
    movement_slow_down_factor = 0,
    projectile_creation_parameters = require('prototypes/mammoth/left-barrel-offsets'),
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

local mammoth_railround_recipe = {
  type = 'recipe',
  name = 'mammoth_railgun_round',
  enabled = false,
  energy_required = 5,
  ingredients = { { 'explosive-cannon-shell', 1 }, { 'uranium-238', 1 } },
  result = 'mammoth_railgun_round'
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
        projectile = 'mammoth-projectile',
        starting_speed = .75,
        max_range = 35,
        min_range = 0,
        target_effects = {--[[ Added in data-updates --]]}
      }
    }
  },
  subgroup = 'ammo',
  order = 'd[explosive-cannon-shell]-c[uranium]',
  cooldown_modifier = 0,
  stack_size = 80
}

local mammoth_shell_projectile = {
  type = 'projectile',
  name = 'mammoth-projectile',
  flags = { 'not-on-map' },
  acceleration = 0.010,
  turn_speed = 0.010,
  turning_speed_increases_exponentially_with_projectile_speed = false,
  action = {
    type = 'direct',
    action_delivery = {
    type = 'instant',
    target_effects = require('prototypes/mammoth/projectile-target-effects')
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
}

local mammoth_rail_round = {
  type = "ammo",
  name = "mammoth_railgun_round",
  icon = "__base__/graphics/icons/explosive-cannon-shell.png",
  icon_size = 64, icon_mipmaps = 4,
  ammo_type =
  {
    category = "cannon-shell",
    target_type = "direction",
    clamp_position = true,
    action =
    {

      type = "line",
      range = 80,
      width = 0.5,
      range_effects =
        {
          type = "create-explosion",
          entity_name = "railgun-beam"
        },
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "damage",
            damage = {amount = 200 , type = "physical"}
          },
          {
            type = "damage",
            damage = {amount = 100 , type = "explosion"}
          },
          {
            type = "create-entity",
            entity_name = "massive-explosion"
          }
        }
      },
    }
  },
  subgroup = "ammo",
  order = "d[cannon-shell]-c[explosive]",
  stack_size = 200
}

data:extend{ mammoth_tank_gun, mammoth_shell_recipe, mammoth_shell_item, mammoth_shell_projectile, dual_shell_ammo_category, mammoth_rail_round, mammoth_railround_recipe }
