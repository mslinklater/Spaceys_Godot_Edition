extends Node

export(PackedScene) var debug_scene
export(PackedScene) var front_end_scene
export(PackedScene) var game_scene

func _enter_tree():
	print("Boot_enter_tree()")

func _exit_tree():
	print("Boot_exit_tree()")

func _init():
	print("Boot_init()")

func _ready():
	print("Boot_ready()")
	
	# debug UI
	if OS.is_debug_build():
		# add debug scene to root
		add_child(debug_scene.instance())
	
	# front end
	add_child(front_end_scene.instance())

func _process(delta):
	pass
