Class {
	#name : 'WATurboFrame',
	#superclass : 'WADecoration',
	#instVars : [
		'id',
		'loading',
		'source',
		'refresh'
	],
	#category : 'Seaside-HotwireTurbo-Core',
	#package : 'Seaside-HotwireTurbo-Core'
}

{ #category : 'instance creation' }
WATurboFrame class >> eager [

	^ self new 
]

{ #category : 'instance creation' }
WATurboFrame class >> new [
	^ self basicNew initializeWithId:  'id-', UUID new asString
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
WATurboFrame >> isEager [

	^ loading = 'eager'
]

{ #category : 'testing' }
WATurboFrame >> isLazy [

	^ loading = 'lazy'
]

{ #category : 'testing' }
WATurboFrame >> isRegular [

	^ loading isNil
]

{ #category : 'testing' }
WATurboFrame >> isTurboFrame [

	^ true
]

{ #category : 'attributes' }
WATurboFrame >> loadEager [

	loading := 'eager'
]

{ #category : 'attributes' }
WATurboFrame >> loadLazy [

	loading := 'lazy'
]

{ #category : 'attributes' }
WATurboFrame >> refreshUsingMorph [

	refresh := 'morph'
]

{ #category : 'rendering' }
WATurboFrame >> renderContentOn: html [

	| tag |
	tag := html tag: 'turbo-frame'.
	tag
		id: self id;
		dataAttributeAt: 'turbo-action' put: 'replace'.
	refresh ifNotNil:[ tag attributeAt: 'refresh' put: refresh ].
	(self isRegular or: [ self requestContext request isTurboFrameRequest ])
		ifTrue:[ tag with:[ self renderNextOn: html ] ]
		ifFalse:[
			tag attributeAt: 'src' put: html actionUrl.
			self isLazy
				ifTrue:[ tag attributeAt: 'loading' put: 'lazy' ].
			tag with: [ self next renderLazyTurboFrameContentsOn: html ] ]
]
