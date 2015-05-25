*seaside-widgets-dialogs
inform: aString	onAnswer: aBlock	
	"Display a dialog with aString to the user until he clicks the ok button. Continue by evaluating aBlock."

	self 
		call: (WAFormDialog new
			addMessage: aString;
			yourself)
		onAnswer: aBlock