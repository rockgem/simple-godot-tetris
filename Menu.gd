extends Control



func _ready():
	OS.window_maximized = true


func _on_Play_pressed():
	get_tree().change_scene("res://TetrisBoardWithBorder.tscn")


func _on_Quit_pressed():
	get_tree().quit()
