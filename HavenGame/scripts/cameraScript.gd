extends Camera2D

var camera:Camera2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	camera = get_parent() as Camera2D

var targetZoom:float = 2

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("zoom_in"):
		targetZoom += 1;
	if Input.is_action_just_pressed("zoom_out"):
		targetZoom -= 1;
	targetZoom = clampf(targetZoom, 0.5, 5)
	zoom = zoom.lerp(Vector2(targetZoom, targetZoom), 10 * delta)
