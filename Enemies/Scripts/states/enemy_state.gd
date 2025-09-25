class_name EnemyState extends Node


## Stores a reference to the enemy that this state belongs to
var enemy : Enemy
var state_machine : EnemyStateMachine


## What happends when we initialixe this state?
func init() -> void:
	pass


# What happends when the enemy enters this State?
func Enter() -> void:
	pass


## What happends when the enemy exits this State?
func Exit() -> void:
	pass


## Waht happends during the _process update in this State?
func Process( _delta : float ) -> EnemyState:
	return null


## What happends during the _physics_process update in this State?
func Physics( _delta : float ) -> EnemyState:
	return null
