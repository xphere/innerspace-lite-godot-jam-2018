extends Timer

const MIN_DISTANCE = 64
const MAX_DISTANCE = 96
const MIN_SPEED = 3
const MAX_SPEED = 12
const FUZZY_ANGLE = 0.5

onready var enemy_scene = preload('res://scenes/Enemy/Enemy.tscn')

export(NodePath) var track_path

var track_node
var amount = 0


func _ready():
	assert(track_path)
	track_node = get_node(track_path)
	randomize()


func _on_timeout():
	create_enemy()


func create_enemy():
	var direction = Vector2(rand_range(-1, 1), rand_range(-1, 1)).normalized()
	var distance = rand_range(MIN_DISTANCE, MAX_DISTANCE)
	var speed = rand_range(MIN_SPEED, MAX_SPEED)
	var enemy = enemy_scene.instance()
	enemy.global_position = track_node.global_position - (direction * distance)
	enemy.direction = direction.rotated(rand_range(-FUZZY_ANGLE, FUZZY_ANGLE) * PI)
	enemy.track_node = track_node
	enemy.speed = speed
	enemy.temperature = -1 + 2 * (amount % 2)
	add_child(enemy)
	amount += 1
