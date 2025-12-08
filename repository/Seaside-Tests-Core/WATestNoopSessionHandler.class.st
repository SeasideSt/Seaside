Class {
	#name : 'WATestNoopSessionHandler',
	#superclass : 'WARequestHandler',
	#category : 'Seaside-Tests-Core-RequestHandling',
	#package : 'Seaside-Tests-Core',
	#tag : 'RequestHandling'
}

{ #category : 'handling' }
WATestNoopSessionHandler >> handleFiltered: aRequestContext [
	"do nothing"
]

{ #category : 'testing' }
WATestNoopSessionHandler >> isSession [
	^ true
]

{ #category : 'accessing' }
WATestNoopSessionHandler >> key: aString [
	"ignore"
]
