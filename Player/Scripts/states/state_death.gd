class_name State_Death extends State

@export var exhaust_audio : AudioStream
@onready var audio : AudioStreamPlayer2D = $"../../Audio/AudioStreamPlayer2D"



## What happends when we initialixe this state?
func init() -> void:
	pass


## What happends when the player enters this State?
func Enter() -> void:
	player.animation_player.play( "death" )
	audio.stream = exhaust_audio
	audio.play()
	PlayerHud.show_game_over_screen()
	AudioManager.play_music( null )
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
