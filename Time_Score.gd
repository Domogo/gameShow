extends CanvasLayer



func _ready():
	pass 


func update_score(score):
	$HBoxContainer2/ScoreContainer/Score.text = str(score)
	
func update_time():
	var sec = $HBoxContainer2/TimerContainer/Time.get_time_left()
<<<<<<< HEAD
=======
	
	sec = int(sec) 
	print(sec)
>>>>>>> bd40669105c240e0ca86a3ff602a502ded68dab3
	var minute = sec / 60
	sec = sec % 60
	if sec < 10:
		$HBoxContainer2/TimerContainer/Timer.text = str(minute) + ":0" + str(sec)
	else:
		$HBoxContainer2/TimerContainer/Timer.text = str(minute) + ":" + str(sec)

		

