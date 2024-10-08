GLOBAL_LIST_EMPTY(projectors)
GLOBAL_LIST_EMPTY(clones)
GLOBAL_LIST_EMPTY(clones_t)

SUBSYSTEM_DEF(fz_transitions)
	name = "Z-Transitions"
	wait = 1 SECONDS
	priority = SS_PRIORITY_FZ_TRANSITIONS
	init_order = SS_INIT_FZ_TRANSITIONS
	flags = SS_KEEP_TIMING

/datum/controller/subsystem/fz_transitions/stat_entry(msg)
	msg = "P:[length(GLOB.projectors)]|C:[length(GLOB.clones)]|T:[length(GLOB.clones_t)]"
	return ..()

/datum/controller/subsystem/fz_transitions/Initialize()
	for(var/obj/effect/projector/P in world)
		GLOB.projectors.Add(P)
	return SS_INIT_SUCCESS

/datum/controller/subsystem/fz_transitions/fire(resumed = FALSE)
	for(var/obj/effect/projector/P in GLOB.projectors)
		if(!P || !P.loc)
			GLOB.projectors -= P
			continue
		if(!P.loc.clone)
			P.loc.create_clone(P.vector_x, P.vector_y, P.vector_z)

		if(P.loc.contents)
			for(var/atom/movable/O in P.loc.contents)
				if(!istype(O, /obj/effect/projector) && !istype(O, /mob/dead/observer) && !istype(O, /obj/structure/stairs) && !istype(O, /obj/structure/catwalk) && O.type != /atom/movable/clone)
					if(!O.clone) //Create a clone if it's on a projector
						O.create_clone_movable(P.vector_x, P.vector_y, P.vector_z)
					else
						O.clone.proj_x = P.vector_x //Make sure projection is correct
						O.clone.proj_y = P.vector_y
						O.clone.proj_z = P.vector_z


	for(var/atom/movable/clone/C in GLOB.clones)
		if(C.mstr == null || !istype(C.mstr.loc, /turf))
			C.mstr.destroy_clone() //Kill clone if master has been destroyed or picked up
		else
			if(C != C.mstr)
				C.mstr.update_clone() //NOTE: Clone updates are also forced by player movement to reduce latency

	for(var/atom/T in GLOB.clones_t)
		if(T.clone && T.icon_state) //Just keep the icon updated for explosions etc.
			T.clone.icon_state = T.icon_state
