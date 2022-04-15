if not __DebugAdapter then
    __DebugAdapter = {
        print = function(...) end
    }
end

require("prototypes/items")
require("prototypes/technology")

require("prototypes/mammoth/tank")

require("prototypes/entity/projectiles")
require("prototypes/entity/smoke")
require("prototypes/entity/particles")
require("prototypes/entity/explosions")

require("prototypes/equipment-grid")
require("prototypes/sounds")
