extends Node2D
var nextY = 200
var rng = RandomNumberGenerator.new()
func _ready():
	rng.randomize()

func _process(delta):
	if $Player.position.y < nextY + 100:
		for i in range(0,30):
			var xx = rng.randi()%360
			var yy = nextY + -i*200
			var plataforma = preload("res://Cenas/Plataforma.tscn").instance()
			plataforma.position = Vector2(xx,yy)
			add_child(plataforma)
		nextY -= 200 * 30
