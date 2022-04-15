local path = ('__MammothMK3__')

data:extend{
  {
    type = 'technology',
    name = 'mammothtank',
    icon_size = 256,
    icon = path .. '/graphics/icons/mammothtech.png',
    effects = {
      { type = 'unlock-recipe', recipe = 'mammothtank' }, -- {
      --   type = "unlock-recipe",
      --   recipe = "dual-mammoth-shell",
      -- },
      { type = 'unlock-recipe', recipe = 'mammoth-shell' }
    },
    prerequisites = { 'laser', 'tank'},
    unit = {
      count = 150,
      ingredients = {
        { 'automation-science-pack', 1 }, { 'logistic-science-pack', 1 },
        { 'military-science-pack', 1 }, { 'chemical-science-pack', 1 }
      },
      time = 40
    },
    order = 'a-j-b'
  }, {
    type = 'technology',
    name = 'mammoth-1',
    icon_size = 64,
    icon = path .. '/graphics/icons/mammothicon.png',
    effects = { { type = 'ammo-damage', ammo_category = 'dual-shell', modifier = 0.2 } },
    prerequisites = { 'mammothtank' },
    unit = {
      count = 100 * 1,
      ingredients = {
        { 'automation-science-pack', 1 }, { 'logistic-science-pack', 1 },
        { 'military-science-pack', 1 }, { 'chemical-science-pack', 1 }
      },
      time = 30
    },
    upgrade = true,
    order = 'e-j-a'
  }, {
    type = 'technology',
    name = 'mammoth-2',
    icon_size = 64,
    icon = path .. '/graphics/icons/mammothicon.png',
    effects = { { type = 'ammo-damage', ammo_category = 'dual-shell', modifier = 0.2 } },
    prerequisites = { 'mammoth-1' },
    unit = {
      count = 100 * 2,
      ingredients = {
        { 'automation-science-pack', 1 }, { 'logistic-science-pack', 1 },
        { 'military-science-pack', 1 }, { 'chemical-science-pack', 1 }
      },
      time = 30
    },
    upgrade = true,
    order = 'e-l-b'
  }, {
    type = 'technology',
    name = 'mammoth-3',
    icon_size = 64,
    icon = path .. '/graphics/icons/mammothicon.png',
    effects = { { type = 'ammo-damage', ammo_category = 'dual-shell', modifier = 0.3 } },
    prerequisites = { 'mammoth-2' },
    unit = {
      count = 100 * 3,
      ingredients = {
        { 'automation-science-pack', 1 }, { 'logistic-science-pack', 1 },
        { 'military-science-pack', 1 }, { 'chemical-science-pack', 1 }
      },
      time = 60
    },
    upgrade = true,
    order = 'e-l-c'
  }, {
    type = 'technology',
    name = 'mammoth-4',
    icon_size = 64,
    icon = path .. '/graphics/icons/mammothicon.png',
    effects = { { type = 'ammo-damage', ammo_category = 'dual-shell', modifier = 0.4 } },
    prerequisites = { 'mammoth-3' },
    unit = {
      count = 100 * 4,
      ingredients = {
        { 'automation-science-pack', 1 }, { 'logistic-science-pack', 1 },
        { 'military-science-pack', 1 }, { 'chemical-science-pack', 1 }
      },
      time = 60
    },
    upgrade = true,
    order = 'e-l-d'
  }, {
    type = 'technology',
    name = 'mammoth-5',
    icon_size = 64,
    icon = path .. '/graphics/icons/mammothicon.png',
    effects = { { type = 'ammo-damage', ammo_category = 'dual-shell', modifier = 0.5 } },
    prerequisites = { 'mammoth-4' },
    unit = {
      count = 100 * 5,
      ingredients = {
        { 'automation-science-pack', 1 }, { 'logistic-science-pack', 1 },
        { 'chemical-science-pack', 1 }, { 'military-science-pack', 1 },
        { 'utility-science-pack', 1 }
      },
      time = 60
    },
    upgrade = true,
    order = 'e-l-e'
  }, {
    type = 'technology',
    name = 'mammoth-6',
    icon_size = 64,
    icon = path .. '/graphics/icons/mammothicon.png',
    effects = { { type = 'ammo-damage', ammo_category = 'dual-shell', modifier = 0.7 } },
    prerequisites = { 'mammoth-5' },
    unit = {
      count = 100 * 6,
      ingredients = {
        { 'automation-science-pack', 1 }, { 'logistic-science-pack', 1 },
        { 'chemical-science-pack', 1 }, { 'military-science-pack', 1 },
        { 'utility-science-pack', 1 }
      },
      time = 60
    },
    upgrade = true,
    order = 'e-l-f'
  }, {
    type = 'technology',
    name = 'mammoth-7',
    icon_size = 64,
    icon = path .. '/graphics/icons/mammothicon.png',
    effects = { { type = 'ammo-damage', ammo_category = 'dual-shell', modifier = 0.9 } },
    prerequisites = { 'mammoth-6', 'space-science-pack' },
    unit = {
      count_formula = 2 ^ (14 - 7) * 8,
      ingredients = {
        { 'automation-science-pack', 1 }, { 'logistic-science-pack', 1 },
        { 'chemical-science-pack', 1 }, { 'military-science-pack', 1 },
        { 'utility-science-pack', 1 }, { 'space-science-pack', 1 }
      },
      time = 60
    },
    max_level = 'infinite',
    upgrade = true,
    order = 'e-l-f'
  }, {
    type = 'technology',
    name = 'mammoth-Shooting-Speed-1',
    icon_size = 64,
    icon = path .. '/graphics/icons/mammothicon.png',
    effects = { { type = 'gun-speed', ammo_category = 'dual-shell', modifier = 0.2 } },
    prerequisites = { 'mammothtank' },
    unit = {
      count = 100 * 1,
      ingredients = {
        { 'automation-science-pack', 1 }, { 'logistic-science-pack', 1 },
        { 'military-science-pack', 1 }, { 'chemical-science-pack', 1 }
      },
      time = 30
    },
    upgrade = true,
    order = 'e-j-a'
  }, {
    type = 'technology',
    name = 'mammoth-Shooting-Speed-2',
    icon_size = 64,
    icon = path .. '/graphics/icons/mammothicon.png',
    effects = { { type = 'gun-speed', ammo_category = 'dual-shell', modifier = 0.2 } },
    prerequisites = { 'mammoth-Shooting-Speed-1' },
    unit = {
      count = 100 * 2,
      ingredients = {
        { 'automation-science-pack', 1 }, { 'logistic-science-pack', 1 },
        { 'military-science-pack', 1 }, { 'chemical-science-pack', 1 }
      },
      time = 30
    },
    upgrade = true,
    order = 'e-l-b'
  }, {
    type = 'technology',
    name = 'mammoth-Shooting-Speed-3',
    icon_size = 64,
    icon = path .. '/graphics/icons/mammothicon.png',
    effects = { { type = 'gun-speed', ammo_category = 'dual-shell', modifier = 0.3 } },
    prerequisites = { 'mammoth-Shooting-Speed-2' },
    unit = {
      count = 100 * 3,
      ingredients = {
        { 'automation-science-pack', 1 }, { 'logistic-science-pack', 1 },
        { 'military-science-pack', 1 }, { 'chemical-science-pack', 1 }
      },
      time = 60
    },
    upgrade = true,
    order = 'e-l-c'
  }, {
    type = 'technology',
    name = 'mammoth-Shooting-Speed-4',
    icon_size = 64,
    icon = path .. '/graphics/icons/mammothicon.png',
    effects = { { type = 'gun-speed', ammo_category = 'dual-shell', modifier = 0.4 } },
    prerequisites = { 'mammoth-Shooting-Speed-3' },
    unit = {
      count = 100 * 4,
      ingredients = {
        { 'automation-science-pack', 1 }, { 'logistic-science-pack', 1 },
        { 'military-science-pack', 1 }, { 'chemical-science-pack', 1 }
      },
      time = 60
    },
    upgrade = true,
    order = 'e-l-d'
  }, {
    type = 'technology',
    name = 'mammoth-Shooting-Speed-5',
    icon_size = 64,
    icon = path .. '/graphics/icons/mammothicon.png',
    effects = { { type = 'gun-speed', ammo_category = 'dual-shell', modifier = 0.4 } },
    prerequisites = { 'mammoth-Shooting-Speed-4' },
    unit = {
      count = 100 * 5,
      ingredients = {
        { 'automation-science-pack', 1 }, { 'logistic-science-pack', 1 },
        { 'chemical-science-pack', 1 }, { 'military-science-pack', 1 },
        { 'utility-science-pack', 1 }
      },
      time = 60
    },
    upgrade = true,
    order = 'e-l-e'
  }, {
    type = 'technology',
    name = 'mammoth-Shooting-Speed-6',
    icon_size = 64,
    icon = path .. '/graphics/icons/mammothicon.png',
    effects = {
      { type = 'ammo-damage', ammo_category = 'dual-shell', modifier = 0.7 },
      { type = 'ammo-damage', ammo_category = 'beam', modifier = 0.6 }
    },
    prerequisites = { 'mammoth-Shooting-Speed-5' },
    unit = {
      count = 100 * 6,
      ingredients = {
        { 'automation-science-pack', 1 }, { 'logistic-science-pack', 1 },
        { 'chemical-science-pack', 1 }, { 'military-science-pack', 1 },
        { 'utility-science-pack', 1 }
      },
      time = 60
    },
    upgrade = true,
    order = 'e-l-f'
  }, {
    type = 'technology',
    name = 'mammoth-Shooting-Speed-7',
    icon_size = 64,
    icon = path .. '/graphics/icons/mammothicon.png',
    effects = {
      { type = 'ammo-damage', ammo_category = 'dual-shell', modifier = 0.10 },
      { type = 'ammo-damage', ammo_category = 'beam', modifier = 0.6 }
    },
    prerequisites = { 'mammoth-Shooting-Speed-6', 'space-science-pack' },
    unit = {
      count_formula = 2 ^ (14 - 7) * 8,
      ingredients = {
        { 'automation-science-pack', 1 }, { 'logistic-science-pack', 1 },
        { 'chemical-science-pack', 1 }, { 'military-science-pack', 1 },
        { 'utility-science-pack', 1 }, { 'space-science-pack', 1 }
      },
      time = 60
    },
    max_level = 'infinite',
    upgrade = true,
    order = 'e-l-f'
  }
}
