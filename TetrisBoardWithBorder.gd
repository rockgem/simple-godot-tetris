extends Node2D

onready var you_lose = $YouLoseNode
onready var score_label = get_node('%ScoreLabel')

var SAVE_PATH = 'user://player_data.json'
var player_data = {
	'high_scores': []
}

func _ready():
	OS.window_maximized = true
	
	you_lose.visible = false
	
	var file = File.new()
	if file.file_exists(SAVE_PATH):
		load_game()
	else:
		save_game()
	
	file.close()

func game_lost():
	add_to_highscore()
	
	you_lose.visible = true
	get_tree().paused = true


func add_to_highscore():
	player_data['high_scores'].append(score_label.rows_cleared)
	
	save_game()


func save_game():
	var file = File.new()
	file.open(SAVE_PATH, File.WRITE)
	file.store_string(to_json(player_data))
	file.close()


func load_game():
	var file = File.new()
	var e = file.open(SAVE_PATH, File.READ)
	
	player_data = parse_json(file.get_as_text())
	file.close()


func _on_TetrisBoard_lost_game(): game_lost()


func _on_Restart_pressed():
	get_tree().paused = false
	
	$TetrisBoard.landscape.clear_landscape()
	you_lose.visible = false
