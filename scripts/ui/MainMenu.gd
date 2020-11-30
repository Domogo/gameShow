extends CanvasLayer

var participantNames = [
	"Glib Maglob",
	"X Æ A-12",
	"Ford Prefect",
	"Marvin",
	"Leeloo",
	"J'onn J'onzz"
]

var mainMenuDialog = """Good evening Flixtrax' and Flixtraxes! I'm your host Xteve Har'x'vai and this is *CATCH THE HUMANS!*
Today with us is #name.
Can he catch enough humans in the next 2 minutes to win the precious Tesla Car we seized from the Earthians?

LET'S FIND OUT
"""

onready var tween = $Tween

func _ready():
	set_text_margins()


func set_text_margins():
	$RichTextLabel.text = mainMenuDialog.replace("#name", participantNames[get_random_number()])
	$RichTextLabel.margin_left = 40;
	$RichTextLabel.margin_top = 70;
	$RichTextLabel.margin_right = 350;
	$RichTextLabel.margin_bottom = 490;


func get_random_number():
	randomize()
	return randi() % participantNames.size()

func appear():
	tween.interpolate_property(self, "offset:x", 800, 0,
					0.5, Tween.TRANS_BACK, Tween.EASE_IN_OUT)
	tween.start()

func disappear():
	tween.interpolate_property(self, "offset:x", 0, 800,
					0.4, Tween.TRANS_BACK, Tween.EASE_IN_OUT)
	tween.start()
