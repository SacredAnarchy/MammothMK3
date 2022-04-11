local mammoth_gun_shot = {
  name = 'mammoth-gun-shot',
  type = 'sound',
  variations = {
    { filename = '__base__/sound/fight/artillery-shoots-1.ogg', volume = 0.8 },
    { filename = '__base__/sound/fight/artillery-shoots-2.ogg', volume = 0.8 }
    --{ filename = '__base__/sound/fight/heavy-gunshot-3.ogg', volume = 0.4 },
    --{ filename = '__base__/sound/fight/heavy-gunshot-4.ogg', volume = 0.4 }
  }
}

data:extend{ mammoth_gun_shot }

return mammoth_gun_shot
