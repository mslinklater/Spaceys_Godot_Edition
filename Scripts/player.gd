extends Spatial

export(int, 0, 10) var move_speed
export(PackedScene) var bullet_scene

var base_node: MeshInstance
var barrel_node: MeshInstance
var bCanFire: bool = true

func _ready():
	base_node = $PlayerExport/Base
	barrel_node = $PlayerExport/Barrel

func _process(_delta):
	if Input.is_action_pressed("move_left"):
		translation.x -= _delta * move_speed
	if Input.is_action_pressed("move_right"):
		translation.x += _delta * move_speed
	if Input.is_action_pressed("fire") and bCanFire:
		bCanFire = false
		var bullet = bullet_scene.instance()
		get_tree().get_root().add_child(bullet)
		bullet.transform = transform
		bullet.connect("expired", self, "bullet_expired")

func bullet_expired():
	bCanFire = true		
