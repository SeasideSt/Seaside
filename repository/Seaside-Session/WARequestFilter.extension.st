Extension { #name : #WARequestFilter }

{ #category : #'*seaside-session' }
WARequestFilter >> updateStates: aSnapshot [
	aSnapshot register: next
]
