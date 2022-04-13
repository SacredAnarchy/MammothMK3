require('bonus-gui-ordering')
for k, v in pairs(data.raw['ammo-category']) do
  if not v.bonus_gui_order then
    v.bonus_gui_order = bonus_gui_ordering[k]
  end
end

local dual_cannon_script_effect = { type = 'script', effect_id = 'fire-mammoth-dual-cannon' }

for _, ammo in pairs(data.raw.ammo) do
  if ammo.ammo_type and ammo.ammo_type.category == 'cannon-shell' then
    local payload = ammo.ammo_type.action and ammo.ammo_type.action.action_delivery
    if payload then
      if payload.projectile == ammo.name:gsub('%-shell$', '-projectile') then
        log('Dual Cannon adding {ammo.name}')
        if not payload.target_effects then
          payload.target_effects = { dual_cannon_script_effect }
        else
          if payload.target_effects.type then
            payload.target_effects = { payload.target_effects, dual_cannon_script_effect }
          else
            payload.target_effects[#payload.target_effects + 1] = dual_cannon_script_effect
          end
        end
      end
    end
  end
end
