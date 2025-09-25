class_name QuestItem extends Button

var quest : Quest

@onready var title_label: Label = $TitleLabel
@onready var step_label: Label = $StepLabel


func initialize( q : Quest ) -> void:
	quest = q
	title_label.text = q.title
	pass
