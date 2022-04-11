data:extend{
  {
    type = 'particle-source',
    name = 'mini-nuclear-smouldering-smoke-source',
    subgroup = 'particles',
    time_to_live = 60 * 60,
    time_to_live_deviation = 30 * 60,
    time_before_start = 90,
    time_before_start_deviation = 60,
    height = 0.4,
    height_deviation = 0.1,
    vertical_speed = 0,
    vertical_speed_deviation = 0,
    horizontal_speed = 0,
    horizontal_speed_deviation = 0,
    smoke = {
      {
        name = 'soft-fire-smoke',
        frequency = 0.10, -- 0.25,
        position = { 0.0, 0 }, -- -0.8},
        starting_frame_deviation = 60,
        starting_vertical_speed = 0.01,
        starting_vertical_speed_deviation = 0.005,
        vertical_speed_slowdown = 1 -- 0.99
      }
    }
  }
}
