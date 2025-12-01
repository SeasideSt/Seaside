Extension { #name : 'WARequestHandler' }

{ #category : '*seaside-tools-omnibrowser' }
WARequestHandler >> asNode [
	^ WAHandlerNode on: self
]

{ #category : '*Seaside-Tools-OmniBrowser' }
WARequestHandler class >> browserIcon [
	^ #seasideRequestHandler
]
