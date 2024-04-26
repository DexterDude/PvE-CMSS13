// STANDARD

/obj/structure/closet/secure_closet/freezer
	name = "refrigerator"
	icon = 'icons/obj/structures/machinery/kitchen.dmi'
	icon_state = "fridge1"
	icon_closed = "fridge"
	icon_locked = "fridge1"
	icon_opened = "fridgeopen"
	icon_broken = "fridgebroken"
	icon_off = "fridge1"
	storage_capacity = 60 // given extra storage so everything can fit, according to the original PVP-CM PR

/obj/structure/closet/secure_closet/freezer/update_icon()
	if(broken)
		icon_state = icon_broken
	else
		if(!opened)
			if(locked)
				icon_state = icon_locked
			else
				icon_state = icon_closed
		else
			icon_state = icon_opened

/obj/structure/closet/secure_closet/freezer/general
	name = "refrigerator"

/obj/structure/closet/secure_closet/freezer/general/Initialize()
	. = ..()
	var/i = 0
	for(i to 5)
		new /obj/item/reagent_container/food/snacks/flour(src)
		new /obj/item/reagent_container/food/snacks/meat/monkey(src)
	for(var/i in 2 to 2)
		new /obj/item/reagent_container/food/condiment/sugar(src)
		new /obj/item/reagent_container/food/drinks/milk(src)
		new /obj/item/storage/fancy/egg_box(src)

/obj/structure/closet/secure_closet/freezer/meat
	name = "meat refrigerator"

/obj/structure/closet/secure_closet/freezer/meat/Initialize()
	. = ..()
	var/i = 0
	for(i to 6)
		new /obj/item/reagent_container/food/snacks/meat/monkey(src)

/obj/structure/closet/secure_closet/freezer/fish
	name = "fish refrigerator"

/obj/structure/closet/secure_closet/freezer/fish/Initialize()
	. = ..()
	var/i = 0
	for(i to 6)
		new /obj/item/reagent_container/food/snacks/carpmeat(src)

/obj/structure/closet/secure_closet/freezer/produce
	name = "produce refrigerator"

/obj/structure/closet/secure_closet/freezer/produce/Initialize()
	. = ..()
	var/i = 0
	for(i to 1)
		new /obj/item/reagent_container/food/snacks/grown/apple(src)
		new /obj/item/reagent_container/food/snacks/grown/cabbage(src)
		new /obj/item/reagent_container/food/snacks/grown/carrot(src)
		new /obj/item/reagent_container/food/snacks/grown/mushroom/chanterelle(src)
		new /obj/item/reagent_container/food/snacks/grown/chili(src)
		new /obj/item/reagent_container/food/snacks/grown/corn(src)
		new /obj/item/reagent_container/food/snacks/grown/eggplant(src)
		new /obj/item/reagent_container/food/snacks/grown/potato(src)
		new /obj/item/reagent_container/food/snacks/grown/tomato(src)
		new /obj/item/reagent_container/food/snacks/grown/whitebeet(src)
		new /obj/item/reagent_container/food/snacks/grown/cherries(src)
		new /obj/item/reagent_container/food/snacks/grown/lime(src)
		new /obj/item/reagent_container/food/snacks/grown/lemon(src)
		new /obj/item/reagent_container/food/snacks/grown/orange(src)
		new /obj/item/reagent_container/food/snacks/grown/banana(src)

/obj/structure/closet/secure_closet/freezer/floursugar
	name = "pantry"

/obj/structure/closet/secure_closet/freezer/dry/Initialize()
	. = ..()

		new /obj/item/reagent_container/food/snacks/flour(src)
	var/i = 0
	for(i to 1)
		new /obj/item/reagent_container/food/condiment/sugar(src)

/obj/structure/closet/secure_closet/freezer/grocery
	name = "grocery refrigerator"

/obj/structure/closet/secure_closet/freezer/grocery/Initialize()
	. = ..()
	var/i = 0
	for(i to 1)
		new /obj/item/reagent_container/food/drinks/milk(src)
		new /obj/item/reagent_container/food/drinks/soymilk(src)
		new /obj/item/storage/fancy/egg_box(src)
	new /obj/item/reagent_container/food/condiment/enzyme(src)

// BULK STORAGE

/obj/structure/closet/secure_closet/freezer/meat/bulk
	name = "meat refrigerator"

/obj/structure/closet/secure_closet/freezer/meat/bulk/Initialize()
	. = ..()
	var/i = 0
	for(i to 1)
		new /obj/item/storage/box/foodproduct/meat(src)

