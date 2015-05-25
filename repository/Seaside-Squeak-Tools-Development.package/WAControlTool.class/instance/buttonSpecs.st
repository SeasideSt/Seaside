building
buttonSpecs
	"Answer a tuple for the buttons, in the format:
	button label 	selector to send				enabled selector/boolean	help message"
	^ (Pragma allNamed: #button:enabled:help: in: self class)
		collect: [:pragma | 
			{ pragma arguments first . pragma selector }, pragma arguments allButFirst]
