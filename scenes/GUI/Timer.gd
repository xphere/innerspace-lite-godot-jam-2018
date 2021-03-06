extends Label

var started
var total_time


func _ready():
	if started == null:
		started = OS.get_ticks_msec()


func _process(delta):
	var amount = elapsed_time()
	text = '%02d:%02d.%02d' % [
		int(amount / 60000),
		int(amount / 1000) % 60,
		(amount % 1000) / 10
	]


func elapsed_time():
	if total_time:
		return total_time

	return OS.get_ticks_msec() - started


func stop():
	total_time = elapsed_time()
	set_process(false)
