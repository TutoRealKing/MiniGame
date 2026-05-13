extends Node2D

var score = 0
var target = 250
var time = 10
var played = false

func _ready():
	$WinLabel.visible = false
	$TimeUpLabel.visible = false
	$RestartButton.visible = false

func _on_Button_pressed():
	score += 1
	$AudioStreamPlayer2D.play()
	$ScoreLabel.text = str(score)
	int(score)

func _on_Button2_pressed():
	score += 5
	$AudioStreamPlayer2D.play()
	$ScoreLabel.text = str(score)
	int(score)

func _on_Timer2_timeout():
	$Timer.text = str(time)
	if time > 0:
		time -= 1
	elif time == 0:
		$Button.disabled = true
		$Button2.disabled = true
		$RestartButton.visible = true
		if score >= target:
			if played == false:
				$VictorySound.play()
				played = true
			$WinLabel.visible = true
		else:
			$TimeUp.play()
			$TimeUpLabel.visible = true
			
func restart_game():
	played = false
	score = 0
	$ScoreLabel.text = str(score)
	time = 10
	$Timer.text = str(time)
	$Button.disabled = false
	$Button2.disabled = false
	$WinLabel.visible = false
	$TimeUpLabel.visible = false
	
func _on_RestartButton_pressed():
	$AudioStreamPlayer2D.play()
	$RestartButton.visible = false
	restart_game()
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
