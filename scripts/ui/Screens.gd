extends Node

signal start_game

var current_screen = null


func _ready():
	register_buttons()
	change_screen($MainMenu)


func register_buttons():
	var buttons = get_tree().get_nodes_in_group("buttons")
	for button in buttons:
		button.connect("pressed", self, "_on_button_pressed", [button.name])

func _on_button_pressed(name):
	match name:
		"PlayButton":
			change_screen(null)
			emit_signal("start_game")
		"HowToButton":
			$MainMenu.toggle_active_text()
			$MainMenu.choose_text_to_display()	


func change_screen(new_screen):
	if current_screen:
		current_screen.disappear()
		yield(current_screen.tween, "tween_completed")
	current_screen = new_screen
	if new_screen:
		current_screen.appear()
		yield(current_screen.tween, "tween_completed")


func game_over():
	change_screen($GameOverScreen)
