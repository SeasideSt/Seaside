Extension { #name : #WARequestHandler }

{ #category : #'*seaside-tools-omnibrowser' }
WARequestHandler >> asNode [
	^ WAHandlerNode on: self
]
