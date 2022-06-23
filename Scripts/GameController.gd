extends Spatial

export(PackedScene) var alien_scene

func _enter_tree():
	print("Game_enter_tree()")

func _exit_tree():
	print("Game_exit_tree()")

func _init():
	print("Game_init()")

func _ready():
	pass # Replace with function body.

func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		quit_to_front_end()

# UI responders

func _on_QuitButton_pressed():
	quit_to_front_end()
	
func quit_to_front_end():
	RootController.enter_front_end()
	
