extends Node2D

onready var you_lose = $YouLoseNode

func _ready():
	you_lose.visible = false
	
	OS.window_maximized = true

func game_lost():
	you_lose.visible = true
	get_tree().paused = true

func _on_TetrisBoard_lost_game(): game_lost()


func _on_Restart_pressed():
	get_tree().paused = false
	
	$TetrisBoard.landscape.clear_landscape()
	you_lose.visible = false
