extends Spatial

export(float) var maximum_height
export(float) var speed

signal expired

func _ready():
	pass

func _process(_delta):
	translation.y += speed * _delta
	if(translation.y > maximum_height):
		emit_signal("expired")
		queue_free()
