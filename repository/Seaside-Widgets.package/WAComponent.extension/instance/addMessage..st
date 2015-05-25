*seaside-widgets-decorations
addMessage: aString
	"Add a decoration that displays a level 3 heading with aString around the receiver. Answer the decoration, so don't forget #yourself."
	
	^ self addDecoration: (WAMessageDecoration new message: aString; yourself)