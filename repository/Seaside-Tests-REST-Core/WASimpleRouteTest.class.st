Class {
	#name : #WASimpleRouteTest,
	#superclass : #TestCase,
	#category : 'Seaside-Tests-REST-Core'
}

{ #category : #tests }
WASimpleRouteTest >> testParameterMatching [
	| route parameters |
	route := WARoute get: #a:.
	self assert: (route matchesParameters: Dictionary new).
	parameters := Dictionary new at: 'key' put: 'value'; yourself.
	self deny: (route matchesParameters: parameters)
]

{ #category : #tests }
WASimpleRouteTest >> testPathMatching [
	| route |
	route := WARoute get: #a:.
	self deny: (route matchesPath: Array new).
	self assert: (route matchesPath: #('something')).
	self deny: (route matchesPath: #('something' 'else')).
	self assert: (route priority = 1).
	
	route := WARoute get: #a:b:.
	self deny: (route matchesPath: Array new).
	self deny: (route matchesPath: #('something')).
	self assert: (route matchesPath: #('something' 'else')).
	self deny: (route matchesPath: #('something' 'else' 'more')).
	self assert: (route priority = 2)
]
