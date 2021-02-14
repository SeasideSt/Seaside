Extension { #name : #WASession }

{ #category : #'*seaside-renderloop' }
WASession >> presenter [
	^ self properties at: #presenter ifAbsent: [ nil ]
]
