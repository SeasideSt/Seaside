Class {
	#name : #WAExactPathMatchTest,
	#superclass : #TestCase,
	#category : 'Seaside-Tests-REST-Core'
}

{ #category : #tests }
WAExactPathMatchTest >> testInstantiation [
	| match |
	match := WAPPathMatch fromString: 'path' index: 1 arguments: #().
	self assert: (match isKindOf: WAExactPathMatch).
	self assert: match priority = 3
]

{ #category : #tests }
WAExactPathMatchTest >> testMatches [
	| match |
	match := WAPPathMatch fromString: 'path' index: 1 arguments: #().
	self assert: (match matches: 'path').
	self deny: (match matches: 'poth')
]
