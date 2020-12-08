extends KinematicBody2D
export (int) var pointsToGive

export (int) var speed = 300


func move(delta):
	position.x += speed * delta


func _physics_process(delta):
	$AnimationPlayer.play("Walk")
	move(delta)


func toggleDirection():
	speed *= -1


