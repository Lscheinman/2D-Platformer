extends Camera2D

var tartgetPosition = Vector2(0, 0)

export(Color, RGB) var backgroundColor
export(OpenSimplexNoise) var shakeNoise

var xNoiseSampleVector = Vector2.RIGHT
var yNoiseSampleVector = Vector2.DOWN
var xNoiseSamplePosition = Vector2.ZERO
var yNoiseSamplePosition = Vector2.ZERO
var NoiseSampleTravelRate = 25
var maxShakeOffset = 10
var currentShakepercentage = 0

func _ready():
	VisualServer.set_default_clear_color(backgroundColor)
	apply_shake(1)

func _process(delta):
	acquire_target_position()
	global_position = lerp(tartgetPosition, global_position, pow(2, -15 * delta))
	if (currentShakepercentage > 0):
		xNoiseSamplePosition += xNoiseSampleVector * NoiseSampleTravelRate * delta
		yNoiseSamplePosition += yNoiseSampleVector * NoiseSampleTravelRate * delta
		var xSample = shakeNoise.get_noise_2d(xNoiseSamplePosition.x, xNoiseSamplePosition.y)
		var ySample = shakeNoise.get_noise_2d(yNoiseSamplePosition.x, yNoiseSamplePosition.y)
		var calculatedOffset = Vector2(xSample, ySample) * maxShakeOffset * pow(currentShakepercentage, 2)
		offset = calculatedOffset
#
func apply_shake(percentage):
	currentShakepercentage = clamp(currentShakepercentage + percentage, 0, 1)

func acquire_target_position():
	var acquired = get_target_position_from_nodes_in_gruop("player")
	if (!acquired):
		get_target_position_from_nodes_in_gruop("PlayerDeath")

func get_target_position_from_nodes_in_gruop(GroupName):
	var nodes = get_tree().get_nodes_in_group(GroupName)
	if (nodes.size() > 0):
		var node = nodes[0]
		tartgetPosition = node.global_position
		return true
	return false
