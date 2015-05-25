*seaside-flow-dialog
request: aRequestString default: aDefaultString
	"Display an input dialog with the question aRequestString and the default string aDefaultString. Answer the string the user enters."
	
	^ self wait: [ :cc | self request: aRequestString default: aDefaultString onAnswer: cc ]