local entity_id = GetUpdatedEntityID()
entity_id = EntityGetRootEntity(entity_id)

local comp = EntityGetFirstComponentIncludingDisabled(entity_id,"DamageModelComponent")
if comp then

    local materials = {
        "water",
        "mud",
        "water_swamp",
        "water_salt",
        "swamp",
        "snow",
        "water_ice",
        "water_fading",
        "apotheosis_water_fading_fast",
    }

    for k=1,#materials do
        EntitySetDamageFromMaterial( entity_id, materials[k], 0.003)
    end

end