Class {
	#name : #WACompositeMimeTypeMatchTest,
	#superclass : #TestCase,
	#instVars : [
		'match'
	],
	#category : 'Seaside-Tests-REST-Core'
}

{ #category : #running }
WACompositeMimeTypeMatchTest >> setUp [
	match := WACompositeMimeTypeMatch matches: (Array with:
		(WAMimeTypeMatch fromString: 'text/*'))
]

{ #category : #tests }
WACompositeMimeTypeMatchTest >> testMatches [
	self assert: (match matches: (WAMimeType fromString: 'text/plain')).
	self deny: (match matches: (WAMimeType fromString: 'application/json'))
]

{ #category : #tests }
WACompositeMimeTypeMatchTest >> testPriorityFor [
	match := WACompositeMimeTypeMatch matches: (Array
		with: (WAMimeTypeMatch fromString: 'application/*')
		with: (WAMimeTypeMatch fromString: '*/*')).
	self assert: (match priorityFor: (WAMimeType fromString: 'application/json')) = 2
]
