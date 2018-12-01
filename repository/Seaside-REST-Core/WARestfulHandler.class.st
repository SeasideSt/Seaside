Class {
	#name : #WARestfulHandler,
	#superclass : #WARequestHandler,
	#instVars : [
		'routes'
	],
	#category : 'Seaside-REST-Core-Handler'
}

{ #category : #private }
WARestfulHandler >> createRoutes [
	"Creates a collection of routes for the receiver. Override this method in subclasses to explicitely create the routes instead of using the default implementation that builds the routes using annotated methods (pragmas)."

	^ GRPlatform current createRoutesFrom: self class to: WARestfulHandler
]

{ #category : #handling }
WARestfulHandler >> executeResult: aRouteResult [
	| requestContext |
	requestContext := self requestContext.
	requestContext respond: [ :response |
		| mimeType |
		mimeType := aRouteResult seasideMimeType.
		mimeType isNil
			ifTrue: [
				response
					document: (aRouteResult sendMessageTo: self) ]
			ifFalse: [
				mimeType isBinary ifFalse: [
					"defensive copy because we modify"
					mimeType := mimeType copy.
					mimeType charset: requestContext charSet ].
				response
					document: (aRouteResult sendMessageTo: self)
					mimeType: mimeType ] ]
]

{ #category : #handling }
WARestfulHandler >> handleFiltered: aRequestContext [
	self executeResult: (self
		routeForContext: aRequestContext
		ifAbsent: [ self noRouteFound: aRequestContext ])
]

{ #category : #private }
WARestfulHandler >> isImplemented: aString [
	^ WARoute httpMethodNames includes: aString
]

{ #category : #handling }
WARestfulHandler >> noRouteFound: aRequestContext [
	aRequestContext responseGenerator
		notFound;
		respond
]

{ #category : #private }
WARestfulHandler >> routeForContext: aRequestContext ifAbsent: aNiladicBlock [
	^ (WAByMethodRoutes routes: self routes)
		routeForContext: aRequestContext
		consume: self shouldConsumePath
		ifAbsent: aNiladicBlock
]

{ #category : #accessing }
WARestfulHandler >> routes [
	"Answer a collection of routes for the receiver."

	^ self shouldCacheRoutes
		ifTrue: [  routes ifNil: [ routes := self createRoutes ] ]
		ifFalse: [
			"Issue 785
			even assign when they should not be cached to better support recaching"
			routes := self createRoutes ]
]

{ #category : #private }
WARestfulHandler >> shouldCacheRoutes [
	"Answer a boolean if the routes should be cached by the receiver."

	^ false
]

{ #category : #private }
WARestfulHandler >> shouldConsumePath [
	"Answer whether the request path should be consumed if a route is found."
	^ true
]
