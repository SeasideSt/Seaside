Class {
	#name : #WAMainMimeTypeMatchTest,
	#superclass : #TestCase,
	#instVars : [
		'match'
	],
	#category : 'Seaside-Tests-REST-Core'
}

{ #category : #running }
WAMainMimeTypeMatchTest >> setUp [
	match := WAMainMimeTypeMatch main: 'application'
]

{ #category : #tests }
WAMainMimeTypeMatchTest >> testMatches [
	self assert: (match matches: (WAMimeType main: 'application' sub: 'xml')).
	self deny: (match matches: (WAMimeType main: 'something' sub: 'xml')).
	self assert: (match matches: (WAMimeType main: 'application' sub: 'something')).
	self deny: (match matches: (WAMimeType main: 'something' sub: 'something')).
	
	self assert: (match matches: (WAMimeType main: '*' sub: 'xml')).
	self assert: (match matches: (WAMimeType main: 'application' sub: '*')).
	self assert: (match matches: (WAMimeType main: '*' sub: '*')).
	
	self deny: (match matches: (WAMimeType main: 'something' sub: '*')).
	self assert: (match matches: (WAMimeType main: '*' sub: 'something'))
]

{ #category : #tests }
WAMainMimeTypeMatchTest >> testPriority [
	self assert: match priority = 2
]
