"
I am the result of a route look up. I contain all the information required to ""execute"" the result.

Instance Variables:
	route	<WARoute>
	elements	<Collection<String>>
	parameters	<WARequestFields>
		
route
	the found route
	
elements
	the unconsumed path elements of the request
	
parameters
	the query fields of the request
"
Class {
	#name : #WARouteResult,
	#superclass : #WAObject,
	#instVars : [
		'route',
		'elements',
		'parameters'
	],
	#category : 'Seaside-REST-Core-Route'
}

{ #category : #'instance creation' }
WARouteResult class >> route: aRoute elements: anArray parameters: aDictionary [
	^ self basicNew initializeWithRoute: aRoute elements: anArray parameters: aDictionary
]

{ #category : #accessing }
WARouteResult >> elements [
	^ elements
]

{ #category : #initialization }
WARouteResult >> initializeWithRoute: aRoute elements: anArray parameters: aDictionary [
	self initialize.
	route := aRoute.
	elements := anArray.
	parameters := aDictionary
]

{ #category : #accessing }
WARouteResult >> route [
	^ route
]

{ #category : #accessing }
WARouteResult >> seasideMimeType [
	"Answer the value of the content-type header according to the value of <consumes: >.
	Answer nil for missing values."
	^ route seasideMimeType
]

{ #category : #public }
WARouteResult >> sendMessageTo: anObject [
	| arguments |
	arguments := Array new: route argumentCount.
	route mapArgumentsWithElements: elements parameters: parameters into: arguments.
	^ route
		sendSelectorWith: arguments
		to: anObject
]
