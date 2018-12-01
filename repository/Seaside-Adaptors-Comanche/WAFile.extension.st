Extension { #name : #WAFile }

{ #category : #'*seaside-adaptors-comanche' }
WAFile classSide >> fromChunk: aChunk [
	^ self new readFromChunk: aChunk; yourself
]

{ #category : #'*seaside-adaptors-comanche' }
WAFile >> isTemporary [
	"this is not a temporary but an in memory file"

	^ false
]

{ #category : #'*seaside-adaptors-comanche' }
WAFile >> readFromChunk: aChunk [
	self contentType: aChunk contentType seasideMimeType.
	self contents: (String streamContents: [ :stream |
		aChunk saveToStream: stream ]) asByteArray
]
