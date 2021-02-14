Class {
	#name : #WAPlaceholderParameterTest,
	#superclass : #TestCase,
	#category : 'Seaside-Tests-REST-Core'
}

{ #category : #tests }
WAPlaceholderParameterTest >> testInstantiation [
	| match |
	match := WAParameterMatch name: 'rev' value: '{1}' arguments: #().
	self assert: (match isKindOf: WAPlaceholderParameterMatch).
	self assert: match index = 1
]

{ #category : #tests }
WAPlaceholderParameterTest >> testMatches [
	| match |
	match := WAParameterMatch name: 'rev' value: '{1}' arguments: #().
	self assert: (match matchesName: 'rev' value: '58692').
	self assert: (match matchesName: 'rev' value: 'a').
	self deny: (match matchesName: 'revision' value: '58692')
]

{ #category : #tests }
WAPlaceholderParameterTest >> testNamedInstantiation [
	| match |
	match := WAParameterMatch name: 'rev' value: '{put}' arguments: #('post' 'put' 'get').
	self assert: (match isKindOf: WAPlaceholderParameterMatch).
	self assert: match index = 2
]
