extends CanvasLayer

@onready var NoteCountLabel: Label = $Notes/VBoxContainer/Label
@onready var LabelNoteNotification: Label = $Notes/CenterContainer/Label

func _ready():
	NoteCountLabel.text = "Remaining Notes: " + str(Globals.NoteAmount - Globals.NotesFoundCount)
	
	LabelNoteNotification.visible = true
	LabelNoteNotification.text = "Find the Hidden Notes on Select Gravestones\nAvoid the Ghosts"
	var tween = create_tween()
	tween.tween_property(LabelNoteNotification, "modulate", Color("ffffff", 0.0), 4.0)
	LabelNoteNotification.modulate = Color("ffffff", 1.0)

func updateNoteCount():
	LabelNoteNotification.text = "Note Found"
	NoteCountLabel.text = "Remaining Notes: " + str(Globals.NoteAmount - Globals.NotesFoundCount)
	LabelNoteNotification.visible = true
	
	if Globals.NoteAmount == Globals.NotesFoundCount:
		LabelNoteNotification.text = "ESCAPE!\nEntrance Gate Has Opened"
		LabelNoteNotification.modulate = Color("ffffff", 1.0)
	else:
		var tween = create_tween()
		tween.tween_property(LabelNoteNotification, "modulate", Color("ffffff", 0.0), 2.0)
		LabelNoteNotification.modulate = Color("ffffff", 1.0)
	
