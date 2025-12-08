"
I am a cache that contains at most one element.
"
Class {
	#name : 'WASingleElementCache',
	#superclass : 'WACache',
	#instVars : [
		'key',
		'value'
	],
	#category : 'Seaside-WebComponents-Core',
	#package : 'Seaside-WebComponents-Core'
}

{ #category : 'accessing' }
WASingleElementCache >> at: aKey ifAbsent: aBlock [
	^ key = aKey
		ifTrue: [ value ]
		ifFalse: [ aBlock value ]
]

{ #category : 'putting' }
WASingleElementCache >> at: aKey put: anObject [
	key := aKey.
	value := anObject.
	^ anObject
]

{ #category : 'public' }
WASingleElementCache >> clear [
	key := nil.
	value := nil
]

{ #category : 'accessing' }
WASingleElementCache >> keyAtValue: anObject ifAbsent: aBlock [
	^ value = anObject
		ifTrue: [ key ]
		ifFalse: [ aBlock value ]
]

{ #category : 'enumerating' }
WASingleElementCache >> keysAndValuesDo: aTwoArgumentBlock [
	key isNil ifFalse: [
		aTwoArgumentBlock value: key value: value ]
]

{ #category : 'removing' }
WASingleElementCache >> remove: anObject [
	value = anObject ifTrue: [
		key := nil.
		value := nil ]
]

{ #category : 'accessing' }
WASingleElementCache >> size [
	^ key isNil
		ifTrue: [ 0 ]
		ifFalse: [ 1 ]
]

{ #category : 'putting' }
WASingleElementCache >> store: anObject [
	key := WAKeyGenerator current keyOfLength: self keySize.
	value := anObject.
	^ key
]
