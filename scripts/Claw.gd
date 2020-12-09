extends KinematicBody2D
signal pickedUpHuman

export (int) var speed = 4
export (int) var shootingSpeed = 5

var score = 0
var velocity = Vector2()
var hitFloor = false
var touchingLeftWall = false
var touchingRightWall = false
var shooting = false

func get_input():
	velocity = Vector2()
	#dok se vraca gore ne mici po x i vracaj po y
	if hitFloor:
		velocity.x = 0
		velocity.y -= 1
	#dok puca ne mici po x i spustaj po y
	elif shooting:
		velocity.x = 0
		velocity.y += 1
	elif Input.is_action_pressed('ui_left') and not touchingLeftWall:
		velocity.x -= 1
	elif Input.is_action_pressed('ui_right') and not touchingRightWall:
		velocity.x += 1
	

func _ready():
	score = 0

func _input(ev):
	if ev.is_action_pressed('ui_accept'):
		shooting = true
	   


func checkCollision(collision):
	if(collision):
		var inst = instance_from_id(collision.get_collider_id())
		if inst is KinematicBody2D:
			score += inst.pointsToGive
			inst.queue_free()
			emit_signal("pickedUpHuman")


func _physics_process(_delta):
	get_input()
	if shooting or hitFloor:
		velocity *= speed * shootingSpeed
	else:	
		velocity *= speed
	var collision = move_and_collide(velocity)
	checkCollision(collision)


func _on_WallLeft_body_entered(body):
	if(body.get_instance_id() == get_instance_id()):
		touchingLeftWall = true


func _on_WallRight_body_entered(body):
	if(body.get_instance_id() == get_instance_id()):
		touchingRightWall = true


func _on_WallLeft_body_exited(body):
	if(body.get_instance_id() == get_instance_id()):
		touchingLeftWall = false


func _on_WallRight_body_exited(body):
	if(body.get_instance_id() == get_instance_id()):
		touchingRightWall = false


func _on_Floor_body_entered(body):
	hitFloor = true
	

func _on_Ceiling_body_entered(body):
	shooting = false
	hitFloor = false
