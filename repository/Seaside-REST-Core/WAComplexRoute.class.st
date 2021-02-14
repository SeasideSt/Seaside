Class {
	#name : #WAComplexRoute,
	#superclass : #WARoute,
	#instVars : [
		'pathMatches',
		'parameterMatches',
		'isOverlyComplex'
	],
	#category : 'Seaside-REST-Core-Route'
}

{ #category : #examples }
WAComplexRoute class >> example [
	^ self
		get: '/{3}/_all_docs?startkey={1}&limit={2}'
		selector: #getAllDocumentsStartingAt:limitedTo:inDatabase:
]

{ #category : #'instance creation' }
WAComplexRoute class >> method: aMethodString selector: aSymbol pattern: aPatternString [
	^ self
		method: aMethodString
		selector: aSymbol
		url: (WAUrl absolute: aPatternString)
		arguments: #()
		produces: WAWildcardMimeTypeMatch new
		consumes: WAWildcardMimeTypeMatch new
]

{ #category : #'instance creation' }
WAComplexRoute class >> method: aMethodString selector: aSymbol pattern: aPatternString arguments: aCollectionOfStrings produces: aProducesMimeTypeMatch consumes: aConsumesMimeTypeMatch [ 
	^ self
		method: aMethodString
		selector: aSymbol
		url: (WAUrl absolute: aPatternString)
		arguments: aCollectionOfStrings
		produces: aProducesMimeTypeMatch
		consumes: aConsumesMimeTypeMatch
]

{ #category : #'instance creation' }
WAComplexRoute class >> method: aString selector: aSymbol url: aUrl arguments: aCollectionOfStrings produces: aProducesMimeTypeMatch consumes: aConsumesMimeTypeMatch [
	^ self basicNew
		initializeWithMethod: aString
		selector: aSymbol
		url: aUrl
		arguments: aCollectionOfStrings
		produces: aProducesMimeTypeMatch
		consumes: aConsumesMimeTypeMatch 
]

{ #category : #accessing }
WAComplexRoute >> argumentCount [
	| count |
	count := 0.
	pathMatches do: [ :each |
		count := count + each argumentCount ].
	parameterMatches do: [ :each |
		count := count + each argumentCount ].
	^ count 
]

{ #category : #private }
WAComplexRoute >> buildPathMatchesFrom: aUrl arguments: aCollectionOfStrings [
	| index |
	index := 0.
	^ aUrl path collect: [ :each |
		index := index + 1.
		WAPPathMatch fromString: each index: index arguments: aCollectionOfStrings ]
]

{ #category : #initialization }
WAComplexRoute >> initializeQueryFieldParameters: queryFields arguments: aCollectionOfStrings [
	queryFields
		keysAndValuesDo: [ :key :value | parameterMatches at: key put: (WAParameterMatch name: key value: value arguments: aCollectionOfStrings) ]
]

{ #category : #initialization }
WAComplexRoute >> initializeWithMethod: aString selector: aSymbol url: aUrl arguments: aCollectionOfStrings produces: aProducesMimeTypeMatch consumes: aConsumesMimeTypeMatch [
	self
		initializeWithMethod: aString
		selector: aSymbol
		produces: aProducesMimeTypeMatch
		consumes: aConsumesMimeTypeMatch.
	pathMatches := self buildPathMatchesFrom: aUrl arguments: aCollectionOfStrings.
	parameterMatches := Dictionary new.
	self initializeQueryFieldParameters: aUrl queryFields arguments: aCollectionOfStrings.
	isOverlyComplex := pathMatches anySatisfy: [ :each | each matchesJustOneElement not ]
]

{ #category : #private }
WAComplexRoute >> isOverlyComplex [
	^ isOverlyComplex
]

{ #category : #public }
WAComplexRoute >> mapArgumentsWithElements: anArrayOfStrings parameters: aDictionary into: anArray [
	| offset |
	offset := 0.
	pathMatches do: [ :each |
		each matchesJustOneElement ifFalse: [
			offset := anArrayOfStrings size - pathMatches size ].
		each mapArgumentsWithElements: anArrayOfStrings into: anArray usingOffset: offset ].
	parameterMatches do: [ :each |
		each mapArgumentsWithParameters: aDictionary into: anArray ]
]

{ #category : #testing }
WAComplexRoute >> matchesFlexibleNumberOfPathElements [
	^ self isOverlyComplex
]

{ #category : #private }
WAComplexRoute >> matchesModeratelyComplex: aCollectionOfStrings [
	
	pathMatches size = aCollectionOfStrings size
		ifFalse: [ ^ false ].
	pathMatches with: aCollectionOfStrings do: [ :match :each |
		(match matches: each)
			ifFalse: [ ^ false ] ].
	^ true
]

{ #category : #private }
WAComplexRoute >> matchesOverlyComplex: aCollectionOfStrings [
	| collectionIndex |

	pathMatches size > (aCollectionOfStrings size + 1)
		ifTrue: [ ^ false ].
	
	collectionIndex := 1.
	pathMatches keysAndValuesDo: [ :index :each |
		each matchesJustOneElement
			ifTrue: [
				(each matches: (aCollectionOfStrings at: collectionIndex))
					ifFalse: [ ^ false ].
				collectionIndex := collectionIndex + 1 ]
			ifFalse: [
				| matchEnd |
				matchEnd := aCollectionOfStrings size - (pathMatches size - index).
				collectionIndex to: matchEnd do: [ :submatchIndex |
					(each matches: (aCollectionOfStrings at: submatchIndex))
						ifFalse: [ ^ false ] ].
				collectionIndex := matchEnd + 1 ] ].

	^ true
]

{ #category : #testing }
WAComplexRoute >> matchesParameters: aDictionary [
	parameterMatches size = aDictionary size
		ifFalse: [ ^ false ].
	parameterMatches keysAndValuesDo: [ :name :match |
		| value |
		value := aDictionary at: name ifAbsent: [ ^ false ].
		(match matchesName: name value: value)
			ifFalse: [ ^ false ] ].
	^ true
]

{ #category : #testing }
WAComplexRoute >> matchesPath: aCollectionOfStrings [
	^ self isOverlyComplex
		ifTrue: [ self matchesOverlyComplex: aCollectionOfStrings  ]
		ifFalse: [ self matchesModeratelyComplex: aCollectionOfStrings ]
]

{ #category : #accessing }
WAComplexRoute >> pathElementCount [
	^ pathMatches size
]

{ #category : #printing }
WAComplexRoute >> printOn: aStream [
	super printOn: aStream.

	aStream 
		nextPutAll: ' (pathMatches: '; print: pathMatches;
		nextPutAll: ' parameterMatches: '; print: parameterMatches;
		nextPutAll: ' isOverlyComplex: '; print: self isOverlyComplex;
		nextPut: $)
]

{ #category : #accessing }
WAComplexRoute >> priority [
	^ pathMatches inject: 0 into: [ :sum :each |
		sum + each priority ]
]
