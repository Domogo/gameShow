extends Node2D

# 0-man, 1-blondeWoman, 2-dog, 3-redheadWoman, 4-blondeMan, 5-brownHairMan, 6-gingerMan
export (Array, PackedScene) var Mob

var mobCounter = 1


func _ready():
	VisualServer.set_default_clear_color(Color("#4d1c46"))


func new_game():
	$Claw.visible = true
	$EnemyTimer.wait_time = 1
	$EnemyTimer.start()
	print($EnemyTimer)


func _on_WallLeft_body_entered(body):
	for i in self.get_children():
		if(i.get_instance_id() == body.get_instance_id()):
			i.toggleDirection()
		


func _on_WallRight_body_entered(body):
	for i in self.get_children():
		if(i.get_instance_id() == body.get_instance_id()):
			i.toggleDirection()


func _on_EnemyTimer_timeout():
	var mob
	var rollRange = floor(rand_range(0, 20))
	print(rollRange)
	
	#man
	if rollRange >= 0 and rollRange <= 5:
		mob = Mob[0].instance()
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
	
	print(mob)
	mobCounter += 1
	if(mobCounter <= 10):
		$EnemyTimer.wait_time = rand_range(1,2)
		$EnemyTimer.start()
