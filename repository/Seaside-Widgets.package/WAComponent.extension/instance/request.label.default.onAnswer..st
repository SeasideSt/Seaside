*seaside-widgets-dialogs
request: aRequestString label: aLabelString default: aDefaultString onAnswer: aBlock
	"Display an input dialog with the question aRequestString, the button label aLabelString and the default string aDefaultString. Passes the answer into aBlock."
	
	self
		call: (WAInputDialog new
			addMessage: aRequestString;
			default: aDefaultString;
			label: aLabelString;
			yourself)
		onAnswer: aBlock