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
		RootController.enable_debug_scene()
	
	# all boot logic done, now enter front end
	RootController.enter_front_end()

func _process(_delta):
	pass

