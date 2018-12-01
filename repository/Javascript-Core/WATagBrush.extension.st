Extension { #name : #WATagBrush }

{ #category : #'*javascript-core' }
WATagBrush >> passenger: anObject [
	"Assign a passenger object to the receiver. This is used to keep a mapping between DOM elements and Smalltalk objects. Note, that to we are required to assign a numeric id to the reciever in order to keep the mapping between DOM element and Smalltalk object."

	canvas callbacks registerPassenger: anObject named: self ensureId
]

{ #category : #'*javascript-core' }
WATagBrush >> script: anObject [
	"Attach a JavaScript object to the receiver. The argument automatically knows the ID of the DOM element it should operate on and will be evaluated when the page complete loading."

	(anObject isNil) 
		ifTrue: [ ^ self ].
	(anObject respondsTo: #id:)
		ifTrue: [ anObject id: self ensureId ].
	canvas document addLoadScript: anObject
]
