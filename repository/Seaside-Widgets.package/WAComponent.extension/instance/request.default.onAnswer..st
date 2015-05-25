*seaside-widgets-dialogs
request: aRequestString default: aDefaultString onAnswer: aBlock
	"Display an input dialog with the question aRequestString and the default string aDefaultString. Passes the answer into aBlock."

	self request: aRequestString label: nil default: aDefaultString onAnswer: aBlock