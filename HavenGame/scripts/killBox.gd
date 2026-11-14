extends CollisionShape2D

func _ready() -> void:
	var area = get_parent() as Area2D
	area.body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		body.queue_free()
