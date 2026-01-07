Class {
	#name : 'JQPlugin',
	#superclass : 'JSObject',
	#instVars : [
		'owner',
		'options'
	],
	#category : 'JQuery-Core-Objects',
	#package : 'JQuery-Core',
	#tag : 'Objects'
}

{ #category : 'instance creation' }
JQPlugin class >> context: aRenderContext owner: aQuery [
	^ (self context: aRenderContext)
		setOwner: aQuery;
		yourself
]

{ #category : 'accessing' }
JQPlugin >> arguments [
	^ Array streamContents: [ :stream |
		self argumentsDo: [ :each |
			stream nextPut: each ] ]
]

{ #category : 'accessing' }
JQPlugin >> argumentsDo: aBlock [
	options isNil ifFalse: [ 
		aBlock value: options ]
]

{ #category : 'private' }
JQPlugin >> id: aString [
	self owner id: aString
]

{ #category : 'private' }
JQPlugin >> jQuery [
	^ (JQueryClass context: self renderContext)
		rendererClass: self rendererClass;
		yourself
]

{ #category : 'printing' }
JQPlugin >> javascriptContentOn: aRenderer [

	aRenderer render: self owner.
	aRenderer document dotProperty: self method.
	aRenderer arguments: [
		self argumentsDo: [ :each |
			 aRenderer argument: each ] ]
]

{ #category : 'accessing' }
JQPlugin >> method [
	self subclassResponsibility
]

{ #category : 'options' }
JQPlugin >> optionAt: aKey put: aValue [
	^ self options at: aKey put: aValue
]

{ #category : 'options' }
JQPlugin >> options [
	^ options ifNil: [ options := GRSmallDictionary2 new ]
]

{ #category : 'accessing' }
JQPlugin >> owner [
	^ owner
]

{ #category : 'initialization' }
JQPlugin >> setOwner: aQuery [
	owner := aQuery
]
