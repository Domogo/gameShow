extends KinematicBody2D

var dogDirection = -400

func move(delta):
	position.x += dogDirection * delta


func _physics_process(delta):
	$AnimationPlayer.play("Walk")
	move(delta)


func toggleDirection():
	dogDirection *= -1
