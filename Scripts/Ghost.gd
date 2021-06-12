extends KinematicBody2D

export var maxSpeed:float
var player

var direction: Vector2 
var speed: float
var distance: float

func _ready() -> void :
	player = get_parent().get_node("Player")

func _physics_process(delta):
	distance = (player.position - position).length()
	speed = lerp(0.2, maxSpeed, (distance+50)/100)
	direction = (player.position - position).normalized()
	if not $AnimationPlayer.is_playing() :
		var colision := move_and_collide(direction*speed)
		if colision != null:
			var body = colision.collider
			if body.is_in_group("Player"):
				body.die()

func die():
	$AnimationPlayer.play("dissapear")

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "dissapear":
		get_tree().reload_current_scene()
