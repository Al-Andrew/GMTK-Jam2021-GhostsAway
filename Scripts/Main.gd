extends Node2D

export var next_scene: PackedScene

var nr_ghosts: int = 0
var door_open: bool = false

func register_ghost() -> void:
	nr_ghosts += 1

func remove_ghost() -> void:
	nr_ghosts -= 1

func _physics_process(delta):
	Global.level_time += delta
	if nr_ghosts == 0 and not door_open :
		$Door.open()
		door_open = true


func _on_PlayerEnd_body_entered(body):
	if body.is_in_group("Player") and door_open :
		$Door.close()
		$Control.show_time(Global.level_time)
		Global.total_time += Global.level_time
		Global.level_time = 0
		yield(get_tree().create_timer(2.0), "timeout")
		get_tree().change_scene_to(next_scene)
