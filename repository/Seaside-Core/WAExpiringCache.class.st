"
I am the abstract base class for caches that remove entries. Subclasses are intended to use to track sessions.

    Instance Variables
	maximumSize			<Integer>
	maximumRelativeAge		<Integer>
	maximumAbsoluteAge	<Integer>
	overflowAction			<Symbol>
"
Class {
	#name : #WAExpiringCache,
	#superclass : #WACache,
	#instVars : [
		'maximumSize',
		'maximumRelativeAge',
		'maximumAbsoluteAge',
		'overflowAction'
	],
	#category : 'Seaside-Core-Cache'
}

{ #category : #'instance creation' }
WAExpiringCache class >> initialSize: aSizeInteger maximumSize: aMaximumSizeInteger maximumAbsoluteAge: aMaximumAbsoluteAge maximumRelativeAge: aMaximumRelativeAge overflowAction: aOverflowActionSymbol [
	^ self basicNew
		initializeWithInitialSize: aSizeInteger maximumSize: aMaximumSizeInteger maximumAbsoluteAge: aMaximumAbsoluteAge maximumRelativeAge: aMaximumRelativeAge overflowAction: aOverflowActionSymbol;
		yourself
]

{ #category : #'instance creation' }
WAExpiringCache class >> newLikeOldCache [
	"creates a new cache configured similar to the one in Seaside <= 3.1"
	^ self initialSize: 13
		maximumSize: 0
		maximumAbsoluteAge: 0
		maximumRelativeAge: 600
		overflowAction: nil
]

{ #category : #private }
WAExpiringCache >> cacheEntryRemoved: anObject [
	(anObject respondsTo: #unregistered) ifTrue: [
		[ anObject unregistered ]
			on: Error
			do: [ "keep reaping process running" ] ]
]

{ #category : #initialization }
WAExpiringCache >> initializeWithInitialSize: aSizeInteger maximumSize: aMaximumSizeInteger maximumAbsoluteAge: aMaximumAbsoluteAge maximumRelativeAge: aMaximumRelativeAge overflowAction: aOverflowActionSymbol [
	self initialize.
	maximumSize := aMaximumSizeInteger.
	maximumAbsoluteAge := aMaximumAbsoluteAge.
	maximumRelativeAge := aMaximumRelativeAge.
	overflowAction := aOverflowActionSymbol
]

{ #category : #accessing }
WAExpiringCache >> keyAtValue: anObject ifAbsent: aBlock [
	self shouldNotImplement
]

{ #category : #removing }
WAExpiringCache >> remove: anObject [
	self shouldNotImplement
]

{ #category : #removing }
WAExpiringCache >> removeKey: aKey [
	self subclassResponsibility
]
