-- default biome functions that get called if we can't find a a specific biome that works for us
CHEST_LEVEL = 3
dofile_once("data/scripts/director_helpers.lua")
dofile_once("data/scripts/biome_scripts.lua")

function load_random_background_sprite_with_entity( what, x, y )
    if( what.total_prob == 0 ) then
        init_total_prob( what, x )
    end

    local r = ProceduralRandom(x,y) * what.total_prob
    for i,v in ipairs(what) do
        if( v.prob ~= nil ) then
            if( v.prob ~= 0 and r <= v.prob ) then
                if( is_empty( v.sprite_file) ) then
                    -- loading empty sprite, don't do anything
                    return
                else
                    -- LoadBackgroundSprite( string background_file, x, y, int background_z_index = 40 )
                    local z_index = 40
                    if( v.z_index ) then z_index = v.z_index end

                    LoadBackgroundSprite( v.sprite_file, x, y, z_index, true )
                    EntityLoad(v.entity_file, x, y)
                    return
                end
            else
                r = r - v.prob
            end
        end
    end
end

RegisterSpawnFunction( 0xffffeedd, "init" )
RegisterSpawnFunction( 0xff808000, "spawn_statues" )
RegisterSpawnFunction( 0xff00AC64, "load_pixel_scene4" )
RegisterSpawnFunction( 0xffC8C800, "spawn_lamp2" )
RegisterSpawnFunction( 0xff400080, "spawn_large_enemies" )
RegisterSpawnFunction( 0xffC8001A, "spawn_ghost_crystal" )
RegisterSpawnFunction( 0xff82FF5A, "spawn_crawlers" )
RegisterSpawnFunction( 0xff647D7D, "spawn_pressureplates" )
RegisterSpawnFunction( 0xff649B7D, "spawn_doors" )
RegisterSpawnFunction( 0xffA07864, "spawn_scavengers" )
RegisterSpawnFunction( 0xff00AC33, "load_pixel_scene3" )
RegisterSpawnFunction( 0xffFFCD2A, "spawn_scorpions" )
RegisterSpawnFunction( 0xff905ecb, "spawn_reward_wands" )
RegisterSpawnFunction( 0xff905ecc, "spawn_boss_limbs_trigger" )
RegisterSpawnFunction( 0xff783060, "load_background_window" )
RegisterSpawnFunction( 0xff378ec4, "load_background_drape" )

------------ small enemies -------------------------------

g_small_enemies =
{
	total_prob = 0,
	{
		prob   		= 2.5,
		min_count	= 0,
		max_count	= 0,    
		entity 	= ""
	},
	{
		prob   		= 0.15,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "data/entities/animals/wizard_corrupt_manaeater.xml"
	},
	{
		prob   		= 0.005,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "data/entities/animals/thundermage_big.xml"
	},
	{
		prob   		= 0.2,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "data/entities/animals/wizard_corrupt_neutral.xml"
	},
	{
		prob   		= 0.1,
		min_count	= 1,
		max_count	= 2,    
		entity 	= "data/entities/animals/thunderskull.xml"
	},
	{
		prob   		= 0.1,
		min_count	= 1,
		max_count	= 2,    
		entity 	= "data/entities/animals/crypt/enlightened_alchemist.xml"
	},
	{
		prob   		= 0.2,
		min_count	= 1,
		max_count	= 2,    
		entity 	= "data/entities/animals/wizard_corrupt_hearty.xml"
	},
	{
		prob   		= 0.05,
		min_count	= 1,
		max_count	= 2,    
		entity 	= "data/entities/animals/wizard_weaken.xml"
	},
	{
		prob   		= 0.05,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "data/entities/buildings/manadrain_crystal.xml"
	},
	{
		prob   		= 0.10,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "data/entities/animals/wizard_corrupt_swapper.xml"
	},
	{
		prob   		= 0.10,
		min_count	= 5,
		max_count	= 7,  
		entity 	= "data/entities/animals/seeker.xml"
	},
	{
		prob   		= 0.10,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "data/entities/animals/evil_temple/wizard_wands.xml"
	},
	{
		prob   		= 0.10,
		min_count	= 1,
		max_count	= 2,    
		entity 	= "data/entities/animals/wraith_alchemy_apotheosis.xml"
	},
}

