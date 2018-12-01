"
Unit test for default handlers of the environment
"
Class {
	#name : #WAEnvironmentDefaultHandlersTest,
	#superclass : #TestCase,
	#category : 'Seaside-Tests-Environment'
}

{ #category : #private }
WAEnvironmentDefaultHandlersTest >> defaultDispatcher [
	^ WAAdmin defaultDispatcher
]

{ #category : #tests }
WAEnvironmentDefaultHandlersTest >> testDefaultFiles [
	| app |
	app := self defaultDispatcher handlerAt: 'files'.
	self assert: app class == WAFileHandler.
	self deny: app isDispatcher.
	self deny: app isApplication.
	self deny: app parent isNil.
	self assert: app name equals: 'files'.
	self assert: app url pathStringUnencoded equals: '/files'
]

{ #category : #tests }
WAEnvironmentDefaultHandlersTest >> testDefaultRoot [
	| app |
	app := self defaultDispatcher.
	self assert: app class == WADispatcher.
	self assert: app isDispatcher.
	self assert: app isRoot.
	self deny: app isApplication.
	self assert: app parent isNil.
	self assert: app name equals: ''.
	self assert: app url pathStringUnencoded equals: '/'
]

{ #category : #tests }
WAEnvironmentDefaultHandlersTest >> testInvalidConfig [
	| app |
	app := self defaultDispatcher handlerAt: 'examplesxyz/counter' ifAbsent: [ nil ].
	self assert: app isNil.
	app := self defaultDispatcher handlerAt: 'examples/counterxyz' ifAbsent: [ nil ].
	self assert: app isNil
	
]
