"
I match only on an exact number of path elements and no URL parameters. The path elements are turned into message arguments.

Instance Variables:
	count	<Integer>
		
count
	- The exact number of path elements that have to be present.
"
Class {
	#name : #WASimpleRoute,
	#superclass : #WARoute,
	#instVars : [
		'count'
	],
	#category : 'Seaside-REST-Core-Route'
}

{ #category : #'instance creation' }
WASimpleRoute class >> method: aString selector: aSymbol [
	^ self
		method: aString
		selector: aSymbol
		produces: WAWildcardMimeTypeMatch new
		consumes: WAWildcardMimeTypeMatch new
]

{ #category : #'instance creation' }
WASimpleRoute class >> method: aString selector: aSymbol produces: aProducesMimeTypeMatch consumes: aConsumesMimeTypeMatch [
	"Can't send #count: in VAST"
	| count |
	count := 0.
	aSymbol do: [ :each |
		each = $: 
			ifTrue: [ count := count + 1 ] ].
	^ self basicNew
		initializeWithMethod: aString
		count: count
		selector: aSymbol
		produces: aProducesMimeTypeMatch
		consumes: aConsumesMimeTypeMatch
]

{ #category : #accessing }
WASimpleRoute >> argumentCount [
	^ self pathElementCount
]

{ #category : #initialization }
WASimpleRoute >> initializeWithMethod: aString count: anInteger selector: aSymbol produces: aProducesMimeTypeMatch consumes: aConsumesMimeTypeMatch [ 
	self initializeWithMethod: aString selector: aSymbol produces: aProducesMimeTypeMatch consumes: aConsumesMimeTypeMatch .
	count := anInteger
]

{ #category : #public }
WASimpleRoute >> mapArgumentsWithElements: anStringArray parameters: aDictionary into: anArray [
	1 to: self argumentCount do: [ :index |
		anArray at: index put: (anStringArray at: index) ]
]

{ #category : #testing }
WASimpleRoute >> matchesFlexibleNumberOfPathElements [
	^ false
]

{ #category : #testing }
WASimpleRoute >> matchesParameters: aDictionary [
	^ aDictionary isEmpty
]

{ #category : #testing }
WASimpleRoute >> matchesPath: aCollectionOfStrings [
	^ self pathElementCount = aCollectionOfStrings size
]

{ #category : #accessing }
WASimpleRoute >> pathElementCount [
	^ count
]

{ #category : #accessing }
WASimpleRoute >> priority [
	^ self pathElementCount
]
