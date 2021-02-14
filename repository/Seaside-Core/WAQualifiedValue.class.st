"
A WAQualifiedValue is an Object with an assigned quality value.

Instance Variables
	quality:		<Float>
	value:		<Object>

quality
	- between 0.0 and 1.0 or Float infinity if no value is given

value
	- the qualified object
"
Class {
	#name : #WAQualifiedValue,
	#superclass : #WAObject,
	#instVars : [
		'value',
		'quality'
	],
	#category : 'Seaside-Core-HTTP'
}

{ #category : #'instance creation' }
WAQualifiedValue class >> fromString: aString [
	^ Array streamContents: [ :stream |
		GRPlatform subStringsIn: aString splitBy: $, do: [ :each |
			| value quality semicolonIndex |
			quality := 1.0. "default value according to spec"
			semicolonIndex := each indexOf: $;.
			semicolonIndex = 0
				ifTrue: [
					value := self valueClass fromString: each trimBoth ]
				ifFalse: [
					| parameters |
					parameters := nil.
					value := self valueClass fromString: (each copyFrom: 1 to: semicolonIndex - 1) trimBoth.
					GRPlatform subStringsIn: (each copyFrom: semicolonIndex + 1 to: each size) splitBy: $; do: [ :parameter |
						| key parameterValue |
						key := (parameter copyUpTo: $=) trimBoth.
						parameterValue := (parameter copyAfter: $=) trimBoth.
						key = 'q'
							ifTrue: [
								parameterValue first = $. ifTrue: [
									"work around for Issue 655
									some user agents send '.2' instead of '2.0'"
									parameterValue := '0', parameterValue ].
								quality := Float readFrom: parameterValue readStream ]
							ifFalse: [
								parameters isNil ifTrue: [
									parameters := GRSmallDictionary2 new ].
								parameters at: key put: parameterValue ] ].
					(parameters isNil not and: [ value respondsTo: #parameters: ]) ifTrue: [
						"only WAMimeType actually supports parameters"
						value parameters: parameters ] ].
			stream nextPut: (self value: value quality: quality) ] ]
]

{ #category : #'instance creation' }
WAQualifiedValue class >> value: anObject quality: aFloat [
	^ self new
		value: anObject;
		quality: aFloat;
		yourself
]

{ #category : #private }
WAQualifiedValue class >> valueClass [
	self subclassResponsibility
]

{ #category : #comparing }
WAQualifiedValue >> <= other [
	^ self quality <= other quality
]

{ #category : #printing }
WAQualifiedValue >> printOn: aStream [
	super printOn: aStream.
	aStream
		nextPut: $(;
		print: value;
		nextPutAll: ',q=';
		print: quality;
		nextPut: $)
]

{ #category : #accessing }
WAQualifiedValue >> quality [
	^ quality
]

{ #category : #accessing }
WAQualifiedValue >> quality: aFloat [
	quality := aFloat
]

{ #category : #accessing }
WAQualifiedValue >> value [
	^ value
]

{ #category : #accessing }
WAQualifiedValue >> value: anObject [
	value := anObject
]
