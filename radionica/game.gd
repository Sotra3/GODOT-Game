extends Node2D
var score=0
@onready var score_label: Label = $ScoreLabel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func add_score() ->void:
	score+=1
	score_label.text="Score: %d" %score
func reset_score() ->void:
	score=0
	score_label.text="Score: %d" %score
