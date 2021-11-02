extends Spatial

onready var _knight_anim : AnimationPlayer = $"Knight/KayKit Animated Character_v11/AnimationPlayer"

func _ready():
	# Doing this programmatically rather than fiddling with the animation looping.
	# A real game would probably loop the animation.
	var _ignored := _knight_anim.connect("animation_finished", self, "_on_Knight_animation_finished")
	_knight_anim.play("KayKit Animated Character|Cheer")


func _on_Knight_animation_finished(_anim):
	_knight_anim.play("KayKit Animated Character|Cheer")
	
