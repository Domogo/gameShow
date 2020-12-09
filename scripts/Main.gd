extends Node2D

# 0-man, 1-blondeWoman, 2-dog, 3-redheadWoman, 4-blondeMan, 5-brownHairMan, 6-gingerMan 7-ninja
export (Array, PackedScene) var Mob

var CONTESTANT_LOOKING_LEFT = preload("res://assets/contestantLookingLeft.png")
var CONTESTANT_LOOKING_DOWN = preload("res://assets/contestantLookingDown.png")
var CONTESTANT_LOOKING_RIGHT = preload("res://assets/contestantLookingRight.png")

var mobCounter = 0


func _ready():
	VisualServer.set_default_clear_color(Color("#4d1c46"))


func new_game():
	$Claw.visible = true
	$EnemyTimer.wait_time = 1
	$EnemyTimer.start()
	$Background/Image.visible = true
	$GroundSprite.visible = true
	print($EnemyTimer)


func _process(_delta):
	contestant_animation()


func _on_WallLeft_body_entered(body):
		for i in self.get_children():
			if(i.get_instance_id() == body.get_instance_id() and body.get_instance_id() != $Claw.get_instance_id()):
				i.toggleDirection()
		


func _on_WallRight_body_entered(body):
	for i in self.get_children():
		if(i.get_instance_id() == body.get_instance_id() and body.get_instance_id() != $Claw.get_instance_id()):
			i.toggleDirection()


func _on_EnemyTimer_timeout():
	var mob
	randomize()
	var rollRange = floor(rand_range(0, 21))
	print(rollRange)
	
	#man
	if rollRange >= 0 and rollRange <= 5:
		mob = Mob[7].instance()
		mob.position = Vector2(rand_range(50, 750), 550)
		add_child(mob)
	#blondeWoman	
	elif rollRange >= 6 and rollRange <= 9:
		mob = Mob[1].instance()
		mob.position = Vector2(rand_range(50, 750), 550)
		add_child(mob)
	#blondeMan
	elif rollRange >= 10 and rollRange <= 12:
		mob = Mob[4].instance()
		mob.position = Vector2(rand_range(50, 750), 550)
		add_child(mob)
	#dog
	elif rollRange >= 13 and rollRange <= 15:
		mob = Mob[2].instance()
		mob.position = Vector2(rand_range(50, 750), 550)
		add_child(mob)
	#brownHairMan
	elif rollRange >= 16 and rollRange <= 18:
		mob = Mob[5].instance()
		mob.position = Vector2(rand_range(50, 750), 550)
		add_child(mob)
	#gingerMan
	elif rollRange == 19:
		mob = Mob[6].instance()
		mob.position = Vector2(rand_range(50, 750), 550)
		add_child(mob)
	#redHead
	elif rollRange == 20 :
		mob = Mob[3].instance()
		mob.position = Vector2(rand_range(50, 750), 550)
		add_child(mob)
	elif rollRange == 21 :
		mob = Mob[7].instance()
		mob.position = Vector2(rand_range(50, 750), 550)
		add_child(mob)
	mobCounter += 1
	if(mobCounter <= 10):
		$EnemyTimer.wait_time = rand_range(1,2)
		$EnemyTimer.start()


func contestant_animation():
	if $Claw.position.x < 200:
		$Background/Image.texture = CONTESTANT_LOOKING_LEFT
	elif $Claw.position.x > 400:
		$Background/Image.texture = CONTESTANT_LOOKING_RIGHT
	else:
		$Background/Image.texture = CONTESTANT_LOOKING_DOWN


func _on_Claw_pickedUpHuman():
	mobCounter -= 1
