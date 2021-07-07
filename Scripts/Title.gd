extends Control

export var text:String

func _ready():
	$Label.text = text
	$AnimationPlayer.play("dissapear")
	pass 

func show_time(time:float ):
	$Label2.text = "%.f s" % time
	$AnimationPlayer.play("time")
