Class {
	#name : #WADispatcherComponentTest,
	#superclass : #WAContextTest,
	#instVars : [
		'configApplication',
		'rootHandler',
		'childHandler',
		'normalApplication'
	],
	#category : 'Seaside-Tests-Tools-Web'
}

{ #category : #configuration }
WADispatcherComponentTest >> createHandlers [
	^ Array with: rootHandler with: configApplication with: WASession new
]

{ #category : #running }
WADispatcherComponentTest >> setUp [
	super setUp.
	rootHandler := WADispatcher new.
	rootHandler := rootHandler register: WADispatcher new at: 'seaside'.
	childHandler := rootHandler register: WADispatcher new at: 'child'.
	configApplication := WAAdmin register: WAConfigurationBrowser asApplicationAt: 'config' in: rootHandler.
	normalApplication := WAAdmin register: WAApplication 
		at: 'counter'
		in: childHandler.
	normalApplication configuration addParent: WARenderLoopConfiguration instance.
	normalApplication rootClass: WAConfigurationBrowser
]

{ #category : #tests }
WADispatcherComponentTest >> testNestedDispatcher [
	| configComponent |
	configComponent := WAConfigurationBrowser on: rootHandler.
	self requestContextWithUrl: '/config/child'.
	self requestContext consumer next.
	self requestContext session properties at: #presenter put: WAComponent new.
	configComponent initialRequest: self requestContext request.
	self assert: configComponent dispatcher == childHandler
]

{ #category : #tests }
WADispatcherComponentTest >> testUnregister [
	| url |
	url := normalApplication url.
	url path removeFirst.
	self assert: (WAAdmin unregister: url pathStringUnencoded in: rootHandler) = normalApplication.
	self assert: (WAAdmin unregister: url pathStringUnencoded in: rootHandler) isNil.
	
	url := childHandler url.
	url path removeFirst.
	self assert: (WAAdmin unregister: url pathStringUnencoded in: rootHandler) = childHandler.
	self assert: (WAAdmin unregister: url pathStringUnencoded in: rootHandler) isNil.
	
	self assert: (WAAdmin unregister: '/not-existing' in: rootHandler) isNil
]
