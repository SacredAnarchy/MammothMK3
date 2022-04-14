--- @meta

--- @class Mammoth.data
--- @field action string
--- @field next_tick uint
--- @field entity LuaEntity
--- @field ammo LuaItemStack

local actions = {
    ['mammoth-cannon'] = require('actions/mammoth-cannon')
  }

  return actions
