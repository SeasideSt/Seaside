Class {
	#name : #WASubMimeTypeMatchTest,
	#superclass : #TestCase,
	#instVars : [
		'match'
	],
	#category : 'Seaside-Tests-REST-Core'
}

{ #category : #running }
WASubMimeTypeMatchTest >> setUp [
	match := WASubMimeTypeMatch sub: 'xml'
]

{ #category : #tests }
WASubMimeTypeMatchTest >> testMatches [
	self assert: (match matches: (WAMimeType main: 'application' sub: 'xml')).
	self assert: (match matches: (WAMimeType main: 'something' sub: 'xml')).
	self deny: (match matches: (WAMimeType main: 'application' sub: 'something')).
	self deny: (match matches: (WAMimeType main: 'something' sub: 'something')).
	
	self assert: (match matches: (WAMimeType main: '*' sub: 'xml')).
	self assert: (match matches: (WAMimeType main: 'application' sub: '*')).
	self assert: (match matches: (WAMimeType main: '*' sub: '*')).
	
	self assert: (match matches: (WAMimeType main: 'something' sub: '*')).
	self deny: (match matches: (WAMimeType main: '*' sub: 'something'))
]

{ #category : #tests }
WASubMimeTypeMatchTest >> testPriority [
	self assert: match priority = 2
]
