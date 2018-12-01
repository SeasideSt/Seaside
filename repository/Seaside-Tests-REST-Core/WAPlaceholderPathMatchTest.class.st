Class {
	#name : #WAPlaceholderPathMatchTest,
	#superclass : #TestCase,
	#category : 'Seaside-Tests-REST-Core'
}

{ #category : #tests }
WAPlaceholderPathMatchTest >> testFullInstantiation [
	| match |
	match := WAPPathMatch fromString: '{7}' index: 2 arguments: #().
	self assert: (match isKindOf: WAFullPlaceholderPathMatch).
	self assert: match priority = 2.
	self assert: match sourceIndex = 2.
	self assert: match targetIndex = 7
]

{ #category : #tests }
WAPlaceholderPathMatchTest >> testFullMapArgumentsWithElementsInto [
	| match result |
	match := WAPPathMatch fromString: '{1}' index: 1 arguments: #().
	result := Array new: 1.
	match mapArgumentsWithElements: #('foo') into: result.
	self assert: result first = 'foo'
]

{ #category : #tests }
WAPlaceholderPathMatchTest >> testMatchesFull [
	| match |
	match := WAPPathMatch fromString: '{7}' index: 1 arguments: #().
	self assert: (match matches: 'foo')
]

{ #category : #tests }
WAPlaceholderPathMatchTest >> testMatchesPrefix [
	| match |
	match := WAPPathMatch fromString: 'foo.{7}' index: 1 arguments: #().
	self assert: (match matches: 'foo.bar').
	self deny: (match matches: 'foo.').
	self deny: (match matches: 'fo.bar').
	self deny: (match matches: 'oo.bar')
]

{ #category : #tests }
WAPlaceholderPathMatchTest >> testMatchesSuffix [
	| match |
	match := WAPPathMatch fromString: '{7}.bar' index: 1 arguments: #().
	self assert: (match matches: 'foo.bar').
	self deny: (match matches: '.bar').
	self deny: (match matches: 'foo.barz').
	self deny: (match matches: 'foo.ba')
]

{ #category : #tests }
WAPlaceholderPathMatchTest >> testMultiInstantiation [
	| match |
	match := WAPPathMatch fromString: '*7*' index: 2 arguments: #().
	self assert: (match isKindOf: WAMultiPlaceholderPathMatch).
	self assert: match priority = 1.
	self assert: match sourceIndex = 2.
	self assert: match targetIndex = 7
]

{ #category : #tests }
WAPlaceholderPathMatchTest >> testNamedInstantiation [
	| match |
	match := WAPPathMatch fromString: '{put}' index: 2 arguments: #('get' 'put' 'post').
	self assert: (match isKindOf: WAFullPlaceholderPathMatch).
	self assert: match priority = 2.
	self assert: match sourceIndex = 2.
	self assert: match targetIndex = 2
]

{ #category : #tests }
WAPlaceholderPathMatchTest >> testNamedMultiInstantiation [
	| match |
	match := WAPPathMatch fromString: '*put*' index: 2 arguments: #('get' 'put' 'post').
	self assert: (match isKindOf: WAMultiPlaceholderPathMatch).
	self assert: match priority = 1.
	self assert: match sourceIndex = 2.
	self assert: match targetIndex = 2
]

{ #category : #tests }
WAPlaceholderPathMatchTest >> testPrefixInstantiation [
	| match |
	match := WAPPathMatch fromString: 'foo.{787}' index: 2 arguments: #().
	self assert: (match isKindOf: WAPrefixPlaceholderPathMatch).
	self assert: match priority = 3.
	self assert: match sourceIndex = 2.
	self assert: match targetIndex = 787
]

{ #category : #tests }
WAPlaceholderPathMatchTest >> testPrefixMapArgumentsWithElementsInto [
	| match result |
	match := WAPPathMatch fromString: 'foo.{1}' index: 1 arguments: #().
	result := Array new: 1.
	match mapArgumentsWithElements: #('foo.bar') into: result.
	self assert: result first = 'bar'
]

{ #category : #tests }
WAPlaceholderPathMatchTest >> testSuffixInstantiation [
	| match |
	match := WAPPathMatch fromString: '{787}.bar' index: 2 arguments: #().
	self assert: (match isKindOf: WASuffixPlaceholderPathMatch).
	self assert: match priority = 3.
	self assert: match sourceIndex = 2.
	self assert: match targetIndex = 787
]

{ #category : #tests }
WAPlaceholderPathMatchTest >> testSuffixMapArgumentsWithElementsInto [
	| match result |
	match := WAPPathMatch fromString: '{1}.bar' index: 1 arguments: #().
	result := Array new: 1.
	match mapArgumentsWithElements: #('foo.bar') into: result.
	self assert: result first = 'foo'
]
