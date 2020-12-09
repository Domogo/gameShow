extends CanvasLayer

var participantNames = [
	"Glib Maglob",
	"X Æ A-12",
	"Ford Prefect",
	"Marvin",
	"Leeloo",
	"J'onn J'onzz",
	"Zaphod Beeblebrox",
	"Trillian"
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

Here's the thing, not all humans are the same, some are harder to catch than others. Oh and there's dogs. We like those very much, so try to leave them be!

Use LEFT and RIGHT ARROW KEYS to move and SPACE to shoot the spaceship down to pick up a human!
"""

var gameLostDialog = """D'awww shucks!! If I weren't getting paid to keep this smile on me at all times, I'd
be looking pretty sad right now. Looks like you wont be driving the Tesla home. Better luck next time!

Flixtrax' and Flixtraxes, looks like our contestant of the evening, #name, is going home empty tentacled.
I'm your host Xteve Har'x'vai and this was *CATCH THE HUMANS*. Stay tuned for our next episode, live every
Wednesday in every space sector, especially Eroticon Six!
"""

var gameWonDialog = """Dearest Flixtrax' and Flixtraxes, three-eyed, seven-eared or triple breasted, doesn't matter -
 *WE GOT OURSELVES A WINNER* and he's crawling up the stage right now! 

A big round of applause for #name, everyone! Come and get your reward - the Tesla car! How're you going to drive it, I wonder..
"""

onready var tween = $Tween


func _ready():
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


func choose_text_to_display():
	if activeText == MAIN_MENU:
		$RichTextLabel.text = mainMenuDialog.replace("#name", contestantName)
		$RichTextLabel.scroll_active = false
	if activeText == HOW_TO:
		$RichTextLabel.text = howToDialog
		$RichTextLabel.scroll_active = true


func toggle_active_text():
	if activeText == MAIN_MENU:
		activeText = HOW_TO
	else:
		activeText = MAIN_MENU


func appear():
	tween.interpolate_property(self, "offset:x", 800, 0,
					0.5, Tween.TRANS_BACK, Tween.EASE_IN_OUT)
	tween.start()


func disappear():
	tween.interpolate_property(self, "offset:x", 0, 800,
					0.4, Tween.TRANS_BACK, Tween.EASE_IN_OUT)
	tween.start()
