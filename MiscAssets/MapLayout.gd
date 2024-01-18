extends TileMap


# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(2,22):
		set_layer_enabled(i, false)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
