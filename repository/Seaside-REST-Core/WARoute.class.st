"
I am a message that can be sent if I match a request. Message arguments can be taken from the request.

Instance Variables:
	method		<String>
	selector	<Symbol>
	produces 	<WAMatch>
	consumes 	<WAMatch>
		
method
	- The HTTP method on which to follow this route, eg. 'GET'

selector
	- The selector to perform, eg. #index
	
produces
	- The MIME type this route produces (Content-Type HTTP header)
	
consumes
	- The MIME type this route accepts (Accept HTTP header)
"
Class {
	#name : #WARoute,
	#superclass : #WAObject,
	#instVars : [
		'method',
		'selector',
		'produces',
		'consumes'
	],
	#category : 'Seaside-REST-Core-Route'
}

{ #category : #'instance creation' }
WARoute class >> copy: aSymbol [
	^ WASimpleRoute method: 'COPY' selector: aSymbol
]

{ #category : #'instance creation' }
WARoute class >> delete: aSymbol [
	^ WASimpleRoute method: 'DELETE' selector: aSymbol
]

{ #category : #'instance creation' }
WARoute class >> delete: aString selector: aSymbol [
	^ WAComplexRoute
		method: 'DELETE'
		selector: aSymbol
		pattern: aString
]

{ #category : #'instance creation' }
WARoute class >> get: aSymbol [
	^ WASimpleRoute method: 'GET' selector: aSymbol
]

{ #category : #'instance creation' }
WARoute class >> get: aString selector: aSymbol [
	^ WAComplexRoute
		method: 'GET'
		selector: aSymbol
		pattern: aString
]

{ #category : #'instance creation' }
WARoute class >> httpMethodNames [
	^ #(
		COPY
		DELETE
		GET
		MOVE
		POST
		PUT
	)
]

{ #category : #'instance creation' }
WARoute class >> move: aSymbol [
	^ WASimpleRoute method: 'MOVE' selector: aSymbol
]

{ #category : #'instance creation' }
WARoute class >> options: aSymbol [
	^ WASimpleRoute method: 'OPTIONS' selector: aSymbol
]

{ #category : #'instance creation' }
WARoute class >> options: aString selector: aSymbol [
	^ WAComplexRoute
		method: 'OPTIONS'
		selector: aSymbol
		pattern: aString
]

{ #category : #'instance creation' }
WARoute class >> patch: aSymbol [
	^ WASimpleRoute method: 'PATCH' selector: aSymbol
]

{ #category : #'instance creation' }
WARoute class >> patch: aString selector: aSymbol [
	^ WAComplexRoute
		method: 'PATCH'
		selector: aSymbol
		pattern: aString
]

{ #category : #'instance creation' }
WARoute class >> post: aSymbol [
	^ WASimpleRoute method: 'POST' selector: aSymbol
]

{ #category : #'instance creation' }
WARoute class >> post: aString selector: aSymbol [
	^ WAComplexRoute
		method: 'POST'
		selector: aSymbol
		pattern: aString
]

{ #category : #'instance creation' }
WARoute class >> put: aSymbol [
	^ WASimpleRoute method: 'PUT' selector: aSymbol
]

{ #category : #'instance creation' }
WARoute class >> put: aString selector: aSymbol [
	^ WAComplexRoute
		method: 'PUT'
		selector: aSymbol
		pattern: aString
]

{ #category : #accessing }
WARoute >> argumentCount [
	self subclassResponsibility
]

{ #category : #accessing }
WARoute >> consumes [
	^ consumes
]

{ #category : #testing }
WARoute >> consumes: aMimeType [
	^ consumes matches: aMimeType
]

{ #category : #accessing }
WARoute >> consumesPriorityFor: aMimeType [
	^ consumes priorityFor: aMimeType
]

{ #category : #initialization }
WARoute >> initializeWithMethod: aString selector: aSymbol produces: aProducesMimeTypeMatch consumes: aConsumesMimeTypeMatch [ 
	self initialize.
	method := aString.
	selector := aSymbol.
	produces := aProducesMimeTypeMatch.
	consumes := aConsumesMimeTypeMatch
]

{ #category : #public }
WARoute >> mapArgumentsWithElements: anStringArray parameters: aDictionary into: anArray [
	self subclassResponsibility
]

{ #category : #testing }
WARoute >> matchesFlexibleNumberOfPathElements [
	self subclassResponsibility
]

{ #category : #testing }
WARoute >> matchesParameters: aDictionary [
	self subclassResponsibility
]

{ #category : #testing }
WARoute >> matchesPath: aCollectionOfStrings [
	self subclassResponsibility
]

{ #category : #accessing }
WARoute >> method [
	^ method
]

{ #category : #accessing }
WARoute >> pathElementCount [
	self subclassResponsibility
]

{ #category : #printing }
WARoute >> printOn: aStream [
	super printOn: aStream.

	aStream 
		nextPutAll: ' (method: '; print: self method;
		nextPutAll: ' selector: '; print: self selector;
		nextPutAll: ' produces: '; print: self seasideMimeType;
		nextPutAll: ' consumes: '; print: consumes;
		nextPut: $)
]

{ #category : #accessing }
WARoute >> priority [
	self subclassResponsibility
]

{ #category : #testing }
WARoute >> produces: aCollectionOfAccept [
	^ aCollectionOfAccept anySatisfy: [ :each | produces matches: each value ]
]

{ #category : #accessing }
WARoute >> producesPriorityFor: aMimeType [
	^ produces priorityFor: aMimeType
]

{ #category : #accessing }
WARoute >> seasideMimeType [
	"Answer the value of the content-type header according to the value of <consumes: >.
	Answer nil for missing values."
	^ produces seasideMimeType
]

{ #category : #accessing }
WARoute >> selector [
	^ selector
]

{ #category : #public }
WARoute >> sendSelectorWith: anArrayOfArguments to: anObject [
	^ anObject perform: selector withArguments: anArrayOfArguments
]
