Class {
	#name : #WAMapCallback,
	#superclass : #WAValueCallback,
	#category : 'Seaside-Core-Callbacks'
}

{ #category : #converting }
WAMapCallback >> valueForField: anObject [ 
	| stream x y |
	stream := (super valueForField: anObject) readStream.
	(stream atEnd not and: [ stream next = $? ]) ifFalse: [ ^ nil ].
	x := (stream upTo: $,) greaseInteger.
	(x isNil or: [ stream atEnd ]) ifTrue: [ ^ nil ].
	y := stream upToEnd greaseInteger.
	y isNil ifTrue: [ ^ nil ].
	^ x @ y
]
