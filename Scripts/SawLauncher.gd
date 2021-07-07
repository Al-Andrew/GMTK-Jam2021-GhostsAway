extends StaticBody2D


export var launch_speed: float
export var recharge_speed: float
export var start_delay: float
export var saw_scene: PackedScene
var saw
var running: bool



func release_saw() -> void :
	saw.speed = Vector2(cos(rotation - PI/2), sin(rotation - PI/2)) * launch_speed
	saw.get_node("Colision").disabled = false
	saw = null

func _ready() ->void :
	$Timer.start(start_delay)

func _physics_process(_delta):
	
	if not running:
		return;
	
	if saw == null :
		saw = saw_scene.instance()
		saw.position = $SawSpawnPoint.global_position
		saw.scale = Vector2.ZERO
		saw.rotation_speed = 0.5
		saw.destroy_on_colision = true
		saw.get_node("Colision").disabled = true
		get_parent().add_child(saw)
	
	if saw != null :
		saw.scale += Vector2.ONE * recharge_speed
		
		if saw.scale.x >= 1 :
			release_saw()


func _on_Timer_timeout():
	running = true
