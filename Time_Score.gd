extends CanvasLayer



func _ready():
	pass 


func update_score(score):
	$HBoxContainer2/ScoreContainer/Score.text = str(score)
	
func update_time():
	var sec = $HBoxContainer2/TimerContainer/Time.time_left()
	var minute = sec / 60
	$HBoxContainer2/TimerContainer/Timer.text = str(minute) + ":" + str(sec)

