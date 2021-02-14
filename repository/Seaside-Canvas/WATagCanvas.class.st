"
I am the abstract superclass for tag based canvases.
"
Class {
	#name : #WATagCanvas,
	#superclass : #WACanvas,
	#category : 'Seaside-Canvas-Canvas'
}

{ #category : #private }
WATagCanvas >> break [
	self subclassResponsibility 
]

{ #category : #convenience }
WATagCanvas >> space [
	self flush.
	self document nextPutAll: self spaceEntity
]

{ #category : #convenience }
WATagCanvas >> space: anInteger [
	anInteger timesRepeat: [ self space ]
]

{ #category : #private }
WATagCanvas >> spaceEntity [
	self subclassResponsibility 
]

{ #category : #public }
WATagCanvas >> tag: aString [
	"Defines a generic tag with the name aString."

	^ self brush: (WAGenericTag tag: aString)
]

{ #category : #public }
WATagCanvas >> tag: aString with: aBlock [
	(self tag: aString) with: aBlock
]

{ #category : #convenience }
WATagCanvas >> withLineBreaks: aString [
	"Renders text preserving line breaks."
	| stream |
	stream := aString readStream.
	[ stream atEnd ] whileFalse: [
		self text: stream nextLine.
		stream atEnd ifFalse: [ self break ] ]
]
