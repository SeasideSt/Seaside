*seaside-widgets-dialogs
chooseFrom: aCollection onAnswer: aBlock
	"Choose an item from the given aCollection. Evaluate aBlock with the selected item."

	self chooseFrom: aCollection default: nil caption: nil onAnswer: aBlock