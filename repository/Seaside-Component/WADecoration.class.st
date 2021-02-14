"
I am an abstract decoration around instances of WAComponent. I can be added to aComponent by calling #addDecoration: and I change the basic behaviour or look of a component. There are several methods that can be overriden to archive this:

- #renderContentOn: to emit xhtml around the decorated component. Call #renderOwnerOn: to let the owner emit its output.

- #handleAnswer: to intercept the answer processing.
"
Class {
	#name : #WADecoration,
	#superclass : #WAPresenter,
	#instVars : [
		'next'
	],
	#category : 'Seaside-Component-Base'
}

{ #category : #testing }
WADecoration class >> canBeRoot [
	^ false
]

{ #category : #visiting }
WADecoration >> accept: aVisitor [
	aVisitor visitDecoration: self
]

{ #category : #decorations }
WADecoration >> decoratedComponent [
	"Answer the Component decorated by this Decoration."
	
	^ self next decoratedComponent
]

{ #category : #delegation }
WADecoration >> handleAnswer: anObject [
	(self next handleAnswer: anObject)
		ifFalse: [ self handleAnswer: anObject continueWith: [ ^ false ] ].
	^ true
]

{ #category : #processing }
WADecoration >> handleAnswer: anObject continueWith: aBlock [
	aBlock value
]

{ #category : #initialization }
WADecoration >> initialize [
	super initialize.
	next := WAValueHolder new
]

{ #category : #testing }
WADecoration >> isDecoration [
	^ true
]

{ #category : #testing }
WADecoration >> isDelegation [
	"If #isDelegation is true, we do not want our 'next' presenter to be displayed."
	^ false
]

{ #category : #testing }
WADecoration >> isGlobal [
	^ false
]

{ #category : #testing }
WADecoration >> isLocal [
	^ (self isGlobal or: [ self isDelegation ]) not
]

{ #category : #accessing }
WADecoration >> next [
	"Answer the next decoration or component."

	^ next contents
]

{ #category : #actions }
WADecoration >> remove [
	"Remove the decoration from the owning component."
	
	self decoratedComponent removeDecoration: self
]

{ #category : #rendering }
WADecoration >> renderContentOn: html [
	self renderNextOn: html
]

{ #category : #rendering }
WADecoration >> renderNextOn: html [
	self next renderUndecoratedWithContext: html context
]

{ #category : #initialization }
WADecoration >> setNext: aDecoration [
	next contents: aDecoration
]

{ #category : #updating }
WADecoration >> updateStates: aSnapshot [
	super updateStates: aSnapshot.
	aSnapshot register: next
]
