*seaside-flow-dialog
request: aRequestString label: aLabelString default: aDefaultString
	"Display an input dialog with the question aRequestString, the button label aLabelString and the default string aDefaultString. Answer the string the user enters."

	^ self wait: [ :cc | self request: aRequestString label: aLabelString default: aDefaultString onAnswer: cc ]