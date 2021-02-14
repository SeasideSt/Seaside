Class {
	#name : #PTObject,
	#superclass : #JSObject,
	#category : 'Prototype-Core'
}

{ #category : #querying }
PTObject >> enumerator [
	"Answer an enumerator on the receiver."

	^ (PTEnumerable context: self renderContext receiver: self)
		rendererClass: self rendererClass;
		yourself
]

{ #category : #accessing }
PTObject >> factory [
	"Answer a factory object for Prototype objects."

	^ (PTFactory context: self renderContext)
		rendererClass: self rendererClass;
		yourself
]

{ #category : #querying }
PTObject >> toJson [
	"Return a JSON string."

	self call: 'toJSON'
]
