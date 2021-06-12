extends KinematicBody2D


export var m_jumpSpeed: float
export var m_gravity: float
export var m_speed: float

var m_Acceleration: Vector2
var m_Velocity: Vector2


func _ready() -> void:
	pass 

func die() -> void:
	get_tree().reload_current_scene()


func _physics_process(delta) -> void:
	
	if Input.is_action_just_released("gameplay_jump") and m_Velocity.y < 0.0 :
		m_Velocity.y *= 0.3
	elif Input.is_action_just_pressed("gameplay_jump") and is_on_floor():
		m_Velocity.y -= m_jumpSpeed
	else:
		m_Velocity.y += m_gravity*delta
	
	if Input.is_action_pressed("gameplay_left"):
		m_Velocity.x = -m_speed
	elif Input.is_action_pressed("gameplay_right"):
		m_Velocity.x = m_speed
	else:
		m_Velocity.x = 0;
	
	m_Velocity = move_and_slide(m_Velocity, Vector2.UP)


