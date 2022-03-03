extends AudioStreamPlayer

var music = [
	preload("res://Assets/Musics/Gymnopdie_No._1__Satie.ogg"),
	preload("res://Assets/Musics/Canon_in_D.ogg"),
	preload("res://Assets/Musics/Fr_Elise.ogg")
	
]
var which_music = 0


func _ready():
	randomize()
	which_music = randi() % music.size()
	stream = music[which_music]
	playing = true


func _on_Music_finished():
	which_music = randi() % music.size()
	stream = music[which_music]
	playing = true
