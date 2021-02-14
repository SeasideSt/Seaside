Class {
	#name : #WAExactParameterMatchTest,
	#superclass : #TestCase,
	#category : 'Seaside-Tests-REST-Core'
}

{ #category : #tests }
WAExactParameterMatchTest >> testInstantiation [
	| match |
	match := WAParameterMatch name: 'rev' value: '58692' arguments: #().
	self assert: (match isKindOf: WAExactParameterMatch)
]

{ #category : #tests }
WAExactParameterMatchTest >> testMatches [
	| match |
	match := WAParameterMatch name: 'rev' value: '58692' arguments: #().
	self assert: (match matchesName: 'rev' value: '58692').
	self deny: (match matchesName: 'rev' value: 58692).
	self deny: (match matchesName: 'rev' value: 'a').
	self deny: (match matchesName: 'revision' value: '58692')
]
