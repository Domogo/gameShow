extends Node2D


func _ready():
	VisualServer.set_default_clear_color(Color("#4d1c46"))


func new_game():
	$Claw.visible = true
	$Man.visible = true
	$Dog.visible = true
