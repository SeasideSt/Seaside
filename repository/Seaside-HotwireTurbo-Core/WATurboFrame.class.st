Class {
	#name : 'WATurboFrame',
	#superclass : 'WADecoration',
	#instVars : [
		'id'
	],
	#category : 'Seaside-HotwireTurbo-Core',
	#package : 'Seaside-HotwireTurbo-Core'
}

{ #category : 'instance creation' }
WATurboFrame class >> new [
	^ self basicNew initializeWithId:  'id-', UUIDGenerator default next asString
]

{ #category : 'instance creation' }
WATurboFrame class >> newWithId: aString [
	^ self basicNew initializeWithId: aString
]

{ #category : 'accessing' }
WATurboFrame >> id [ 

	^ id
]

{ #category : 'initialization' }
WATurboFrame >> initializeWithId: aString [

	self initialize.
	id := aString
]

{ #category : 'testing' }
WATurboFrame >> isTurboFrame [

	^ true
]

{ #category : 'rendering' }
WATurboFrame >> renderContentOn: html [

	(html tag: 'turbo-frame')
		id: self id;
		dataAttributeAt: 'turbo-action' put: 'replace';
		with:[ self renderNextOn: html ]
]
