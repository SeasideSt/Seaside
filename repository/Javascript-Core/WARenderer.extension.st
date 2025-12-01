Extension { #name : 'WARenderer' }

{ #category : '*javascript-core' }
WARenderer >> javascript [
	^ (JSScript context: self context)
		rendererClass: self species;
		yourself
]

{ #category : '*javascript-core' }
WARenderer >> javascript: aString [

	^ JSStream on: aString
]

{ #category : '*javascript-core' }
WARenderer >> logger [
	^ (JSLogger context: self context)
		rendererClass: self species;
		yourself
]
