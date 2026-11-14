extends CollisionShape2D

@onready var win_label = get_tree().current_scene.get_node("CanvasLayer/WinLabel")

func _ready():
	get_parent().body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	if body is CharacterBody2D:
		win_label.visible = true
		get_tree().paused = true
