Extension { #name : #WAComponent }

{ #category : #'*Seaside-Flow-filters' }
WAComponent >> authenticateWith: anAuthenticator during: aBlock [
	"Authenticate calls during the evaluation of aBlock."
	
	self 
		filterWith: (WAAuthenticationFilter new
			authenticator: anAuthenticator;
			yourself)
		during: aBlock
]

{ #category : #'*Seaside-Flow' }
WAComponent >> call: aComponent [ 
	"Pass control from the receiver to aComponent. The receiver will be temporarily replaced with aComponent. Code can return from here later on by sending #answer: to aComponent."

	^ self wait: [ :cc | self call: aComponent onAnswer: cc ]
]

{ #category : #'*Seaside-Flow-dialog' }
WAComponent >> chooseFrom: aCollection [
	"Choose an item from the given aCollection. Answer the selected item."

	^ self wait: [ :cc | self chooseFrom: aCollection onAnswer: cc ]
]

{ #category : #'*Seaside-Flow' }
WAComponent >> chooseFrom: aCollection caption: aString [
	"Choose an item from the given aCollection with caption aString. Answer the selected item."
	
	^ self wait: [ :cc | self chooseFrom: aCollection caption: aString onAnswer: cc ]
]

{ #category : #'*Seaside-Flow' }
WAComponent >> chooseFrom: aCollection default: anObject [
	"Choose an item from the given aCollection and the default anObject. Answer the selected item."

	^ self wait: [ :cc | self chooseFrom: aCollection default: anObject onAnswer: cc ]
]

{ #category : #'*Seaside-Flow' }
WAComponent >> chooseFrom: aCollection default: anObject caption: aString [
	"Choose an item from the given aCollection, the default anObject and the caption aString. Answer the selected item."
	
	^ self wait: [ :cc | self chooseFrom: aCollection default: anObject caption: aString onAnswer: cc ]
]

{ #category : #'*Seaside-Flow' }
WAComponent >> confirm: aString [
	"Display a yes/no dialog with caption aString. Answer true if the response is yes, false if no."

	^ self wait: [ :cc | self confirm: aString onAnswer: cc ]
]

{ #category : #'*Seaside-Flow' }
WAComponent >> filterWith: aFilter during: aBlock [
	| answer |
	self session addFilter: aFilter.
	answer := aBlock value.
	self session removeFilter: aFilter.
	^ answer
]

{ #category : #'*Seaside-Flow' }
WAComponent >> inform: aString [
	"Display a dialog with aString to the user until he clicks the ok button."

	^ self wait: [ :cc | self inform: aString onAnswer: cc ]
]

{ #category : #'*Seaside-Flow' }
WAComponent >> request: aRequestString [
	"Display an input dialog with the question aRequestString. Answer the string the user enters."

	^ self wait: [ :cc | self request: aRequestString onAnswer: cc ]
]

{ #category : #'*Seaside-Flow' }
WAComponent >> request: aRequestString default: aDefaultString [
	"Display an input dialog with the question aRequestString and the default string aDefaultString. Answer the string the user enters."
	
	^ self wait: [ :cc | self request: aRequestString default: aDefaultString onAnswer: cc ]
]

{ #category : #'*Seaside-Flow' }
WAComponent >> request: aRequestString label: aLabelString [
	"Display an input dialog with the question aRequestString and the button label aLabelString. Answer the string the user enters."
	
	^ self wait: [ :cc | self request: aRequestString label: aLabelString onAnswer: cc ]
]

{ #category : #'*Seaside-Flow' }
WAComponent >> request: aRequestString label: aLabelString default: aDefaultString [
	"Display an input dialog with the question aRequestString, the button label aLabelString and the default string aDefaultString. Answer the string the user enters."

	^ self wait: [ :cc | self request: aRequestString label: aLabelString default: aDefaultString onAnswer: cc ]
]

{ #category : #'*Seaside-Flow' }
WAComponent >> wait: aBlock [ 
	"Evaluate aBlock and pass in a continuation that can be evaluated to answer to the place where this very method was called."
	^ GRPlatform current seasideSuspendFlowDo: [ :cc | aBlock value: cc ]
]
