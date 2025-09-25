class_name State_Lift extends State

@export var lift_audio : AudioStream

@onready var carry : Node = $"../Carry"





## What happends when the player enters this State?
func Enter() -> void:
	player.update_animation( "lift" )
	player.animation_player.animation_finished.connect( state_complete )
	player.audio.stream = lift_audio
	player.audio.play()
	pass


## What happends when the player exits this State?
func Exit() -> void:
	pass


## Waht happends during the _process update in this State?
func Process( _delta : float ) -> State:
	player.velocity = Vector2.ZERO
	return null


## What happends during the _physics_process update in this State?
func Physics( _delta : float ) -> State:
	return null



## What happends with input events in this State?
func HandleInput( _event: InputEvent ) -> State:
	return null



func state_complete( _a : String ) -> void:
	player.animation_player.animation_finished.disconnect( state_complete )
	state_machine.change_state( carry )
	pass