/obj/structure/closet/secure_closet/freezer/fish/bulk
	name = "fish refrigerator"

/obj/structure/closet/secure_closet/freezer/fish/bulk/Initialize()
	. = ..()
	var/i = 0
	for(i to 1)
		new /obj/item/storage/box/foodproduct/fish(src)

/obj/structure/closet/secure_closet/freezer/grocery/bulk
	name = "grocery refrigerator"

/obj/structure/closet/secure_closet/freezer/grocery/bulk/Initialize()
	. = ..()
	var/i = 0
	for(i to 1)
		new /obj/item/storage/box/foodproduct/milk(src)
		new /obj/item/storage/box/foodproduct/soymilk(src)
		new /obj/item/storage/fancy/egg_box(src)
		new /obj/item/storage/box/foodproduct/enzyme(src)

/obj/structure/closet/secure_closet/freezer/dry/bulk
	name = "pantry"

/obj/structure/closet/secure_closet/freezer/dry/bulk/Initialize()
	. = ..()
	for(var/i in 4 to 4)
		new /obj/item/storage/box/foodproduct/flour(src)
	new /obj/item/storage/box/foodproduct/sugar(src)

/obj/structure/closet/secure_closet/freezer/produce/bulk
	name = "produce refrigerator"

/obj/structure/closet/secure_closet/freezer/produce/bulk/Initialize()
	. = ..()
	new /obj/item/storage/box/foodproduct/apple(src)
	new /obj/item/storage/box/foodproduct/banana(src)
	new /obj/item/storage/box/foodproduct/chanterelle(src)
	new /obj/item/storage/box/foodproduct/cherries(src)
	new /obj/item/storage/box/foodproduct/chili(src)
	new /obj/item/storage/box/foodproduct/cabbage(src)
	new /obj/item/storage/box/foodproduct/carrot(src)
	new /obj/item/storage/box/foodproduct/corn(src)
	new /obj/item/storage/box/foodproduct/eggplant(src)
	new /obj/item/storage/box/foodproduct/lemon(src)
	new /obj/item/storage/box/foodproduct/lime(src)
	new /obj/item/storage/box/foodproduct/orange(src)
	new /obj/item/storage/box/foodproduct/potato(src)
	new /obj/item/storage/box/foodproduct/tomato(src)
	new /obj/item/storage/box/foodproduct/whitebeet(src)

// #GIMMICK FREEZERS#

//Money

/obj/structure/closet/secure_closet/freezer/money
	name = "freezer"
	req_access = list(ACCESS_CIVILIAN_PUBLIC)

/obj/structure/closet/secure_closet/freezer/money/Initialize()
	. = ..()
	for(var/i = 0, i < 3, i++)
		new /obj/item/spacecash/c1000(src)
	for(var/i = 0, i < 5, i++)
		new /obj/item/spacecash/c500(src)
	for(var/i = 0, i < 6, i++)
		new /obj/item/spacecash/c200(src)

//Industrial

/obj/structure/closet/secure_closet/freezer/industry
	name = "industrial freezer"
	desc = "A powerful fine-tuned freezer used to polymerize chemicals in the cold. This one is set to the perfect temperature for paraformaldehyde polymerization. The freezer must be kept closed for polymerization."
	req_access = list(ACCESS_MARINE_OT)
	var/obj/structure/machinery/paraform_cooler/CU

/obj/structure/closet/secure_closet/freezer/industry/Initialize()
	CU = new /obj/structure/machinery/paraform_cooler()
	CU.freezer = src
	CU.start_processing()
	. = ..()

/obj/structure/closet/secure_closet/freezer/industry/Destroy()
	QDEL_NULL(CU)
	return ..()

//Paraform

/obj/structure/machinery/paraform_cooler
	var/cooldown = 5
	var/list/polymerization_recipe = list("formaldehyde" = 3, "water" = 3)
	var/obj/structure/closet/secure_closet/freezer/industry/freezer

/obj/structure/machinery/paraform_cooler/process()
	if(!istype(freezer) || freezer.opened)
		return
	if(cooldown)
		cooldown--
		return
	cooldown = 5
	var/containers = 0
	for(var/obj/item/reagent_container/glass/I in freezer.contents)
		if(I.reagents.replace_with(polymerization_recipe, "paraformaldehyde", 3))
			containers++
		if(containers > 3)
			break
