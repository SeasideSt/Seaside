*seaside-flow-dialog
confirm: aString
	"Display a yes/no dialog with caption aString. Answer true if the response is yes, false if no."

	^ self wait: [ :cc | self confirm: aString onAnswer: cc ]