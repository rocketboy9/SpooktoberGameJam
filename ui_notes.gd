extends CanvasLayer

@onready var NoteCountLabel: Label = $Notes/VBoxContainer/Label
@onready var LabelNoteNotification: Label = $Notes/CenterContainer/Label

func _ready():
	NoteCountLabel.text = "Remaining Notes: " + str(Globals.NoteAmount - Globals.NotesFoundCount)
	LabelNoteNotification.text = "Note Found"

func updateNoteCount():
	
	NoteCountLabel.text = "Remaining Notes: " + str(Globals.NoteAmount - Globals.NotesFoundCount)
	LabelNoteNotification.visible = true
	
	if Globals.NoteAmount == Globals.NotesFoundCount:
		LabelNoteNotification.text = "ESCAPE!"
		LabelNoteNotification.modulate = Color("ffffff", 1.0)
	else:
		var tween = create_tween()
		tween.tween_property(LabelNoteNotification, "modulate", Color("ffffff", 0.0), 2.0)
		LabelNoteNotification.modulate = Color("ffffff", 1.0)
	
