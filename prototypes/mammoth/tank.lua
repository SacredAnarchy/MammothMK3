local path = ('__MammothMK3__')

require('prototypes/mammoth/weapons')
local mammoth_only = { 'mammothcannon' }
local default_mammoth = { 'mammothcannon', 'tank-machine-gun', 'spidertron-rocket-launcher-1' }

local tank_recipe = {
  type = 'recipe',
  name = 'mammothtank',
  enabled = false,
  energy_required = 15,
  ingredients = {
    { 'steel-plate', 20 }, { 'copper-plate', 15 }, { 'electronic-circuit', 15 },
    { 'advanced-circuit', 10 }, { 'tank', 1 }, { 'electric-engine-unit', 1 }, { 'accumulator', 2 }
  },
  result = 'mammothtank'
}

local tank_item = {
  type = 'item-with-entity-data',
  name = 'mammothtank',
  icon = path .. '/graphics/icons/mammothicon.png',
  icon_size = 64,
  subgroup = 'transport',
  order = 'b[personal-transport]-b[tank]',
  place_result = 'mammothtank',
  stack_size = 1
}

local sounds = require('__base__/prototypes/entity/sounds')
local hit_effects = require('__base__/prototypes/entity/hit-effects')
local movement_triggers = require('__base__/prototypes/entity/movement-triggers')

