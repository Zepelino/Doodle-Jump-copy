extends RigidBody2D

var pulo
var velocityX: int = 0
var pontosT
var pontos = 0

func _ready():
	set_max_contacts_reported(3)
	pontosT = $CanvasLayer/RichTextLabel

func _process(delta):
	if linear_velocity.y > 1500:
		get_tree().reload_current_scene()
	$Sprite.flip_h = velocityX < 0
	pontosT.bbcode_text = "[color=black]Pontos: [/color][wave amp=50 freq=3][rainbow freq=0.5 sat=1 val=1]%s[/rainbow][/wave]"%[pontos]

func _physics_process(delta):
	
	if pulo:
		pulo = false
		apply_central_impulse(Vector2(0,-700))
	
	velocityX =  clamp((get_global_mouse_position().x - global_position.x )*0.08,-10,10)
	
	position.x += velocityX


func _on_Player_body_entered(body):
	if body.is_in_group("Plataformas"):
		pulo = true
		if body.Pontuar:
			body.Pontuar = false
			pontos += 1
			pontosT.bbcode_text = "[color=black]Pontos: [/color][wave amp=50 freq=3]kkkk[/wave]"#+str(pontos)+""
