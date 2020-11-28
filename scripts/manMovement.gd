extends RigidBody2D

func move(delta):
	
	linear_velocity = Vector2(300, 0)
	
	position += linear_velocity * delta
	
func _physics_process(delta):
	move(delta)

func toggleDirection():
	linear_velocity.x = -linear_velocity.x

func _on_WallLeft_body_entered(body):
	print(body)
	toggleDirection()


func _on_WallRight_body_entered(body):
	print(body)
	toggleDirection()
