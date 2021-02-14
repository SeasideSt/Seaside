Class {
	#name : #WAFullMimeTypeMatchTest,
	#superclass : #TestCase,
	#instVars : [
		'match'
	],
	#category : 'Seaside-Tests-REST-Core'
}

{ #category : #running }
WAFullMimeTypeMatchTest >> setUp [
	match := WAFullMimeTypeMatch main: 'application' sub: 'xml'
]

{ #category : #tests }
WAFullMimeTypeMatchTest >> testMatches [
	self assert: (match matches: (WAMimeType main: 'application' sub: 'xml')).
	self deny: (match matches: (WAMimeType main: 'something' sub: 'xml')).
	self deny: (match matches: (WAMimeType main: 'application' sub: 'something')).
	self deny: (match matches: (WAMimeType main: 'something' sub: 'something')).
	
	self assert: (match matches: (WAMimeType main: '*' sub: 'xml')).
	self assert: (match matches: (WAMimeType main: 'application' sub: '*')).
	self assert: (match matches: (WAMimeType main: '*' sub: '*')).
	
	self deny: (match matches: (WAMimeType main: 'something' sub: '*')).
	self deny: (match matches: (WAMimeType main: '*' sub: 'something'))
]

{ #category : #tests }
WAFullMimeTypeMatchTest >> testPriority [
	self assert: match priority = 3
]
