# Controls the alien swarm

extends Spatial

class_name AlienSwarm

export(int, 1, 10) var num_columns 
export(int, 1, 6) var num_rows 
export(Vector2) var spacing
export(PackedScene) var alien_scene
export(float) var move_extent
export(float) var move_amount
export(float) var drop_amount
export(float) var start_height
export(float) var per_level_drop

enum SwarmPhase { EMPTY, BUILDING, RUNNING } 
enum MoveDirection { RIGHT, DOWN, LEFT }

var current_phase = SwarmPhase.EMPTY
var current_move = MoveDirection.RIGHT
var active_list = []
var update_index = 0

func _ready():
	current_phase = SwarmPhase.EMPTY
	active_list = []
	Singletons.alien_swarm = self

func _exit_tree():
	Singletons.alien_swarm = null
	
func _process(delta):
	match current_phase:
		SwarmPhase.EMPTY:
			pass
		SwarmPhase.BUILDING:
			if active_list.size() < num_columns * num_rows:
				# add one more alien
				add_alien()
			else:
				current_phase = SwarmPhase.RUNNING
				update_index = 0
				current_move = MoveDirection.RIGHT
		SwarmPhase.RUNNING:
			move_aliens()

func kill_alien(alien):
	var alien_index = active_list.find(alien)
	if update_index >= alien_index:
		update_index -= 1
	var size = active_list.size()
	active_list.erase(alien)
	alien.queue_free()
	var new_size = active_list.size()
	assert(size == new_size + 1)

func move_aliens():
	match current_move:
		MoveDirection.LEFT:
			active_list[update_index].translation.x -= move_amount
		MoveDirection.RIGHT:
			active_list[update_index].translation.x += move_amount
		MoveDirection.DOWN:
			active_list[update_index].translation.x += drop_amount			
	update_index += 1
	update_index = update_index % active_list.size()

func add_alien():
	var new_index = active_list.size()
	var new_column = new_index % num_columns
	var new_row = new_index / num_columns
	var new_alien = alien_scene.instance()
	var swarm_width = spacing.x * num_columns
	new_alien.translation.x = (new_column * spacing.x) - move_extent - (swarm_width * 0.5)
	new_alien.translation.y = (new_row * spacing.y) + start_height
	add_child(new_alien)
	active_list.append(new_alien)
