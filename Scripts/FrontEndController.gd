extends Node2D

func _ready():
	pass
	
func _process(_delta):
	pass

func _on_LaunchGameButton_pressed():
	RootController.enter_game()
	
func _on_QuitButton_pressed():
	var _err = OS.kill(OS.get_process_id())
