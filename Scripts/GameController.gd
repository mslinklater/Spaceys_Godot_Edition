extends Spatial

func _enter_tree():
	print("Game_enter_tree()")

func _exit_tree():
	print("Game_exit_tree()")

func _init():
	print("Game_init()")

func _ready():
	pass # Replace with function body.

# UI responders

func _on_QuitButton_pressed():
	RootController.enter_front_end()
