*seaside-widgets-dialogs
chooseFrom: aCollection caption: aString onAnswer: aBlock
	"Choose an item from the given aCollection with caption aString. Evaluate aBlock with the selected item."
	
	self chooseFrom: aCollection default: nil caption: aString onAnswer: aBlock