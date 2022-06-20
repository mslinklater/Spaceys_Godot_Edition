extends Camera

export(float) var distance = 0
export(float) var height = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	translation.z = distance
	translation.y = height

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
