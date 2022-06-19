extends Node

# Setting these here since they are visible in the root scene
var debug_scene: PackedScene
var front_end_scene: PackedScene
var game_scene: PackedScene

enum Phase {BOOT, FRONT_END, LOADING, GAME }
var current_phase = Phase.BOOT
var desired_phase = Phase.BOOT

func _ready():
	print("Root_ready")
	var boot_scene = get_tree().get_root().find_node("BootSceneRoot", true, false)
	assert(boot_scene)
	debug_scene = boot_scene.debug_scene
	front_end_scene = boot_scene.front_end_scene
	game_scene = boot_scene.game_scene

func _process(_delta):
	if(desired_phase != current_phase):
		match desired_phase:
			Phase.FRONT_END:
				add_child(front_end_scene.instance())
				var game_node = find_node("GameRoot", true, false)
				if game_node:
					game_node.free()
			Phase.GAME:
				add_child(game_scene.instance())
				var front_end_node = find_node("FrontEndRoot", true, false)
				if front_end_node:
					front_end_node.free()
		current_phase = desired_phase

func enable_debug_scene():
	print("Root enable_debug_scene")
	add_child(debug_scene.instance())

func enter_front_end():
	print("Root enter_front_end")
	desired_phase = Phase.FRONT_END

func enter_game():
	print("Root enter_game")
	desired_phase = Phase.GAME
