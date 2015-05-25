*seaside-widgets-dialogs
confirm: aString onAnswer: aBlock
	"Display a yes/no dialog with caption aString. Evaluate aBlock passing in true if the response is yes, false if no."

	self
		call: (WAYesOrNoDialog new
			addMessage: aString;
			yourself)
		onAnswer: aBlock