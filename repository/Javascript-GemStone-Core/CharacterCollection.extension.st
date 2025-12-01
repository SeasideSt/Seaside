Extension { #name : 'CharacterCollection' }

{ #category : '*javascript-gemstone-core' }
CharacterCollection >> asFunction: aCollection [
	^ (JSStream on: self) asFunction: aCollection
]

{ #category : '*javascript-gemstone-core' }
CharacterCollection >> javascriptOn: aRenderer [

	aRenderer string: self
]
