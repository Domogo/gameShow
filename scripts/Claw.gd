extends KinematicBody2D

export (int) var speed = 400

var velocity = Vector2()
var touchingLeftWall = false
var touchingRightWall = false

func get_input():
	velocity = Vector2()
	if Input.is_action_pressed('ui_right') and not touchingRightWall:
		velocity.x += 1
	if Input.is_action_pressed('ui_left') and not touchingLeftWall:
		velocity.x -= 1
	velocity = velocity.normalized() * speed

func _physics_process(_delta):
	get_input()
	velocity = move_and_slide(velocity)


func _on_Claw_hits_WallLeft(_body):
	touchingLeftWall = true


func _on_Claw_hits_WallRight(_body):
	touchingRightWall = true


func _on_Claw_left_WallLeft(_body):
	touchingLeftWall = false


func _on_Claw_left_WallRight(_body):
	touchingRightWall = false


func new_game():
	pass # Replace with function body.
