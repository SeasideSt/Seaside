Extension { #name : #WAComponent }

{ #category : #'*seaside-widgets-decorations' }
WAComponent >> addMessage: aString [
	"Add a decoration that displays a level 3 heading with aString around the receiver. Answer the decoration, so don't forget #yourself."
	
	^ self addDecoration: (WAMessageDecoration new message: aString; yourself)
]

{ #category : #'*seaside-widgets-dialogs' }
WAComponent >> chooseFrom: aCollection caption: aString onAnswer: aBlock [
	"Choose an item from the given aCollection with caption aString. Evaluate aBlock with the selected item."
	
	self chooseFrom: aCollection default: nil caption: aString onAnswer: aBlock
]

{ #category : #'*seaside-widgets-dialogs' }
WAComponent >> chooseFrom: aCollection default: anObject caption: aString onAnswer: aBlock [
	"Choose an item from the given aCollection, the default anObject and the caption aString. Evaluate aBlock with the selected item."
	
	self 
		call: (WAChoiceDialog new
			addMessage: aString;
			options: aCollection;
			selection: anObject;
			yourself)
		onAnswer: aBlock
]

{ #category : #'*seaside-widgets-dialogs' }
WAComponent >> chooseFrom: aCollection default: anObject onAnswer: aBlock [
	"Choose an item from the given aCollection and the default anObject. Evaluate aBlock with the selected item."
	
	self chooseFrom: aCollection default: anObject caption: nil onAnswer: aBlock
]

{ #category : #'*seaside-widgets-dialogs' }
WAComponent >> chooseFrom: aCollection onAnswer: aBlock [
	"Choose an item from the given aCollection. Evaluate aBlock with the selected item."

	self chooseFrom: aCollection default: nil caption: nil onAnswer: aBlock
]

{ #category : #'*seaside-widgets-dialogs' }
WAComponent >> confirm: aString onAnswer: aBlock [
	"Display a yes/no dialog with caption aString. Evaluate aBlock passing in true if the response is yes, false if no."

	self
		call: (WAYesOrNoDialog new
			addMessage: aString;
			yourself)
		onAnswer: aBlock
]

{ #category : #'*seaside-widgets-dialogs' }
WAComponent >> inform: aString	onAnswer: aBlock [	
	"Display a dialog with aString to the user until he clicks the ok button. Continue by evaluating aBlock."

	self 
		call: (WAFormDialog new
			addMessage: aString;
			yourself)
		onAnswer: aBlock
]

{ #category : #'*seaside-widgets-dialogs' }
WAComponent >> request: aRequestString default: aDefaultString onAnswer: aBlock [
	"Display an input dialog with the question aRequestString and the default string aDefaultString. Passes the answer into aBlock."

	self request: aRequestString label: nil default: aDefaultString onAnswer: aBlock
]

{ #category : #'*seaside-widgets-dialogs' }
WAComponent >> request: aRequestString label: aLabelString default: aDefaultString onAnswer: aBlock [
	"Display an input dialog with the question aRequestString, the button label aLabelString and the default string aDefaultString. Passes the answer into aBlock."
	
	self
		call: (WAInputDialog new
			addMessage: aRequestString;
			default: aDefaultString;
			label: aLabelString;
			yourself)
		onAnswer: aBlock
]

{ #category : #'*seaside-widgets-dialogs' }
WAComponent >> request: aRequestString label: aLabelString onAnswer: aBlock [
	"Display an input dialog with the question aRequestString and the button label aLabelString. Passes the answer into aBlock."

	self request: aRequestString label: aLabelString default: nil onAnswer: aBlock
]

{ #category : #'*seaside-widgets-dialogs' }
WAComponent >> request: aString onAnswer: aBlock [
	"Display an input dialog with the question aRequestString. Passes the answer into aBlock."

	self request: aString default: nil onAnswer: aBlock
]

{ #category : #'*seaside-widgets-decorations' }
WAComponent >> validateWith: aBlock [
	^ self addDecoration: (WAValidationDecoration new validateWith: aBlock)
]
