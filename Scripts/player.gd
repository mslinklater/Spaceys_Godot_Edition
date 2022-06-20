extends Spatial

export(int, 0, 10) var move_speed
export(PackedScene) var bullet_scene

var base_node: MeshInstance
var barrel_node: MeshInstance
var bullet_spawn: Spatial
var bCanFire: bool = true

func _ready():
	base_node = $PlayerExport/Base
	barrel_node = $PlayerExport/Barrel
	bullet_spawn = $BulletSpawn

func _process(_delta):
	if Input.is_action_pressed("move_left"):
		translation.x -= _delta * move_speed
	if Input.is_action_pressed("move_right"):
		translation.x += _delta * move_speed
	if Input.is_action_pressed("fire") and bCanFire:
		bCanFire = false
		var bullet = bullet_scene.instance()
		get_tree().get_root().add_child(bullet)
		bullet.translation = to_global(bullet_spawn.translation)
		bullet.connect("expired", self, "bullet_expired")

func bullet_expired():
	bCanFire = true		
