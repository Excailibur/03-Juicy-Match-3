extends Node2D
var score = 30
var b = 0
var background = [
	preload("res://Assets/Background2.jpg"),
	preload("res://Assets/Background3.jpg"),
	preload("res://Assets/Background1.jpg")
]

var tran = false
var t_value = 0.0
var t_step = 0.01

func _physics_process(_delta):
	if tran:
		t_value += t_step
		$Background.get_material().set_shader_param("burn_position",t_value)
		if t_value >= 1:
			$Background.texture = background[wrapi(b,0,background.size())]
			$Background.get_material().set_shader_param("burn_position",0.0)
			$B2.queue_free()
			b += 1
			t_value = 0.0
			tran = false
	elif Global.score > score*(b+1):
		var B2 = Sprite.new()
		B2.centered = false
		B2.texture = background[wrapi(b, 0, background.size())]
		B2.scale.x = 0.602
		B2.scale.y = 0.681
		B2.name = "B2"
		add_child(B2)
		move_child(B2, 0)
		tran = true
