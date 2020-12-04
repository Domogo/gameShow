extends KinematicBody2D

var direction = 300

func move(delta):
	position.x += direction * delta


func _physics_process(delta):
	$AnimationPlayer.play("Walk")
	move(delta)


func toggleDirection():
	direction *= -1


