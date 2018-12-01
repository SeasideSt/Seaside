Class {
	#name : #WAHandlerBrowser,
	#superclass : #OBBrowser,
	#category : 'Seaside-Tools-OmniBrowser'
}

{ #category : #configuration }
WAHandlerBrowser class >> adaptorMetaNode [
	| handlers adaptor |
	adaptor := OBMetaNode named: 'adaptor'.
	handlers := self handlerMetaNode.
	adaptor childAt: #requestHandlers labeled: 'handler' put: handlers.
	^ adaptor
]

{ #category : #configuration }
WAHandlerBrowser class >> buttonPanel [
	^ nil
]

{ #category : #configuration }
WAHandlerBrowser class >> defaultMetaNode [
	^ self handlerMetaNode
]

{ #category : #configuration }
WAHandlerBrowser class >> defaultRootNode [
	^ WAAdmin defaultDispatcher asNode
]

{ #category : #configuration }
WAHandlerBrowser class >> handlerMetaNode [
	| attributes handlers |
	handlers := OBMetaNode named: 'handlers'.
	attributes := OBMetaNode named: 'attributes'.
	attributes addFilter: WAAttributeInheritanceFilter new.
	handlers
		childAt: #children labeled: 'Handlers' put: handlers;
		childAt: #groupedAttributes labeled: 'Config' put: attributes;
		addFilter: OBModalFilter new.
	^ handlers
]

{ #category : #configuration }
WAHandlerBrowser class >> title [
	^ 'Request Handler Browser'
]

{ #category : #commands }
WAHandlerBrowser >> cmdAddHandler [
	<command>
	
	^ WACmdAddHandler instances
]

{ #category : #commands }
WAHandlerBrowser >> cmdRemoveExpression [
	<command>
	
	^ WACmdRemoveExpression
]

{ #category : #commands }
WAHandlerBrowser >> cmdRemoveHandler [
	<command>
	
	^ WACmdRemoveHandler
]

{ #category : #building }
WAHandlerBrowser >> defaultBackgroundColor [
	^ Color r: 0.0 g: 0.542 b: 1.0
]
