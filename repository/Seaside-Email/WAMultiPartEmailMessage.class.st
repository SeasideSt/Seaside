"
I am a  multi part email message.
"
Class {
	#name : #WAMultiPartEmailMessage,
	#superclass : #WAEmailMessage,
	#instVars : [
		'parts',
		'boundary'
	],
	#category : 'Seaside-Email-Base'
}

{ #category : #'as yet unclassified' }
WAMultiPartEmailMessage class >> newBoundary [
	^ String
		streamContents: [ :s | 
			s nextPutAll: 'SeasideEmail'.
			s nextPutAll: (10000 to: 999999) atRandom greaseString ]
]

{ #category : #public }
WAMultiPartEmailMessage >> addPart: aWAEmailBody [
	self parts add: aWAEmailBody
]

{ #category : #accessing }
WAMultiPartEmailMessage >> boundary [
	^ boundary
]

{ #category : #initialization }
WAMultiPartEmailMessage >> initialize [
	| mimeParameters |
	super initialize.
	boundary := self class newBoundary.
	mimeParameters := Dictionary new.
	mimeParameters at: 'boundary' put: boundary.
	self headerAt: 'Content-Type' put: (WAMimeType main: 'multipart' sub: 'alternative' parameters: mimeParameters)
]

{ #category : #testing }
WAMultiPartEmailMessage >> isMultipart [
	^ true
]

{ #category : #accessing }
WAMultiPartEmailMessage >> parts [
	^ parts ifNil: [ parts := Set new ]
]

{ #category : #accessing }
WAMultiPartEmailMessage >> setHtmlBody: aBlock [
	"block should be in the form of a [:h | h render: 'hello world']"

	self addPart: (WAHtmlEmailBody renderingBlock: aBlock)
]

{ #category : #accessing }
WAMultiPartEmailMessage >> setStringBody: aString wrap: aBoolean [
	self
		addPart:
			(aBoolean
				ifTrue: [ WAStringEmailBody string: aString lineLength: 80 ]
				ifFalse: [ WAStringEmailBody contentString: aString ])
]

{ #category : #writing }
WAMultiPartEmailMessage >> writeBodyOn: stream [
	self parts asArray sort
		do: [ :eachPart | 
			self writeMiddleBoundaryOn: stream.
			eachPart writeOn: stream ].
	self writeEndBoundaryOn: stream
]

{ #category : #writing }
WAMultiPartEmailMessage >> writeEndBoundaryOn: stream [
	stream
		nextPut: Character cr;
		nextPutAll: '--';
		nextPutAll: self boundary;
		nextPutAll: '--';
		nextPut: Character cr
]

{ #category : #writing }
WAMultiPartEmailMessage >> writeMiddleBoundaryOn: stream [
	stream
		nextPut: Character cr;
		nextPutAll: '--';
		nextPutAll: self boundary;
		nextPut: Character cr
]
