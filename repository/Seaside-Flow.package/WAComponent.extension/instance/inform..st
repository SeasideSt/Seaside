*Seaside-Flow
inform: aString
	"Display a dialog with aString to the user until he clicks the ok button."

	^ self wait: [ :cc | self inform: aString onAnswer: cc ]