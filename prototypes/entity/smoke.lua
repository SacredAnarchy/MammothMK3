local smoke_animations = require('__base__/prototypes/entity/smoke-animations')

data:extend{
  {
    type = 'trivial-smoke',
    name = 'mini-nuclear-smoke',
    spread_duration = 100,
    duration = 30,
    fade_in_duration = 10,
    fade_away_duration = 20,
    start_scale = 1,
    -- scale_deviation = 0.5, -- MAYBE: add support for scale deviation to trivial-smoke?
    end_scale = 0.1,
    render_layer = 'higher-object-under',
    color = { r = 0.627, g = 0.478, b = 0.345, a = 0.500 },
    affected_by_wind = true,
    cyclic = true,
    animation = smoke_animations.trivial_smoke_fast {
      animation_speed = 1 / 5,
      scale = 1,
      flags = { 'smoke', 'linear-magnification' }
    }
  }
}
