# Controls the alien swarm

extends Spatial

class_name AlienSwarm

export(int, 1, 10) var num_columns 
export(int, 1, 6) var num_rows 

enum SwarmPhase { EMPTY, BUILDING, RUNNING } 

var current_phase = SwarmPhase.EMPTY
var active_list = []

func _ready():
	current_phase = SwarmPhase.EMPTY
	active_list = []
	
func _process(delta):
	match current_phase:
		SwarmPhase.EMPTY:
			pass
		SwarmPhase.BUILDING:
			pass
		SwarmPhase.RUNNING:
			pass
