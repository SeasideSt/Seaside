*seaside-flow-dialog
request: aRequestString
	"Display an input dialog with the question aRequestString. Answer the string the user enters."

	^ self wait: [ :cc | self request: aRequestString onAnswer: cc ]