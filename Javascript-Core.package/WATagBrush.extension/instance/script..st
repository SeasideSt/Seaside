*javascript-core
script: anObject
	"Attach a JavaScript object to the receiver. The argument automatically knows the ID of the DOM element it should operate on and will be evaluated when the page complete loading."

	(anObject isNil) 
		ifTrue: [ ^ self ].
	(anObject respondsTo: #id:)
		ifTrue: [ anObject id: self ensureId ].
	canvas document addLoadScript: anObject