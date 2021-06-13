extends KinematicBody2D

export (PackedScene) var chain

export var maxSpeed:float
var player

var direction: Vector2 
var speed: float
var distance: float

func _ready() -> void :
	player = get_parent().get_node("Player")
	var ch :Node2D = chain.instance()
	ch.player = player.get_node("ChainAttach")
	ch.ghost = get_node("ChainAttach")
	
	get_parent().call_deferred("add_child",ch)

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
		queue_free()
