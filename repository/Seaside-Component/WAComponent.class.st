"
I am a Presenter with the additional abilities of wrapping myself with Decorations and displaying another Component with #call:.
		
Call/Answer:
If a sub-Component makes a #call: to another Component, that Component will appear in place of the sub-Component.  For example, if an embedded WACounter, stored in an instance variable called myCounter, made a #call: to DateSelector, that DateSelector would appear in the context of the counter's parent, with the 'My Counter' heading above it.

Since an embedded subcomponent has not been #call:'d, in general #answer: is a no-op.  However, the parent may attach an #onAnswer: block to the embedded subcomponent to be notified if it sends #answer:. This allows one component to be used both from #call: and through embedding. For example:

	initialize
		dateSelector := WADateSelector new 
			onAnswer: [ :date | self dateChosen: date ].
			
Visibility:
A component is visible if it:
- meets the visibility requirements of a Presenter; or
- is passed as an argument to #call: on a visible component
"
Class {
	#name : #WAComponent,
	#superclass : #WAPresenter,
	#instVars : [
		'decoration'
	],
	#category : 'Seaside-Component-Base'
}

{ #category : #testing }
WAComponent class >> canBeRoot [
	"When returning true, the component can be registered as a standalone application from the configuration interface."

	^ false
]

{ #category : #accessing }
WAComponent class >> description [
	^ self name
]

{ #category : #visiting }
WAComponent >> accept: aVisitor [
	aVisitor visitComponent: self
]

{ #category : #visiting }
WAComponent >> acceptDecorated: aVisitor [
	aVisitor visitDecorationsOfComponent: self
]

{ #category : #convenience }
WAComponent >> activeComponent [
	"Answer the visible component, this might be a different component being delegated to or the receiver itself."
	
	self visiblePresentersDo: [ :each | each isDecoration ifFalse: [ ^ each ] ]
]

{ #category : #decorations }
WAComponent >> addDecoration: aDecoration [
	"Add aDecoration to the receivers decoration chain. Answer the added decoration."
	
	| previous current |
	previous := nil.
	current := self decoration.
	[ current ~~ self and: [ self decoration: current shouldWrap: aDecoration ] ] whileTrue: [
		previous := current.
		current := current next ].
	aDecoration setNext: current.
	previous isNil
		ifTrue: [ self decoration: aDecoration ]
		ifFalse: [ previous setNext: aDecoration ].
	^ aDecoration
]

{ #category : #delegation }
WAComponent >> answer [
	self answer: self
]

{ #category : #delegation }
WAComponent >> answer: anObject [
	"Give back control back to the component from which the receiver was called.
	When returning, a component can additionally return anObject to the caller."

	self decoration handleAnswer: anObject
]

{ #category : #delegation }
WAComponent >> call: aComponent onAnswer: aBlock [
	"Pass control from the receiver to aComponent. The receiver will be temporarily replaced with aComponent. When #answer: is sent to aComponent, aBlock is evaluated. This can be used for continuation passing style programmation of a control flow. #call:onAnswer: does not block but
a WARenderNotification is immediately signaled, aborting the current callback or task processing."

	self == aComponent ifTrue: [ 
		WAError signal: 'You can not call self. You''re probably missing a return somewhere' ].
	self
		show: aComponent
		onAnswer: aBlock.
	WARenderNotification signal
]

{ #category : #decorations }
WAComponent >> decorateWith: aDecoration during: aBlock [
	"Decorate the receiver with aDecoration during the execution of aBlock."

	| result |
	self addDecoration: aDecoration.
	result := aBlock value.
	self removeDecoration: aDecoration.
	^ result
]

{ #category : #decorations }
WAComponent >> decoratedComponent [
	"For polymorphism with WADecoration"

	^ self
]

{ #category : #accessing }
WAComponent >> decoration [
	^ decoration contents
]

{ #category : #accessing }
WAComponent >> decoration: aDecoration [
	decoration contents: aDecoration
]

{ #category : #decorations }
WAComponent >> decoration: oldDecoration shouldWrap: newDecoration [
	^ (oldDecoration isGlobal and: [ newDecoration isGlobal not ])
		or: [ oldDecoration isDelegation and: [ newDecoration isLocal ] ]
]

{ #category : #accessing }
WAComponent >> decorations [
	"Answer an ordered collection of all decorations active in the receiver."
	
	| current result |
	current := self decoration.
	result := OrderedCollection new.
	[ current = self ] whileFalse: [
		result add: current.
		current := current next ].
	^ result
]

{ #category : #accessing }
WAComponent >> delegations [
	"Answer an ordered collection of all delegations active in the receiver."
	
	^ self decorations select: [ :each | each isDelegation ]
]

{ #category : #accessing }
WAComponent >> home [
	"Remove all delegations from the receiver, making sure that it is displayed again."
	
	self delegations do: [ :each | self removeDecoration: each ]
]

{ #category : #initialization }
WAComponent >> initialize [
	super initialize.	
	decoration := WAValueHolder with: self
]

{ #category : #delegation }
WAComponent >> onAnswer: aBlock [
	"Adds an answer handler aBlock to the receiver."

	^ self addDecoration: (WAAnswerHandler new block: aBlock)
]

{ #category : #decorations }
WAComponent >> removeDecoration: aDecoration [ 
	"Remove aDecoration from the chain of decorations. Answer nil if aDecoration is not present."

	| previous current |
	previous := nil.
	current := self decoration.
	[ current = self ] whileFalse: [
		current = aDecoration ifTrue: [
			previous isNil
				ifTrue: [ self decoration: current next ]
				ifFalse: [ previous setNext: current next ].
			^ aDecoration setNext: nil ].
		previous := current.
		current := current next ].
	^ nil
]

{ #category : #delegation }
WAComponent >> removeDelegation [
	"Goes one decoration back (like home but not as much)."

	self delegations notEmpty ifTrue: [
		self removeDecoration: self delegations first ]
]

{ #category : #delegation }
WAComponent >> show: aComponent [
	"Pass control from the receiver to aComponent. The receiver will be temporarily replaced with aComponent. As opposed to #call: sending this message does not block and immediately returns."

	self
		show: aComponent
		onAnswer: [ :value | ]
]

{ #category : #delegation }
WAComponent >> show: aComponent onAnswer: aBlock [
	"Pass control from the receiver to aComponent. The receiver will be temporarily replaced with aComponent. When #answer: is sent to aComponent, aBlock is evaluated. This can be used for continuation passing style programmation of a control flow. #show:onAnswer: does not block."

	self
		show: aComponent
		onAnswer: aBlock
		delegation: (WADelegation new
			delegate: aComponent;
			yourself)
]

{ #category : #delegation }
WAComponent >> show: aComponent onAnswer: aBlock delegation: aDelegation [
	| event |
	event := nil.
	event := aComponent onAnswer: [ :value |
		aDelegation remove.
		event remove.
		aBlock valueWithPossibleArguments: (Array with: value) ].
	self addDecoration: aDelegation
]

{ #category : #updating }
WAComponent >> updateStates: aSnapshot [
	super updateStates: aSnapshot.
	decoration isNil
		ifFalse: [ aSnapshot register: decoration ]
]
