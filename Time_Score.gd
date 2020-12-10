extends CanvasLayer

signal timer_timeout

func _ready():
	pass


func update_score(score):
	$HBoxContainer2/ScoreContainer/Score.text = str(score)


func update_time():
	var sec = $HBoxContainer2/TimerContainer/Time.get_time_left()
	sec = int(sec) 
	var minute = sec / 60
	sec = sec % 60
	if sec < 10:
		$HBoxContainer2/TimerContainer/Timer.text = str(minute) + ":0" + str(sec)
	else:
		$HBoxContainer2/TimerContainer/Timer.text = str(minute) + ":" + str(sec)


func _on_Time_timeout():
	$HBoxContainer2.visible = false
	emit_signal("timer_timeout")
