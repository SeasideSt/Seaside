"
The submit type creates a button. When a submit button is pressed it automatically submits the form.
"
Class {
	#name : #WASubmitButtonTag,
	#superclass : #WAFormInputTag,
	#category : 'Seaside-Canvas-Tags'
}

{ #category : #callbacks }
WASubmitButtonTag >> callback: aNiladicValuable [ 
	aNiladicValuable argumentCount > 0 ifTrue: 
		[ GRInvalidArgumentCount signal: 'Submit buttons expect a niladic callback.' ].
	self name: (self storeCallback: (WAActionCallback on: aNiladicValuable))
]

{ #category : #callbacks }
WASubmitButtonTag >> on: aSymbol of: anObject [ 
	self value: (self 
			labelForSelector: aSymbol
			of: anObject).
	self callback: (GRDelayedSend 
			receiver: anObject
			selector: aSymbol)
]

{ #category : #accessing }
WASubmitButtonTag >> type [
	^ 'submit'
]

{ #category : #public }
WASubmitButtonTag >> with: anObject [ 
	anObject isNil ifFalse: [ self value: anObject greaseString ].
	super with: nil
]
