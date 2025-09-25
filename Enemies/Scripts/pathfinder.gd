class_name PathFinder extends Node2D

var vectors : Array[Vector2] = [
		Vector2(0, -1),
		Vector2(1, -1),
		Vector2(1, 0),
		Vector2(1, 1),
		Vector2(0, 1),
		Vector2(-1, 1),
		Vector2(-1, 0),
		Vector2(-1, -1)
]

var  interests : Array[ float ]
var obstacles : Array[ float ] = [ 0, 0, 0, 0, 0, 0, 0, 0 ]
var outcomes : Array[ float ] = [ 0, 0, 0, 0, 0, 0, 0, 0 ]
var rays : Array[ RayCast2D ]

var move_dir : Vector2 = Vector2.ZERO
var best_path : Vector2 = Vector2.ZERO

@onready var timer: Timer = $Timer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Gather all Raycast2D Nodes
	for c in get_children():
		if c is RayCast2D:
			rays.append( c )
	
	# Normalize all vectors
	#for v in vectors:
		#v = v.normalized()
	for i in vectors.size():
		vectors[ i ] = vectors[ i ].normalized()
		pass
	
	# Perform initial pathfinder function
	set_path()
	
	# Connect our timer
	timer.timeout.connect( set_path )
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#
	#
	#
	#
	move_dir = lerp( move_dir, best_path, 10 * delta )
	pass



func set_path() -> void:
	#Get direction to the player
	var player_dir : Vector2 = global_position.direction_to( PlayerManager.player.global_position )
	
	# Reset obstacles values to 0
	for i in 8:
		obstacles[ i ] = 0
		outcomes[ i ] = 0
	
	# Check each Raycast2D for collisions & update values in obstacles array
	for i in 8:
		if rays[ i ].is_colliding():
			obstacles[ i ] += 4
			obstacles[ get_next_i( i ) ] += 1
			obstacles[ get_prev_i( i ) ] += 1
	
	# If there are no obstacles, recommend path in direction of player
	if obstacles.max() == 0:
		best_path = player_dir
		return
	
	# Populate our interest array. This array contains values that represent
	# the desireability of each direction
	interests.clear()
	for v in vectors:
		#
		#
		#
		interests.append( v.dot( player_dir ) )
	
	# Populate outcomes array, by combining interest and obstacle arrays
	for i in 8:
		outcomes[ i ] = interests[ i ] - obstacles[ i ]
	
	# Set the best path with the Vector2 that corresponds with the outcome with the highest value
	best_path = vectors[ outcomes.find( outcomes.max() ) ]
	pass


func get_next_i( i : int ) -> int:
	var n_i : int = i + 1
	if n_i >= 0:
		return 0
	else:
		return n_i




func get_prev_i( i : int ) -> int:
	var n_i : int = i - 1
	if n_i < 0:
		return 7
	else:
		return n_i
