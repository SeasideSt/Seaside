*seaside-widgets-dialogs
chooseFrom: aCollection default: anObject caption: aString onAnswer: aBlock
	"Choose an item from the given aCollection, the default anObject and the caption aString. Evaluate aBlock with the selected item."
	
	self 
		call: (WAChoiceDialog new
			addMessage: aString;
			options: aCollection;
			selection: anObject;
			yourself)
		onAnswer: aBlock