local tank = {
  type = 'car',
  name = 'mammothtank',
  icon = path .. '/graphics/icons/mammothicon.png',
  icon_size = 64,
  flags = { 'placeable-neutral', 'player-creation', 'placeable-off-grid', 'not-flammable' },
  minable = { mining_time = 0.5, result = 'mammothtank' },
  mined_sound = { filename = '__core__/sound/deconstruct-large.ogg', volume = 0.8 },
  max_health = 4000,
  corpse = 'tank-remnants',
  dying_explosion = 'tank-explosion',
  alert_icon_shift = util.by_pixel(0, -13),
  immune_to_tree_impacts = true,
  immune_to_rock_impacts = true,
  equipment_grid = 'mammothmk3-equipment-grid',
  energy_per_hit_point = 0.2,
  resistances = {
    { type = 'fire', decrease = 30, percent = 65 },
    { type = 'physical', decrease = 30, percent = 65 },
    { type = 'impact', decrease = 60, percent = 80 },
    { type = 'explosion', decrease = 100, percent = 85 },
    { type = 'acid', decrease = 10, percent = 65 },
    { type = 'electric', decrease = 30, percent = 50 },
    { type = 'laser', decrease = 30, percent = 50 }
  },
  collision_box = { { -1.75, -1.75 }, { 1.75, 1.75 } },
  selection_box = { { -2, -2 }, { 2, 2 } },
  damaged_trigger_effect = hit_effects.entity(),
  -- drawing_box = {{-2.1, -2.1}, {1.9, 1.9}},
  effectivity = 1.2,
  braking_power = '800kW',
  burner = {
    fuel_category = 'chemical',
    effectivity = 1.2,
    fuel_inventory_size = 6,
    smoke = {
      {
        name = 'tank-smoke',
        deviation = { 0.25, 0.25 },
        frequency = 50,
        position = { -0.2, 1 },
        starting_frame = 0,
        starting_frame_deviation = 60
      }, {
        name = 'tank-smoke',
        deviation = { 0.25, 0.25 },
        frequency = 50,
        position = { 0.2, 1 },
        starting_frame = 0,
        starting_frame_deviation = 60
      }
    }
  },
  consumption = '600kW',
  terrain_friction_modifier = 0.3,
  friction = 0.003,
  light = {
    {
      type = 'oriented',
      minimum_darkness = 0.3,
      picture = {
        filename = '__core__/graphics/light-cone.png',
        priority = 'extra-high',
        flags = { 'light' },
        scale = 2,
        width = 200,
        height = 200
      },
      shift = { -0.7, -14 },
      size = 2,
      intensity = 0.8,
      color = { r = 1.0, g = 1.0, b = 0.8 },
      source_orientation_offset = 0
    }, {
      type = 'oriented',
      minimum_darkness = 0.3,
      picture = {
        filename = '__core__/graphics/light-cone.png',
        priority = 'extra-high',
        flags = { 'light' },
        scale = 2,
        width = 200,
        height = 200
      },
      shift = { 0.7, -14 },
      size = 2,
      intensity = 0.8,
      color = { r = 1.0, g = 1.0, b = 0.8 },
      source_orientation_offset = 0
    }
  },
  light_animation = {
    priority = 'low',
    draw_as_glow = true,
    blend_mode = 'additive',
    render_layer = 'object',
    width = 256,
    height = 256,
    frame_count = 2,
    direction_count = 64,
    shift = util.by_pixel(0, 0),
    animation_speed = 4,
    max_advance = 1,
    stripes = {
      {
        filename = path .. '/graphics/entity/mammothtank/lr-tank-light-1.png',
        width_in_frames = 2,
        height_in_frames = 16
      }, {
        filename = path .. '/graphics/entity/mammothtank/lr-tank-light-2.png',
        width_in_frames = 2,
        height_in_frames = 16
      }, {
        filename = path .. '/graphics/entity/mammothtank/lr-tank-light-3.png',
        width_in_frames = 2,
        height_in_frames = 16
      }, {
        filename = path .. '/graphics/entity/mammothtank/lr-tank-light-4.png',
        width_in_frames = 2,
        height_in_frames = 16
      }
    },
    hr_version = {
      priority = 'low',
      draw_as_glow = true,
      blend_mode = 'additive',
      render_layer = 'object',
      width = 512,
      height = 512,
      frame_count = 2,
      direction_count = 64,
      shift = util.by_pixel(0, 0),
      animation_speed = 4,
      max_advance = 1,
      stripes = {
        {
          filename = path .. '/graphics/entity/mammothtank/hr-tank-light-1.png',
          width_in_frames = 2,
          height_in_frames = 16
        }, {
          filename = path .. '/graphics/entity/mammothtank/hr-tank-light-2.png',
          width_in_frames = 2,
          height_in_frames = 16
        }, {
          filename = path .. '/graphics/entity/mammothtank/hr-tank-light-3.png',
          width_in_frames = 2,
          height_in_frames = 16
        }, {
          filename = path .. '/graphics/entity/mammothtank/hr-tank-light-4.png',
          width_in_frames = 2,
          height_in_frames = 16
        }
      },
      scale = 0.5
    }
  },
  animation = {
    layers = {
      {
        priority = 'low',
        render_layer = 'object',
        width = 256,
        height = 256,
        frame_count = 2,
        direction_count = 64,
        shift = util.by_pixel(0, 0),
        animation_speed = 2,
        max_advance = 1,
        stripes = {
          {
            filename = path .. '/graphics/entity/mammothtank/lr-tank-base-1.png',
            width_in_frames = 2,
            height_in_frames = 16
          }, {
            filename = path .. '/graphics/entity/mammothtank/lr-tank-base-2.png',
            width_in_frames = 2,
            height_in_frames = 16
          }, {
            filename = path .. '/graphics/entity/mammothtank/lr-tank-base-3.png',
            width_in_frames = 2,
            height_in_frames = 16
          }, {
            filename = path .. '/graphics/entity/mammothtank/lr-tank-base-4.png',
            width_in_frames = 2,
            height_in_frames = 16
          }
        },
        hr_version = {
          priority = 'low',
          render_layer = 'object',
          width = 512,
          height = 512,
          frame_count = 2,
          direction_count = 64,
          shift = util.by_pixel(0, 0),
          animation_speed = 2,
          max_advance = 1,
          stripes = {
            {
              filename = path .. '/graphics/entity/mammothtank/hr-tank-base-1.png',
              width_in_frames = 2,
              height_in_frames = 16
            }, {
              filename = path .. '/graphics/entity/mammothtank/hr-tank-base-2.png',
              width_in_frames = 2,
              height_in_frames = 16
            }, {
              filename = path .. '/graphics/entity/mammothtank/hr-tank-base-3.png',
              width_in_frames = 2,
              height_in_frames = 16
            }, {
              filename = path .. '/graphics/entity/mammothtank/hr-tank-base-4.png',
              width_in_frames = 2,
              height_in_frames = 16
            }
          },
          scale = 0.5
        }
      }, {
        priority = 'low',
        render_layer = 'object',
        width = 256,
        height = 256,
        frame_count = 2,
        apply_runtime_tint = true,
        direction_count = 64,
        shift = util.by_pixel(0, 0),
        max_advance = 1,
        line_length = 2,
        stripes = {
          {
            filename = path .. '/graphics/entity/mammothtank/lr-tank-base-mask-1.png',
            width_in_frames = 2,
            height_in_frames = 16
          }, {
            filename = path .. '/graphics/entity/mammothtank/lr-tank-base-mask-2.png',
            width_in_frames = 2,
            height_in_frames = 16
          }, {
            filename = path .. '/graphics/entity/mammothtank/lr-tank-base-mask-3.png',
            width_in_frames = 2,
            height_in_frames = 16
          }, {
            filename = path .. '/graphics/entity/mammothtank/lr-tank-base-mask-4.png',
            width_in_frames = 2,
            height_in_frames = 16
          }
        },
        hr_version = {
          priority = 'low',
          render_layer = 'object',
          width = 512,
          height = 512,
          frame_count = 2,
          apply_runtime_tint = true,
          direction_count = 64,
          shift = util.by_pixel(0, 0),
          max_advance = 1,
          line_length = 2,
          stripes = {
            {
              filename = path .. '/graphics/entity/mammothtank/hr-tank-base-mask-1.png',
              width_in_frames = 2,
              height_in_frames = 16
            }, {
              filename = path .. '/graphics/entity/mammothtank/hr-tank-base-mask-2.png',
              width_in_frames = 2,
              height_in_frames = 16
            }, {
              filename = path .. '/graphics/entity/mammothtank/hr-tank-base-mask-3.png',
              width_in_frames = 2,
              height_in_frames = 16
            }, {
              filename = path .. '/graphics/entity/mammothtank/hr-tank-base-mask-4.png',
              width_in_frames = 2,
              height_in_frames = 16
            }
          },
          scale = 0.5
        }
      }, {
        priority = 'low',
        render_layer = 'object',
        blend_mode = 'additive',
        draw_as_glow = true,
        width = 256,
        height = 256,
        frame_count = 2,
        direction_count = 64,
        shift = util.by_pixel(0, 0),
        max_advance = 1,
        stripes = util.multiplystripes(2, {
          {
            filename = path .. '/graphics/entity/mammothtank/lr-tank-base-glow-1.png',
            width_in_frames = 1,
            height_in_frames = 16
          }, {
            filename = path .. '/graphics/entity/mammothtank/lr-tank-base-glow-2.png',
            width_in_frames = 1,
            height_in_frames = 16
          }, {
            filename = path .. '/graphics/entity/mammothtank/lr-tank-base-glow-3.png',
            width_in_frames = 1,
            height_in_frames = 16
          }, {
            filename = path .. '/graphics/entity/mammothtank/lr-tank-base-glow-4.png',
            width_in_frames = 1,
            height_in_frames = 16
          }
        }),
        hr_version = {
          priority = 'low',
          render_layer = 'object',
          blend_mode = 'additive',
          draw_as_glow = true,
          width = 512,
          height = 512,
          frame_count = 2,
          direction_count = 64,
          shift = util.by_pixel(0, 0),
          max_advance = 1,
          stripes = util.multiplystripes(2, {
            {
              filename = path .. '/graphics/entity/mammothtank/hr-tank-base-glow-1.png',
              width_in_frames = 1,
              height_in_frames = 16
            }, {
              filename = path .. '/graphics/entity/mammothtank/hr-tank-base-glow-2.png',
              width_in_frames = 1,
              height_in_frames = 16
            }, {
              filename = path .. '/graphics/entity/mammothtank/hr-tank-base-glow-3.png',
              width_in_frames = 1,
              height_in_frames = 16
            }, {
              filename = path .. '/graphics/entity/mammothtank/hr-tank-base-glow-4.png',
              width_in_frames = 1,
              height_in_frames = 16
            }
          }),
          scale = 0.5
        }
      }, {
        priority = 'low',
        width = 256,
        height = 256,
        frame_count = 2,
        draw_as_shadow = true,
        direction_count = 64,
        shift = util.by_pixel(0, 0),
        max_advance = 1,
        stripes = util.multiplystripes(2, {
          {
            filename = path .. '/graphics/entity/mammothtank/lr-tank-base-shadow-1.png',
            width_in_frames = 1,
            height_in_frames = 16
          }, {
            filename = path .. '/graphics/entity/mammothtank/lr-tank-base-shadow-2.png',
            width_in_frames = 1,
            height_in_frames = 16
          }, {
            filename = path .. '/graphics/entity/mammothtank/lr-tank-base-shadow-3.png',
            width_in_frames = 1,
            height_in_frames = 16
          }, {
            filename = path .. '/graphics/entity/mammothtank/lr-tank-base-shadow-4.png',
            width_in_frames = 1,
            height_in_frames = 16
          }
        }),
        hr_version = {
          priority = 'low',
          width = 512,
          height = 512,
          frame_count = 2,
          draw_as_shadow = true,
          direction_count = 64,
          shift = util.by_pixel(0, 0),
          max_advance = 1,
          stripes = util.multiplystripes(2, {
            {
              filename = path .. '/graphics/entity/mammothtank/hr-tank-base-shadow-1.png',
              width_in_frames = 1,
              height_in_frames = 16
            }, {
              filename = path .. '/graphics/entity/mammothtank/hr-tank-base-shadow-2.png',
              width_in_frames = 1,
              height_in_frames = 16
            }, {
              filename = path .. '/graphics/entity/mammothtank/hr-tank-base-shadow-3.png',
              width_in_frames = 1,
              height_in_frames = 16
            }, {
              filename = path .. '/graphics/entity/mammothtank/hr-tank-base-shadow-4.png',
              width_in_frames = 1,
              height_in_frames = 16
            }
          }),
          scale = 0.5
        }
      }
    }
  },
  turret_animation = {
    layers = {
      {
        filename = path .. '/graphics/entity/mammothtank/lr-tank-turret.png',
        priority = 'low',
        render_layer = 'higher-object-above',
        line_length = 8,
        width = 256,
        height = 256,
        frame_count = 1,
        direction_count = 64,
        shift = util.by_pixel(0, 0),
        animation_speed = 8,
        hr_version = {
          filename = path .. '/graphics/entity/mammothtank/hr-tank-turret.png',
          priority = 'low',
          render_layer = 'higher-object-above',
          line_length = 8,
          width = 512,
          height = 512,
          frame_count = 1,
          direction_count = 64,
          animation_speed = 8,
          scale = 0.5
        }
      }, {
        filename = path .. '/graphics/entity/mammothtank/lr-tank-turret-mask.png',
        priority = 'low',
        render_layer = 'higher-object-above',
        line_length = 8,
        width = 256,
        height = 256,
        frame_count = 1,
        apply_runtime_tint = true,
        direction_count = 64,
        shift = util.by_pixel(0, 0),
        hr_version = {
          filename = path .. '/graphics/entity/mammothtank/hr-tank-turret-mask.png',
          priority = 'low',
          render_layer = 'higher-object-above',
          line_length = 8,
          width = 512,
          height = 512,
          frame_count = 1,
          apply_runtime_tint = true,
          direction_count = 64,
          scale = 0.5
        }
      }, {
        filename = path .. '/graphics/entity/mammothtank/lr-tank-turret-glow.png',
        priority = 'low',
        render_layer = 'higher-object-above',
        blend_mode = 'additive',
        draw_as_glow = true,
        line_length = 8,
        width = 256,
        height = 256,
        frame_count = 1,
        apply_runtime_tint = true,
        direction_count = 64,
        shift = util.by_pixel(0, 0),
        hr_version = {
          filename = path .. '/graphics/entity/mammothtank/hr-tank-turret-glow.png',
          priority = 'low',
          blend_mode = 'additive',
          draw_as_glow = true,
          render_layer = 'higher-object-above',
          line_length = 8,
          width = 512,
          height = 512,
          frame_count = 1,
          apply_runtime_tint = true,
          direction_count = 64,
          scale = 0.5
        }
      }, {
        filename = path .. '/graphics/entity/mammothtank/lr-tank-turret-shadow.png',
        priority = 'low',
        render_layer = 'higher-object-under',
        line_length = 8,
        width = 256,
        height = 256,
        frame_count = 1,
        draw_as_shadow = true,
        direction_count = 64,
        shift = util.by_pixel(0, 0),
        hr_version = {
          filename = path .. '/graphics/entity/mammothtank/hr-tank-turret-shadow.png',
          priority = 'low',
          render_layer = 'higher-object-under',
          line_length = 8,
          width = 512,
          height = 512,
          frame_count = 1,
          draw_as_shadow = true,
          direction_count = 64,
          shift = util.by_pixel(0, 0),
          scale = 0.5
        }
      }
    }
  },
  turret_rotation_speed = 0.25 / 60,
  turret_return_timeout = 300,
  sound_no_fuel = { { filename = '__base__/sound/fight/tank-no-fuel-1.ogg', volume = 0.4 } },
  sound_minimum_speed = 0.2,
  sound_scaling_ratio = 0.8,
  vehicle_impact_sound = sounds.generic_impact,
  working_sound = {
    sound = { filename = '__base__/sound/fight/tank-engine.ogg', volume = 0.37 },
    activate_sound = { filename = '__base__/sound/fight/tank-engine-start.ogg', volume = 0.37 },
    deactivate_sound = { filename = '__base__/sound/fight/tank-engine-stop.ogg', volume = 0.37 },
    match_speed_to_activity = true
  },
  stop_trigger_speed = 0.1,
  stop_trigger = {
    {
      type = 'play-sound',
      sound = { { filename = '__base__/sound/fight/tank-brakes.ogg', volume = 0.3 } }
    }
  },
  open_sound = { filename = '__base__/sound/fight/tank-door-open.ogg', volume = 0.48 },
  close_sound = { filename = '__base__/sound/fight/tank-door-close.ogg', volume = 0.43 },
  rotation_speed = 0.0030,
  tank_driving = true,
  weight = 20000,
  inventory_size = 128,
  track_particle_triggers = movement_triggers.tank,
  guns = settings.startup['mammothsettings'].value and mammoth_only or default_mammoth,
  water_reflection = _ENV.car_reflection(1.2)
}

data:extend{ tank, tank_recipe, tank_item }
