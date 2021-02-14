Class {
	#name : #WAQueryFieldHandlerTrackingStrategyTest,
	#superclass : #WAHandlerTrackingStrategyTest,
	#category : 'Seaside-Tests-Core-RequestHandling'
}

{ #category : #private }
WAQueryFieldHandlerTrackingStrategyTest >> newStrategy [
	^ WAQueryFieldHandlerTrackingStrategy new
]

{ #category : #tests }
WAQueryFieldHandlerTrackingStrategyTest >> testAddKeyToContext [
	| context |
	context := self requestContext.
	strategy addKey: 'The_Metaphor' toContext: context.
	self assertNoCookies: context
]

{ #category : #tests }
WAQueryFieldHandlerTrackingStrategyTest >> testAddKeyToUrl [
	| context uri |
	context := self requestContext.
	uri := context request uri copy.
	strategy addKey: 'The_Metaphor' toUrl: uri.
	self assert: uri greaseString = '/catspajamassc2?_s=The_Metaphor'
]

{ #category : #tests }
WAQueryFieldHandlerTrackingStrategyTest >> testKeyButNotValue [
	| context actual |
	context := self requestContext.
	context request uri addField: strategy keyField.
	actual := strategy keyFromContext: context.
	self assert: actual isNil
]

{ #category : #tests }
WAQueryFieldHandlerTrackingStrategyTest >> testKeyPresent [
	| context actual |
	context := self requestContext.
	context request uri addField: strategy keyField value: '4e232e46-003d2-04324-d3ac8fa8'.
	actual := strategy keyFromContext: context.
	self assert: actual = '4e232e46-003d2-04324-d3ac8fa8'
]

{ #category : #tests }
WAQueryFieldHandlerTrackingStrategyTest >> testNoKey [
	| actual |
	actual := strategy keyFromContext: self requestContext.
	self assert: actual isNil
]
