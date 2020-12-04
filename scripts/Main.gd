extends Node2D

export (Array, PackedScene) var Mob

func _ready():
	VisualServer.set_default_clear_color(Color("#4d1c46"))


func new_game():
	$Claw.visible = true
	$EnemyTimer.wait_time = 1
	$EnemyTimer.start()


func _on_WallLeft_body_entered(body):
	for i in self.get_children():
		if(i.get_instance_id() == body.get_instance_id()):
			i.toggleDirection()
		


func _on_WallRight_body_entered(body):
	for i in self.get_children():
		if(i.get_instance_id() == body.get_instance_id()):
			i.toggleDirection()


func _on_EnemyTimer_timeout():
	var index = floor(rand_range(0, Mob.size()))
	print(index)
	var mob = Mob[index].instance()
	mob.position = Vector2(rand_range(50, 750), 550)
	add_child(mob)
	$EnemyTimer.wait_time = rand_range(0,1)
	$EnemyTimer.start()
