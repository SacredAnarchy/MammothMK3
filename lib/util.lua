local util = {}

function util.round(n, d)
  if n >= 0 then
    return math.floor((n / d) + 0.5) * d
  else
    return math.ceil((n / d) - 0.5) * d
  end
end

return util
