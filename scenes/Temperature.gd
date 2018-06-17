extends Node2D

signal changed(temperature)
signal alarm(name, cold)
signal end_alarm()

enum State {
	NORMAL,
	HYPOTHERMIA,
	FEVER,
	HYPERPYREXIA,
}

const StateName = {
	State.NORMAL: 'normal',
	State.HYPOTHERMIA: 'hypothermia',
	State.FEVER: 'fever',
	State.HYPERPYREXIA: 'hyperpyrexia',
}

const StateLimit = {
	State.HYPOTHERMIA: 35,
	State.NORMAL: 36.5,
	State.FEVER: 38.3,
	State.HYPERPYREXIA: 40.0,
}

const MIN = 34.0
const MAX = 42.0

var temperature = StateLimit[State.NORMAL] setget set_temperature


func _ready():
	call_deferred('emit_signal', 'changed', temperature)


func hit(value):
	set_temperature(temperature + value)


func set_temperature(value):
	value = clamp(value, MIN, MAX)
	if value == temperature:
		return

	var current_state = temperature_to_state(temperature)
	var next_state = temperature_to_state(value)

	temperature = value
	emit_signal("changed", temperature)

	if current_state == next_state:
		return

	if next_state == State.NORMAL:
		emit_signal('end_alarm')
	else:
		emit_signal('alarm', StateName[next_state], temperature < StateLimit[State.NORMAL])


func temperature_to_state(value):
	if value < StateLimit[State.HYPOTHERMIA]:
		return State.HYPOTHERMIA

	if value < StateLimit[State.FEVER]:
		return State.NORMAL

	if value >= StateLimit[State.FEVER]:
		return State.FEVER

	if value >= StateLimit[State.HYPERPYREXIA]:
		return State.HYPERPYREXIA


func bind_to(thermometer):
	thermometer.set_min_value(MIN)
	thermometer.set_max_value(MAX)
	connect("changed", thermometer, "set_current_value")
