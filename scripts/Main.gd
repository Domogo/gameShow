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
	$Claw/Timer_Score/HBoxContainer2/TimerContainer/Time.start()
	$Claw.visible = true
	$EnemyTimer.wait_time = 1
	$EnemyTimer.start()
	$Background/Image.visible = true
	$GroundSprite.visible = true
	$Claw/Timer_Score.update_time()


func _process(_delta):
	$Claw/Timer_Score.update_time()
	contestant_animation()



func _on_WallLeft_body_entered(body):
		for i in self.get_children():
			if(i.get_instance_id() == body.get_instance_id() and body.get_instance_id() != $Claw.get_instance_id()):
				i.toggleDirection()
		


func _on_WallRight_body_entered(body):
	for i in self.get_children():
		if(i.get_instance_id() == body.get_instance_id() and body.get_instance_id() != $Claw.get_instance_id()):
			i.toggleDirection()

func spawnMobs():
	var mob
	var rangeStart = 0
	var rangeEnd = 15
	if $Claw/Timer_Score/HBoxContainer2/TimerContainer/Time.get_time_left() <= 100:
		rangeStart = 6
	elif $Claw/Timer_Score/HBoxContainer2/TimerContainer/Time.get_time_left() <= 70:
		rangeStart = 11
	elif $Claw/Timer_Score/HBoxContainer2/TimerContainer/Time.get_time_left() <= 40:
		rangeStart = 15
		rangeEnd = 21
	elif $Claw/Timer_Score/HBoxContainer2/TimerContainer/Time.get_time_left() <= 20:
		rangeStart = 19
	randomize()
	var rollRange = floor(rand_range(rangeStart, rangeEnd))
	#man
	if rollRange >= 0 and rollRange <= 5:
		mob = Mob[0].instance()
	#blondeWoman	
	elif rollRange >= 6 and rollRange <= 9:
		mob = Mob[1].instance()
	#blondeMan
	elif rollRange >= 10 and rollRange <= 12:
		mob = Mob[4].instance()
	#dog
	elif rollRange >= 13 and rollRange <= 15:
		mob = Mob[2].instance()
	#brownHairMan
	elif rollRange >= 16 and rollRange <= 18:
		mob = Mob[5].instance()
	#gingerMan
	elif rollRange == 19:
		mob = Mob[6].instance()
	#redHead
	elif rollRange == 20 :
		mob = Mob[3].instance()
	#ninja
	elif rollRange == 21 :
		mob = Mob[7].instance()
	if mob:
		mobCounter += 1
	mob.position = Vector2(rand_range(50, 750), 550)
	add_child(mob)


func _on_EnemyTimer_timeout():
	$EnemyTimer.wait_time = rand_range(1,2)
	$EnemyTimer.start()
	if(mobCounter < 10):
		spawnMobs()
	
	
func contestant_animation():
	if $Claw.position.x < 200:
		$Background/Image.texture = CONTESTANT_LOOKING_LEFT
	elif $Claw.position.x > 400:
		$Background/Image.texture = CONTESTANT_LOOKING_RIGHT
	else:
		$Background/Image.texture = CONTESTANT_LOOKING_DOWN


func _on_Claw_pickedUpHuman():
	mobCounter -= 1

