*seaside-flow-dialog
chooseFrom: aCollection default: anObject caption: aString
	"Choose an item from the given aCollection, the default anObject and the caption aString. Answer the selected item."
	
	^ self wait: [ :cc | self chooseFrom: aCollection default: anObject caption: aString onAnswer: cc ]