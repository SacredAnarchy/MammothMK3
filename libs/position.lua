-- If only there was a library mod that had all these functions :)
local Position = {}

function Position.add_positions(one, two)
  local x1, y1 = one.x or one[1], one.y or one[2]
  local x2, y2 = two.x or two[1], two.y or two[2]
  return { x = x1 + x2, y = y1 + y2 }
end

function Position.offset64(orientation)
  return math.floor(orientation * 64) / 64
end

function Position.orientation_between(pos1, pos2)
  return Position.offset64((1 - (math.atan2(pos2.x - pos1.x, pos2.y - pos1.y) / math.pi)) / 2)
end

function Position.get_distance(pos1, pos2)
  local axbx = pos1.x - pos2.x
  local ayby = pos1.y - pos2.y
  return (axbx * axbx + ayby * ayby) ^ 0.5
end

function Position.offset_along_line(pos1, pos2, distance)
  distance = distance or 0

  local angle = math.atan2(pos2.x - pos1.x, pos2.y - pos1.y)
  local veclength = (distance >= 0 and distance) or (Position.get_distance(pos1, pos2) + distance)
  local x = pos1.x + math.sin(angle) * veclength
  local y = pos1.y + math.cos(angle) * veclength

  return { x = x, y = y }
end

return Position