g_stash =
{
	total_prob = 0,
	{
		prob   		= 0.4,
		min_count	= 1,
		max_count	= 1, 
		entity 	= "",
	},
	{
		prob   		= 0.6,
		min_count	= 1,
		max_count	= 1, 
		entity 	= "data/entities/items/pickup/heart.xml",
	},
}

g_reward_items =
{
	total_prob = 0,
	{
		prob   		= 0,
		min_count	= 0,
		max_count	= 0,    
		entity 	= ""
	},
	{
		prob   		= 5,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "data/entities/items/wand_level_06.xml"
	},
	{
		prob   		= 3,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "data/entities/items/wand_unshuffle_05.xml"
	},
	{
		prob   		= 1,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "data/entities/items/wand_unshuffle_05.xml"
	},
}

g_big_enemies =
{
	total_prob = 0,
	{
		prob   		= 2.5,
		min_count	= 0,
		max_count	= 0,    
		entity 	= ""
	},
	{
		prob   		= 0.1,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "data/entities/animals/devourer_magic.xml"
	},
	{
		prob   		= 0.3,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "data/entities/animals/crypt/hideous_mass.xml" --Originally the red variant.. but I wanted more familiar creatures for the player to feel safe around and accustomed to
	},
	{
		prob   		= 0.5,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "data/entities/animals/lukki_tentacle_hungry.xml"
	},
	{
		prob   		= 0.1,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "data/entities/animals/worm_spine.xml" --Not sure how to make you look badass
	},
	{
		prob   		= 0.25,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "data/entities/animals/wizard_corrupt_ambrosia.xml"
	},
	{
		prob   		= 0.25,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "data/entities/animals/wizard_wands.xml"
	},
	{
		prob   		= 0.15,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "data/entities/animals/miniboss_pit_02.xml"
	},
}

g_statues =
{
	total_prob = 0,
	-- add skullflys after this step
	{
		prob   		= 1.0,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "mods/apotheosis/files/entities/props/statue_anvil.xml"
	},
}

g_scorpions =
{
	total_prob = 0,
	{
		prob   		= 0.2,
		min_count	= 1,
		max_count	= 1,    
		entity 	= ""
	},
		-- add skullflys after this step
	{
		prob   		= 0.3,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "data/entities/animals/scorpion.xml"
	},
}

g_pixel_scene_02 =
{
	total_prob = 0,
	{
		prob   			= 1.0,
		material_file 	= "mods/apotheosis/files/biome_impl/evil_temple/stairs_right.png",
		visual_file		= "",
		background_file	= "",
		is_unique		= 0
	},
}

g_pixel_scene_04 =
{
	total_prob = 0,
	{
		prob   			= 1.0,
		material_file 	= "mods/apotheosis/files/biome_impl/evil_temple/stairs_left.png",
		visual_file		= "",
		background_file	= "",
		is_unique		= 0
	},
}

g_lamp =
{
	total_prob = 0,
	-- add skullflys after this step
	{
		prob   		= 0.3,
		min_count	= 1,
		max_count	= 1,    
		entity 	= ""
	},
	{
		prob   		= 0.7,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "data/entities/props/physics_torch_stand_blue.xml"
	},
	{
		prob   		= 0.1,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "data/entities/props/physics_skull_01.xml"
	},
	{
		prob   		= 0.1,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "data/entities/props/physics_skull_02.xml"
	},
	{
		prob   		= 0.1,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "data/entities/props/physics_skull_03.xml"
	},
}

g_lamp2 =
{
	total_prob = 0,
	-- add skullflys after this step
	{
		prob   		= 0.0,
		min_count	= 1,
		max_count	= 1,    
		entity 	= ""
	},
	{
		prob   		= 1.0,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "mods/apotheosis/files/entities/props/physics/chain_torch_bloody.xml"
	},
}

g_save =
{
	total_prob = 0,
	{
		prob   		= 0.5,
		min_count	= 0,
		max_count	= 0,    
		entity 	= ""
	},
	{
		prob   		= 0.8,
		min_count	= 1,
		max_count	= 1, 
		offset_y	= -4,
		entity 	= "data/entities/buildings/save_point.xml"
	},
}

