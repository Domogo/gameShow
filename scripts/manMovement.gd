extends RigidBody2D

var direction = 300

func move(delta):
	linear_velocity = Vector2(direction, 0)
	position += linear_velocity * delta


func _physics_process(delta):
	$AnimationPlayer.play("Walk")
	move(delta)


func toggleDirection():
	direction *= -1


func _on_Man_hits_WallLeft(body):
	if(get_instance_id() == body.get_instance_id()):
		toggleDirection()


func _on_Man_hits_WallRight(body):
	if(get_instance_id() == body.get_instance_id()):
		toggleDirection()