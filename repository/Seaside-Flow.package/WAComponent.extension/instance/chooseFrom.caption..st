*seaside-flow-dialog
chooseFrom: aCollection caption: aString
	"Choose an item from the given aCollection with caption aString. Answer the selected item."
	
	^ self wait: [ :cc | self chooseFrom: aCollection caption: aString onAnswer: cc ]