g_props =
{
	total_prob = 0,
	{
		prob   		= 0.2,
		min_count	= 0,
		max_count	= 0,
		offset_y 	= 0,    
		entity 	= ""
	},
	{
		prob   		= 0.5,
		min_count	= 1,
		max_count	= 1,
		offset_y	= -4,
		entity 	= "data/entities/props/physics_vase.xml"
	},
	{
		prob   		= 0.3,
		min_count	= 1,
		max_count	= 1,
		offset_y	= -4,		
		entity 	= "data/entities/props/physics_vase_longleg.xml"
	},
	{
		prob   		= 0.1,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "data/entities/props/physics_skull_01.xml"
	},
	{
		prob   		= 0.1,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "data/entities/props/physics_skull_02.xml"
	},
	{
		prob   		= 0.1,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "data/entities/props/physics_skull_03.xml"
	},
}

g_unique_enemy =
{
	total_prob = 0,
	-- this is air, so nothing spawns at 0.6
	{
		prob   		= 0.1,
		min_count	= 0,
		max_count	= 0,    
		entity 	= ""
	},
	-- add skullflys after this step
	{
		prob   		= 1.0,
		min_count	= 1,
		max_count	= 1,  
		offset_x	= 2,		
		entity 	= "data/entities/buildings/eviltemple_tentacle_trap_right.xml"
	},
}

g_large_enemies =
{
	total_prob = 0,
	-- this is air, so nothing spawns at 0.6
	{
		prob   		= 0.1,
		min_count	= 0,
		max_count	= 0,    
		entity 	= ""
	},
	-- add skullflys after this step
	{
		prob   		= 1.0,
		min_count	= 1,
		max_count	= 1,  
		offset_x	= 1,
		entity 	= "data/entities/buildings/eviltemple_tentacle_trap_left.xml"
	},
}

g_ghost_crystal =
{
	total_prob = 0,
	-- this is air, so nothing spawns at 0.6
	{
		prob   		= 1.0,
		min_count	= 0,
		max_count	= 0,    
		entity 	= ""
	},
}

g_scavengers =
{
	total_prob = 0,
	-- this is air, so nothing spawns at 0.6
	{
		prob   		= 0.9,
		min_count	= 0,
		max_count	= 0,    
		entity 	= ""
	},
	-- add skullflys after this step
	{
		prob   		= 0.1,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "data/entities/animals/lukki_tentacle_hungry.xml"
	},
}

g_pressureplates =
{
	total_prob = 0,
	{
		prob   		= 1.0,
		min_count	= 1,
		max_count	= 1, 
		entity 	= "data/entities/props/pressure_plate.xml"
	},
}

g_doors =
{
	total_prob = 0,
	{
		prob   		= 1.0,
		min_count	= 1,
		max_count	= 1, 
		entity 	= "data/entities/props/physics_templedoor.xml"
	},
}

g_candles =
{
	total_prob = 0,
	{
		prob   		= 0.33,
		min_count	= 1,
		max_count	= 1, 
		entity 	= "data/entities/props/physics_candle_1.xml"
	},
	{
		prob   		= 0.33,
		min_count	= 1,
		max_count	= 1, 
		entity 	= "data/entities/props/physics_candle_2.xml"
	},
	{
		prob   		= 0.33,
		min_count	= 1,
		max_count	= 1, 
		entity 	= "data/entities/props/physics_candle_3.xml"
	},
}

g_pixel_scene_01 =
{
	total_prob = 0,
	{
		prob   			= 2.0,
		material_file 	= "mods/apotheosis/files/biome_impl/evil_temple/challenge.png",
		visual_file		= "",
		background_file	= "",
		is_unique		= 0
	},
	{
		prob   			= 2.0,
		material_file 	= "data/biome_impl/crypt/mining.png",
		visual_file		= "",
		background_file	= "",
		is_unique		= 0
	},
}

g_pixel_scene_03 =
{
	total_prob = 0,
	{
		prob   			= 2.0,
		material_file 	= "mods/apotheosis/files/biome_impl/evil_temple/lavaroom.png",
		visual_file		= "mods/apotheosis/files/biome_impl/evil_temple/lavaroom_visual.png",
		background_file	= "",
		is_unique		= 0
	},
	{
		prob   			= 2.0,
		material_file 	= "mods/apotheosis/files/biome_impl/evil_temple/pit.png",
		visual_file		= "",
		background_file	= "",
		is_unique		= 0
	},
	{
		prob   			= 2.0,
		material_file 	= "mods/apotheosis/files/biome_impl/evil_temple/symbolroom.png",
		visual_file		= "",
		background_file	= "",
		is_unique		= 0
	},
}

