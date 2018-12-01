Class {
	#name : #WAExamplesDefaultHandlersTest,
	#superclass : #WAEnvironmentDefaultHandlersTest,
	#category : 'Seaside-Tests-Examples'
}

{ #category : #tests }
WAExamplesDefaultHandlersTest >> testDefaultCounterDirect [
	| app |
	app := self defaultDispatcher handlerAt: 'examples/counter'.
	self assert: app class == WAApplication.
	self assert: app isApplication.
	self deny: app isDispatcher.
	self deny: app parent isNil.
	self assert: app name = 'counter'.
	self assert: app parent name = 'examples'.
	self assert: app url pathStringUnencoded = '/examples/counter'
]

{ #category : #tests }
WAExamplesDefaultHandlersTest >> testDefaultCounterNavigate [
	| app |
	app := self defaultDispatcher handlerAt: 'examples'.
	self assert: app class == WADispatcher.
	self assert: app isDispatcher.
	self deny: app isRoot.
	self deny: app isApplication.
	self deny: app parent isNil.
	self assert: app name = 'examples'.
	self assert: app url pathStringUnencoded = '/examples'.
	app := app handlerAt: 'counter'.
	self assert: app class == WAApplication.
	self assert: app isApplication.
	self deny: app isDispatcher.
	self deny: app parent isNil.
	self assert: app name = 'counter'.
	self assert: app parent name = 'examples'.
	self assert: app url pathStringUnencoded = '/examples/counter'
]
