extends Node2D

func _ready():
	pass
	
func _process(_delta):
	if Input.is_action_just_pressed("ui_cancel"):
		quit_program()

func _on_LaunchGameButton_pressed():
	RootController.enter_game()
	
func _on_QuitButton_pressed():
	quit_program()

func quit_program():
	var _err = OS.kill(OS.get_process_id())
	
