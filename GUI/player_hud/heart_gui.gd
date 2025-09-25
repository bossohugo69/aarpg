class_name HeartGUI extends Control


@onready var sprite = $Sprite2D


var value : int = 2 :
	set( _value ):
		value = _value
		update_spite()


func update_spite() -> void:
	sprite.frame = value
