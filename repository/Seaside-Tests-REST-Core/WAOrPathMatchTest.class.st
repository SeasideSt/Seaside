Class {
	#name : #WAOrPathMatchTest,
	#superclass : #TestCase,
	#category : 'Seaside-Tests-REST-Core'
}

{ #category : #tests }
WAOrPathMatchTest >> testInstantiation [
	| match |
	match := WAOrPathMatch fromString: 'path' index: 1 arguments: #().
	self assert: (match isKindOf: WAOrPathMatch).
	self assert: match priority = 3
]

{ #category : #tests }
WAOrPathMatchTest >> testMatches [
	| match |
	match := WAOrPathMatch fromString: '[path|parameters]' index: 1 arguments: #().
	self assert: (match matches: 'path').
	self assert: (match matches: 'parameters').
	self deny: (match matches: 'poth').
	
	match := WAOrPathMatch fromString: '[path|or|parameters]' index: 1 arguments: #().
	self assert: (match matches: 'path').
	self assert: (match matches: 'parameters').
	self assert: (match matches: 'or').
	self deny: (match matches: 'poth')
]
