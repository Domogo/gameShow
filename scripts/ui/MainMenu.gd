extends CanvasLayer

var participantNames = [
	"Glib Maglob",
	"X Æ A-12",
	"Ford Prefect",
	"Marvin",
	"Leeloo",
	"J'onn J'onzz"
]
const MAIN_MENU = "mainMenu"
const HOW_TO = "howTo"

var activeText = MAIN_MENU
var contestantName = participantNames[0]

var mainMenuDialog = """Good evening Flixtrax' and Flixtraxes! I'm your host Xteve Har'x'vai and this is *CATCH THE HUMANS!*
Today with us is #name.
Can he catch enough humans in the next 2 minutes to win the precious Tesla Car we seized from the Earthians?

LET'S FIND OUT!!
"""

var howToDialog = """For all our viewers out there that are unfamiliar with the rules, here goes!
Our contestant has to catch as many humans as possible in the next two minutes. If he or she catches enough of those bipeds, they'll win
a brand new, preserved in the vacuum of space, Tesla car!

Here's the thing, not all humans are the same, some are harder to catch than others. Oh and there's dogs. We like those very much, so try to
leave them be!
"""

onready var tween = $Tween

func _ready():
	register_buttons()
	contestantName = get_random_contestant()
	choose_text_to_display()
	set_text_margins()


func set_text_margins():
	$RichTextLabel.margin_left = 40;
	$RichTextLabel.margin_top = 70;
	$RichTextLabel.margin_right = 350;
	$RichTextLabel.margin_bottom = 470;


func get_random_contestant():
	randomize()
	return participantNames[randi() % participantNames.size()]


func appear():
	tween.interpolate_property(self, "offset:x", 800, 0,
					0.5, Tween.TRANS_BACK, Tween.EASE_IN_OUT)
	tween.start()


func disappear():
	tween.interpolate_property(self, "offset:x", 0, 800,
					0.4, Tween.TRANS_BACK, Tween.EASE_IN_OUT)
	tween.start()


func choose_text_to_display():
	if activeText == MAIN_MENU:
		$RichTextLabel.text = mainMenuDialog.replace("#name", contestantName)
		$RichTextLabel.scroll_active = false
	if activeText == HOW_TO:
		$RichTextLabel.text = howToDialog
		$RichTextLabel.scroll_active = true


func register_buttons():
	var buttons = get_tree().get_nodes_in_group("buttons")
	for button in buttons:
		button.connect("pressed", self, "_on_button_pressed", [button.name])

func _on_button_pressed(name):
	match name:
		"PlayButton":
			activeText = MAIN_MENU
		"HowToButton":
			activeText = HOW_TO
	choose_text_to_display()	
