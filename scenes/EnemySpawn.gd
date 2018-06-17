extends Timer

onready var enemy_scene = preload('res://scenes/Enemy.tscn')

export(NodePath) var track_path

var track_node
var mode


func _ready():
	assert(track_path)
	track_node = get_node(track_path)


func _on_timeout():
	create_enemy()


func create_enemy():
	var direction = Vector2(rand_range(-1, 1), rand_range(-1, 1)).normalized()
	var distance = rand_range(64, 96)
	var speed = rand_range(3, 12)
	var enemy = enemy_scene.instance()
	enemy.global_position = track_node.global_position - (direction * distance)
	enemy.initial_direction = direction.rotated(rand_range(-0.5, 0.5) * PI)
	enemy.track_node = track_node
	enemy.speed = speed
	add_child(enemy)
