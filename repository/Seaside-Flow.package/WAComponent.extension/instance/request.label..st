*seaside-flow-dialog
request: aRequestString label: aLabelString
	"Display an input dialog with the question aRequestString and the button label aLabelString. Answer the string the user enters."
	
	^ self wait: [ :cc | self request: aRequestString label: aLabelString onAnswer: cc ]