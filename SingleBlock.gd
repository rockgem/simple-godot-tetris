extends Node2D

var blue = preload("res://Images/Single Blocks/Blue.png")
var green = preload("res://Images/Single Blocks/Green.png")
var light_green = preload("res://Images/Single Blocks/LightGreen.png")
var orange = preload("res://Images/Single Blocks/Orange.png")
var red = preload("res://Images/Single Blocks/Red.png")
var pink = preload("res://Images/Single Blocks/Pink.png")
var yellow = preload("res://Images/Single Blocks/Yellow.png")
var ghost = preload("res://Images/Ghost Blocks/Single.png")

func init(color, overlay_ghost):
	var textures = []
	match color:
		Constants.COLOR.BLUE: textures.append(blue)
		Constants.COLOR.GREEN: textures.append(green)
		Constants.COLOR.LIGHTBLUE: textures.append(light_green)
		Constants.COLOR.ORANGE: textures.append(orange)
		Constants.COLOR.RED: textures.append(red)
		Constants.COLOR.PINK: textures.append(pink)
		Constants.COLOR.YELLOW: textures.append(yellow)
		
	if overlay_ghost: textures.append(ghost)
	
	for texture in textures:
		var sprite : Sprite = Sprite.new()
		sprite.centered = false
		sprite.position.x = 0
		sprite.position.y = 0
		sprite.scale = Vector2(0.5, 0.5)
		sprite.set_texture(texture)
		add_child(sprite)
