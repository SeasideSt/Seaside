Class {
	#name : 'WANextUnconsumedPathElementRequestHandler',
	#superclass : 'WARequestHandler',
	#instVars : [
		'nextUnconsumedPathElement'
	],
	#category : 'Seaside-Tests-Core-RequestHandling',
	#package : 'Seaside-Tests-Core',
	#tag : 'RequestHandling'
}

{ #category : 'handling' }
WANextUnconsumedPathElementRequestHandler >> handle: aRequestContext [
	| consumer |
	consumer := aRequestContext consumer.
	nextUnconsumedPathElement := consumer atEnd
		ifTrue: [ nil ]
		ifFalse: [ aRequestContext consumer peek ].
	super handle: aRequestContext
]

{ #category : 'handling' }
WANextUnconsumedPathElementRequestHandler >> handleFiltered: aRequestContext [
]

{ #category : 'accessing' }
WANextUnconsumedPathElementRequestHandler >> nextUnconsumedPathElement [
	^ nextUnconsumedPathElement
]
