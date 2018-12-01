Class {
	#name : #WAWildcardMimeTypeMatchTest,
	#superclass : #TestCase,
	#instVars : [
		'match'
	],
	#category : 'Seaside-Tests-REST-Core'
}

{ #category : #running }
WAWildcardMimeTypeMatchTest >> setUp [
	match := WAWildcardMimeTypeMatch new
]

{ #category : #tests }
WAWildcardMimeTypeMatchTest >> testMatches [
	self assert: (match matches: (WAMimeType main: 'application' sub: 'xml')).
	self assert: (match matches: (WAMimeType main: 'something' sub: 'xml')).
	self assert: (match matches: (WAMimeType main: 'application' sub: 'something')).
	self assert: (match matches: (WAMimeType main: 'something' sub: 'something')).
	
	self assert: (match matches: (WAMimeType main: '*' sub: 'xml')).
	self assert: (match matches: (WAMimeType main: 'application' sub: '*')).
	self assert: (match matches: (WAMimeType main: '*' sub: '*'))
]

{ #category : #tests }
WAWildcardMimeTypeMatchTest >> testPriority [
	self assert: match priority = 1
]
