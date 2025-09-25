class_name State extends Node

## Stores a reference to the player that this State belongs to
static var player: Player
static var state_machine: PlayerStateMachine

func _ready():
	pass # Replace with function body.


## What happends when we initialixe this state?
func init() -> void:
	pass


## What happends when the player enters this State?
func Enter() -> void:
	pass


## What happends when the player exits this State?
func Exit() -> void:
	pass


## Waht happends during the _process update in this State?
func Process( _delta : float ) -> State:
	return null


## What happends during the _physics_process update in this State?
func Physics( _delta : float ) -> State:
	return null


## What happends with input events in this State?
func HandleInput( _event: InputEvent ) -> State:
	return null
