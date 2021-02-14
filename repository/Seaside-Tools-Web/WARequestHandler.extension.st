Extension { #name : #WARequestHandler }

{ #category : #'*seaside-tools-web' }
WARequestHandler >> cloneHandler [
	^ self copy
]

{ #category : #'*seaside-tools-web' }
WARequestHandler >> configurationComponent [
	^ WAHandlerEditor on: self
]

{ #category : #'*seaside-tools-web' }
WARequestHandler >> hierarchyNames [
	self isRoot ifTrue: [ ^ #() ].
	^ self parent hierarchyNames copyWith: self name
]

{ #category : #'*seaside-tools-web' }
WARequestHandler >> hierarchyPathString [
	^ String streamContents: [ :stream |
		stream nextPut: $/.
		self hierarchyNames
			do: [ :each | stream nextPutAll: each ]
			separatedBy: [ stream nextPut: $/ ] ]
]
