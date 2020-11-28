extends RigidBody2D

var direction = 300

func move(delta):
	linear_velocity = Vector2(direction, 0)
	position += linear_velocity * delta


func _physics_process(delta):
	move(delta)


func toggleDirection():
	direction *= -1


func _on_Man_hits_WallLeft(_body):
	toggleDirection()


func _on_Man_hits_WallRight(_body):
	toggleDirection()
