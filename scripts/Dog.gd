extends RigidBody2D

var dogDirection = -400

func move(delta):
	linear_velocity = Vector2(dogDirection, 0)
	position += linear_velocity * delta


func _physics_process(delta):
	$AnimationPlayer.play("Walk")
	move(delta)


func toggleDirection():
	dogDirection *= -1


func _on_Dog_hits_WallLeft(body):
	if(get_instance_id() == body.get_instance_id()):
		toggleDirection()


func _on_Dog_hits_WallRight(body):
	if(get_instance_id() == body.get_instance_id()):
		toggleDirection()
