Class {
	#name : #WAPharoFunctionalTestsDefaultHandlersTest,
	#superclass : #WAEnvironmentDefaultHandlersTest,
	#category : 'Seaside-Tests-Pharo-Functional'
}

{ #category : #tests }
WAPharoFunctionalTestsDefaultHandlersTest >> testAllTests [
	| app |
	app := self defaultDispatcher handlerAt: 'tests/functional'.
	self assert: app class == WAApplication.
	self assert: app isApplication.
	self deny: app isDispatcher.
	self deny: app parent isNil.
	self assert: app name = 'functional'.
	self assert: app url pathStringUnencoded = '/tests/functional'
]

{ #category : #tests }
WAPharoFunctionalTestsDefaultHandlersTest >> testDefaultTests [
	| app |
	app := self defaultDispatcher handlerAt: 'tests'.
	self assert: app class == WADispatcher.
	self assert: app isDispatcher.
	self deny: app isRoot.
	self deny: app isApplication.
	self deny: app parent isNil.
	self assert: app name = 'tests'.
	self assert: app url pathStringUnencoded = '/tests'
]
