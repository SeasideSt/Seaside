Class {
	#name : #WACloneHandlerTest,
	#superclass : #TestCase,
	#category : 'Seaside-Tests-Tools-Web'
}

{ #category : #tests }
WACloneHandlerTest >> testCloneApplication [
	| app handler key clone |
	app := WADispatcher new register: WARegistry new at: 'app'.
	handler := WARequestHandler new.
	key := app register: handler.
	
	clone := app cloneHandler.
	
	self assert: (app cache at: key ifAbsent: [ nil ]) = handler.
	self assert: (clone cache at: key ifAbsent: [ nil ]) isNil
]
