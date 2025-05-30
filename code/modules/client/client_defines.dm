/client
	parent_type = /datum
		////////////////
		//ADMIN THINGS//
		////////////////
	var/datum/admins/admin_holder = null //Datum for storing admin permissions and other admin stuff
	var/datum/buildmode/buildmode = null

	// Holds the client's current mentorhelp thread
	var/datum/mentorhelp/current_mhelp = null

	var/last_message = "" //Contains the last message sent by this client - used to protect against copy-paste spamming.
	var/last_message_count = 0 //contins a number of how many times a message identical to last_message was sent.
	var/talked = 0
	var/chatWarn = 0
	/// The last urgent ahelp that this player sent
	COOLDOWN_DECLARE(urgent_ahelp_cooldown)

		/////////
		//OTHER//
		/////////
	var/datum/preferences/prefs = null
	var/move_delay = 0
	var/next_movement = 0
	var/moving = null
	var/adminobs = null
	var/area = null
	var/time_died_as_mouse = null //when the client last died as a mouse

	var/donator = FALSE
	var/adminhelped = 0

	var/datum/click_intercept = null

	var/atom/movable/screen/click_catcher/void

	var/country

		///////////////
		//SOUND STUFF//
		///////////////
	var/played = 0
	var/midi_silenced = 0
	var/datum/soundOutput/soundOutput
	var/list/volume_preferences = list(1, 0.5, 1, 0.6)//Game, music, admin midis, lobby music

		////////////
		//SECURITY//
		////////////
	var/next_allowed_topic_time = 10
	// comment out the line below when debugging locally to enable the options & messages menu
	//control_freak = 1

	var/received_irc_pm = -99999

	var/talked_at = 0 //Won't let someone say something again in under a second.
	var/talked_sum = 0 // running sum of chars spoke in past 5 minutes


		////////////////////////////////////
		//things that require the database//
		////////////////////////////////////
	var/player_age = "Requires database" //So admins know why it isn't working - Used to determine how old the account is - in days.
	var/related_accounts_ip = "Requires database" //So admins know why it isn't working - Used to determine what other accounts previously logged in from this ip
	var/related_accounts_cid = "Requires database" //So admins know why it isn't working - Used to determine what other accounts previously logged in from this computer id

	var/human_name_ban = FALSE

	var/xeno_prefix = "XX"
	var/xeno_postfix = ""
	var/xeno_name_ban = FALSE

	var/datum/entity/player_entity/player_entity = null

	//Asset cache
	// List of all asset filenames sent to this client by the asset cache, along with their assoicated md5s
	var/list/sent_assets = list()
	/// List of all completed blocking send jobs awaiting acknowledgement by send_asset
	var/list/completed_asset_jobs = list()
	/// Last asset send job id.
	var/last_asset_job = 0
	var/last_completed_asset_job = 0

	///world.time they connected
	var/connection_time

	preload_rsc = PRELOAD_RSC

	var/datum/player_details/player_details //these persist between logins/logouts during the same round.

	/// our current tab
	var/stat_tab

	///Our object window datum. It stores info about and handles behavior for the object tab
	var/datum/object_window_info/obj_window

	/// list of all tabs
	var/list/panel_tabs = list()

	///A lazy list of atoms we've examined in the last EXAMINE_MORE_TIME (default 1.5) seconds, so that we will call [/atom/proc/examine_more] instead of [/atom/proc/examine] on them when examining
	var/list/recent_examines

	///custom movement keys for this client
	var/list/movement_keys = list()

	///Are we locking our movement input?
	var/movement_locked = FALSE

	///Used for limiting the rate of topic sends by the client to avoid abuse
	var/list/topiclimiter

	/// A buffer of currently held keys.
	var/list/keys_held = list()
	/// A buffer for combinations such of modifiers + keys (ex: CtrlD, AltE, ShiftT). Format: `"key"` -> `"combo"` (ex: `"D"` -> `"CtrlD"`)
	var/list/key_combos_held = list()
	/*
	** These next two vars are to apply movement for keypresses and releases made while move delayed.
	** Because discarding that input makes the game less responsive.
	*/
	/// On next move, add this dir to the move that would otherwise be done
	var/next_move_dir_add
	/// On next move, subtract this dir from the move that would otherwise be done
	var/next_move_dir_sub

	//screen_text vars
	///lazylist of screen_texts for this client, first in this list is the one playing
	var/list/atom/movable/screen/text/screen_text/screen_texts

	/// Does this client have typing indicators enabled?
	var/typing_indicators = TRUE

	///datum that controls the displaying and hiding of tooltips
	var/datum/tooltip/tooltips

	/// If this client has any windows scaling applied
	var/window_scaling

	/// Holds the game master datum for this client
	var/datum/game_master/game_master_menu

	/// Holds the human AI manager panel for this client
	var/datum/human_ai_management_menu/human_ai_menu

	/// Holds the human faction manager panel for this client
	var/datum/human_faction_management_menu/human_faction_menu

	/// Holds the human defense creator panel for this client
	var/datum/human_defense_creator_menu/human_defense_menu

	/// Holds the human squad spawner panel for this client
	var/datum/human_squad_spawner_menu/human_squad_menu

	/// Holds the human squad spawner panel for this client
	var/datum/human_ai_spawner_menu/human_spawn_menu
