-- code borrowed from carbone mod by Calinou

minetest.register_node("boneworld:acid_flowing_active", {
	description = "Flowing Acid",
	inventory_image = minetest.inventorycube("mymod_acid.png"),
	drawtype = "flowingliquid",
	tiles = {"mymod_acid.png"},
	special_tiles = {
		{
			image = "mymod_acid_flowing_animated.png",
			backface_culling=false,
			animation={type = "vertical_frames", aspect_w= 16, aspect_h = 16, length = 0.6}
		},
		{
			image = "mymod_acid_flowing_animated.png",
			backface_culling=true,
			animation={type = "vertical_frames", aspect_w= 16, aspect_h = 16, length = 0.6}
		},
	},
	alpha = WATER_ALPHA,
	paramtype = "light",
	param1 = 0,
	light_source = 0,
	paramtype2 = "flowingliquid",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = false, -- now you cant build over it, only the source..
	drop = "",
	drowning = 2,
	liquidtype = "flowing",
	liquid_alternative_flowing = "boneworld:acid_flowing_active",
	liquid_alternative_source = "boneworld:acid_source_active",
	liquid_viscosity = WATER_VISC,
	damage_per_second = 5,
	post_effect_color = {a = 120, r = 50, g = 90, b = 30},
	groups = {water = 3, acid = 3, liquid = 3, puts_out_fire = 1, not_in_creative_inventory = 1},
})


minetest.register_node("boneworld:acid_source_active", {
	description = "Acid Source",
	inventory_image = minetest.inventorycube("mymod_acid.png"),
	drawtype = "liquid",
	tiles = {
		{name = "mymod_acid_source_animated.png", animation={type = "vertical_frames", aspect_w = 16, aspect_h = 16, length = 1.5}}
	},
	special_tiles = {
		-- New-style acid source material (mostly unused)
		{
			name = "mymod_acid_source_animated.png",
			animation = {type = "vertical_frames", aspect_w= 16, aspect_h = 16, length = 1.5},
			backface_culling = false,
		}
	},
	alpha = WATER_ALPHA,
	paramtype = "light",
	param1 = 0,
	light_source = 0,
	walkable = false,
	pointable = false,
	diggable = true,
	buildable_to = false, -- only fireball destroys it
	drop = "",
	drowning = 2,
	liquidtype = "source",
	liquid_alternative_flowing = "boneworld:acid_flowing_active",
	liquid_alternative_source = "boneworld:acid_source_active",
	liquid_viscosity = WATER_VISC,
	damage_per_second = 8, 
	post_effect_color = {a = 120, r = 50, g = 90, b = 30},
	groups = {water = 3, acid = 3, liquid = 3, puts_out_fire = 1},
})