g_ghostlamp =
{
	total_prob = 0,
	-- add skullflys after this step
	{
		prob   		= 1.0,
		min_count	= 1,
		max_count	= 1,
		entity 	= "mods/apotheosis/files/entities/props/physics/chain_torch_bloody.xml"
	},
}

g_background_windows =
{
	total_prob = 0,
	{
		prob   			= 3.0,
		sprite_file		= "",
	},
	{
		prob   			= 1.0,
		sprite_file		= "mods/apotheosis/files/biome_impl/evil_temple/alcove_window_background.png",
		entity_file 	= "mods/apotheosis/files/entities/buildings/alcove_window_glow.xml"
	},
}

g_background_drapes =
{
	total_prob = 0,
	{
		prob   			= 4.0,
		sprite_file		= "",
	},
	{
		prob   			= 1.0,
		sprite_file		= "mods/apotheosis/files/biome_impl/evil_temple/drape_1.png"
	},	
	{
		prob   			= 0.66,
		sprite_file		= "mods/apotheosis/files/biome_impl/evil_temple/drape_2.png"
	},
	{
		prob   			= 0.33,
		sprite_file		= "mods/apotheosis/files/biome_impl/evil_temple/drape_3.png"
	},
}

-- actual functions that get called from the wang generator

function spawn_small_enemies(x, y)
	spawn(g_small_enemies,x,y)
end

function spawn_big_enemies(x, y)
	spawn(g_big_enemies,x,y)
end

function spawn_items(x, y)
	return
end

function spawn_statues(x, y)
	spawn(g_statues,x-4,y)
end

function spawn_chest(x, y)
	return
end

function spawn_save(x, y) end

function spawn_stash(x,y)
end

function load_pixel_scene2( x, y )
	load_random_pixel_scene( g_pixel_scene_02, x+6, y)
end

function load_pixel_scene4( x, y )
	load_random_pixel_scene( g_pixel_scene_04, x-5, y)
end

function spawn_lamp(x, y)
	spawn(g_lamp,x+4,y-8,0,0)
end

function spawn_lamp2(x, y)
	spawn(g_lamp2,x,y,0,0)
end

function spawn_props(x, y)
	spawn(g_props,x-4,y-4,0,0)
end

function spawn_unique_enemy(x, y)
	spawn(g_unique_enemy,x-1,y,0,0)
end

function spawn_large_enemies(x, y)
	spawn(g_large_enemies,x-1,y,0,0)
end

function spawn_ghost_crystal(x, y)
	spawn(g_ghost_crystal,x-1,y,0,0)
end

function spawn_crawlers(x, y) end

function spawn_pressureplates(x, y)
	spawn(g_pressureplates,x,y,0,0)
end

function spawn_doors(x, y)
	spawn(g_doors,x,y,0,0)
end

function load_pixel_scene( x, y )
	load_random_pixel_scene( g_pixel_scene_01, x, y )
end

function load_pixel_scene3( x, y )
	load_random_pixel_scene( g_pixel_scene_03, x, y )
end

function spawn_scavengers(x, y)
	spawn(g_scavengers,x,y,0,0)
end

function spawn_scorpions(x, y)
	spawn(g_scorpions,x,y)
end

function init( x, y, w, h )
	-- print( "init called: " .. x .. ", " .. y )
end

function spawn_reward_wands( x, y )
	spawn(g_reward_items,x,y,0,0)
end

function spawn_boss_limbs_trigger( x, y )
	EntityLoad("data/entities/animals/boss_limbs/boss_limbs_trigger.xml", x, y )
	EntityLoad("data/entities/items/books/book_music_b.xml", x, y )
end

function load_background_window( x, y )
	load_random_background_sprite_with_entity( g_background_windows, x - 89 + 5, y - 57.5 )
end

function load_background_drape( x, y )
	load_random_background_sprite( g_background_drapes, x-18 + 5, y )
end

--Ideas
--corrupted versions of masters, punished by the gods
--
--Master of wounding: Disables healing for 60 seconds
--Master of swapping: Inflicts you with Curse of Swapping for 30 seconds, any damage you take does the swapper mage passive effect
--
--Master of haste: nearby creatures gain bonus movement speed and attack speed