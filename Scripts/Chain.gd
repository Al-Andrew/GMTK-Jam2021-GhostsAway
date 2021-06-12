extends Area2D

var player
var ghost
export var LongColor: Color
export var ShortColor: Color

func _ready() -> void:
	player = get_parent().get_node("Player/ChainAttach")
	ghost = get_parent().get_node("Ghost/ChainAttach")

func _physics_process(delta):
	var player_pos:Vector2 = player.global_position
	var ghost_pos:Vector2 = ghost.global_position
	$Line2d.set_point_position(0, player_pos)
	$Line2d.set_point_position(1, ghost_pos)
	var dist:float = (player_pos - ghost_pos).length()
	$Line2d.default_color = ShortColor.linear_interpolate(LongColor, dist/100)
	
	$Colision.shape.set_a(player_pos)
	$Colision.shape.set_b(ghost_pos)


func _on_Chain_body_entered(body):
	if body.is_in_group("Shuriken"):
		ghost.get_parent().die()
		queue_free()
