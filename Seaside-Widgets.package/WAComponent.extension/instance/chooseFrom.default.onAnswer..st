*seaside-widgets-dialogs
chooseFrom: aCollection default: anObject onAnswer: aBlock
	"Choose an item from the given aCollection and the default anObject. Evaluate aBlock with the selected item."
	
	self chooseFrom: aCollection default: anObject caption: nil onAnswer: aBlock