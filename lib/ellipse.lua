local Ellipse = {}

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
  return x, y
end

return Ellipse
