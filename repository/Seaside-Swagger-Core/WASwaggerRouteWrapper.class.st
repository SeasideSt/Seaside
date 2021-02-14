Class {
	#name : #WASwaggerRouteWrapper,
	#superclass : #WAObject,
	#instVars : [
		'route',
		'path',
		'tags',
		'responses'
	],
	#category : 'Seaside-Swagger-Core'
}

{ #category : #accessing }
WASwaggerRouteWrapper >> path [
	^ path
]

{ #category : #accessing }
WASwaggerRouteWrapper >> path: anObject [
	path := anObject
]

{ #category : #accessing }
WASwaggerRouteWrapper >> responses [
	^ responses
]

{ #category : #accessing }
WASwaggerRouteWrapper >> responses: anObject [
	responses := anObject
]

{ #category : #accessing }
WASwaggerRouteWrapper >> route [
	^ route
]

{ #category : #accessing }
WASwaggerRouteWrapper >> route: anObject [
	route := anObject
]

{ #category : #accessing }
WASwaggerRouteWrapper >> tags [
	^ tags
]

{ #category : #accessing }
WASwaggerRouteWrapper >> tags: anObject [
	tags := anObject
]
