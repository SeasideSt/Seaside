Class {
	#name : #WATestSession,
	#superclass : #WASession,
	#category : 'Seaside-Tests-Session'
}

{ #category : #handling }
WATestSession >> start [
	(self requestContext response)
		nextPutAll: 'start: ';
		nextPutAll: self key
]
