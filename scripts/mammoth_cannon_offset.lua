---@diagnostic disable: different-requires
local Ellipse = {}
local util = require('__MammothMK3__/lib/util')
local Pos = require('__MammothMK3__/lib/position')
local inspect = require('inspect')

function Ellipse:new(rx, ry, ox, oy)
  local ellipse = { radius = { x = rx, y = ry }, origin = { x = ox or 0, y = oy or 0 } }
  return setmetatable(ellipse, { __tostring = Ellipse.tostring, __index = Ellipse })
end

function Ellipse:point(x, y)
  return ((x - self.origin.x) ^ 2 + (y - self.origin.y) ^ 2) /
           (self.radius.x ^ 2 + self.radius.y ^ 2)
end

function Ellipse:getxy(real_orientation)
  local rad = math.rad((real_orientation - 0.25) % 1 * 360)
  local x = self.origin.x + (self.radius.x * math.cos(rad))
  local y = self.origin.y + (self.radius.y * math.sin(rad))
  return util.round(x, 1), util.round(y, 1)
end

local e = Ellipse:new(115, 90)

local offsets_left, offsets_right = {}, {}

for i = 0, 63 / 64, 1 / 64 do
  offsets_left[i] = { i, { Pos.from_pixel(e:getxy(i - 1 / 64)) } }
  offsets_right[i] = { i, { Pos.from_pixel(e:getxy(i + 1 / 64)) } }
end

print(inspect(offsets_left), inspect(offsets_right))
