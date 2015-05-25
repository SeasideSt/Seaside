*seaside-widgets-dialogs
request: aRequestString label: aLabelString onAnswer: aBlock
	"Display an input dialog with the question aRequestString and the button label aLabelString. Passes the answer into aBlock."

	self request: aRequestString label: aLabelString default: nil onAnswer: aBlock