*seaside-widgets-dialogs
request: aString onAnswer: aBlock
	"Display an input dialog with the question aRequestString. Passes the answer into aBlock."

	self request: aString default: nil onAnswer: aBlock