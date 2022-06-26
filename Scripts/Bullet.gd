extends KinematicBody

export(float) var maximum_height
export(float) var speed

signal expired

func _ready():
	pass

func _process(_delta):
	var _col = move_and_collide(Vector3(0,speed,0) * _delta)
	
	var destroy_self = false
	
	if _col:
		if _col.collider:
			# work out what it is
			var barrierbrick = _col.collider as BarrierBrick
			if barrierbrick:
				pass
			var alien = _col.collider as Alien
			if alien:
				Singletons.alien_swarm.kill_alien(_col.collider)
			_col.collider.queue_free()
			destroy_self = true
	
	if(translation.y > maximum_height):
		destroy_self = true;

	if(destroy_self):
		emit_signal("expired")
		queue_free()
