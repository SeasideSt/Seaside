"
I am a plain text email body.
"
Class {
	#name : #WAStringEmailBody,
	#superclass : #WAEmailBody,
	#category : 'Seaside-Email-Base'
}

{ #category : #'instance creation' }
WAStringEmailBody class >> contentString: aString [
	^ self new
		contentString: (self convertCrLfToCrIn: aString);
		yourself
]

{ #category : #private }
WAStringEmailBody class >> convertCrLfToCrIn: aString [
	^ aString
		copyReplaceAll: (String with: Character cr with: Character lf)
		with: (String with: Character cr)
]

{ #category : #private }
WAStringEmailBody class >> splitIntoLines: aString [
	^ Array streamContents: [ :stream |
		| cr start |
		cr := Character cr.
		start := 1.
		1 to: aString size do: [ :index |
			(aString at: index) = cr ifTrue: [
				stream nextPut: (aString copyFrom: start to: index - 1).
				start := index + 1 ] ].
			start <= (aString size + 1) ifTrue: [ 
				stream nextPut: (aString copyFrom: start to: aString size) ] ]
]

{ #category : #private }
WAStringEmailBody class >> splitString: aString intoChunksNoLongerThan: anInteger [
	^ Array streamContents: [ :stream |
		self
			splitString: aString
			intoChunksNoLongerThan: anInteger
			into: stream ]
]

{ #category : #private }
WAStringEmailBody class >> splitString: aString intoChunksNoLongerThan: anInteger into: aStream [
	| space lastSpaceIndex toScan |
	space := Character space.
	toScan := aString size min: anInteger + 1.
	lastSpaceIndex := 0.
	1 to: toScan do: [ :index |
		(aString at: index) = space ifTrue: [
			lastSpaceIndex := index ] ].
	
	lastSpaceIndex = 0
		ifTrue: [
			lastSpaceIndex := aString size min: anInteger.
			aStream nextPut: (aString copyFrom: 1 to: lastSpaceIndex) ]
		ifFalse: [
			aStream nextPut: (aString copyFrom: 1 to: lastSpaceIndex - 1) ].
		
	lastSpaceIndex < aString size ifTrue: [
		self
			splitString: (aString copyFrom: lastSpaceIndex + 1 to: aString size)
			intoChunksNoLongerThan: anInteger
			into: aStream ]
]

{ #category : #'instance creation' }
WAStringEmailBody class >> string: aString lineLength: anInteger [
	| string |
	string := String streamContents: [ :stream |
		| lines |
		lines := self splitIntoLines: (self convertCrLfToCrIn: aString).
		lines do: [ :each |
			each size <= anInteger
				ifTrue: [ stream nextPutAll: each ]
				ifFalse: [
					(self splitString: each intoChunksNoLongerThan: anInteger)
						do: [ :chunk | stream nextPutAll: chunk ]
						separatedBy: [ stream nextPut: Character cr ] ] ]
			separatedBy: [ stream nextPut: Character cr ] ].
	^ self new
		contentString: string;
		yourself
]

{ #category : #accessing }
WAStringEmailBody >> contentType [
	^ WAMimeType textPlain
]

{ #category : #accessing }
WAStringEmailBody >> isPlainText [
	^ true
]

{ #category : #accessing }
WAStringEmailBody >> sortOrder [
	^ 1
]
