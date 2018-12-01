Class {
	#name : #WACallbackRegistry,
	#superclass : #WAObject,
	#instVars : [
		'callbacks',
		'nextKey'
	],
	#category : 'Seaside-Core-Callbacks'
}

{ #category : #accessing }
WACallbackRegistry >> advanceKey [
	| key |
	key := self nextKey.
	self increaseKey.
	^ key
]

{ #category : #processing }
WACallbackRegistry >> handle: aRequestContext [
	| set fields |
	set := Set new.
	fields := aRequestContext request fields.
	fields keysDo: [ :key |
		callbacks at: key ifPresent: [ :callback |
			(callback isEnabledFor: aRequestContext)
				ifTrue: [ set add: callback ] ] ].
	set sorted do: [ :callback |
		callback evaluateWithFieldValues:
			(fields allAt: callback key) ]
]

{ #category : #accessing }
WACallbackRegistry >> increaseKey [
	nextKey := nextKey + 1
]

{ #category : #initialization }
WACallbackRegistry >> initialize [
	super initialize.
	callbacks := Dictionary new.
	nextKey := 1
]

{ #category : #accessing }
WACallbackRegistry >> nextKey [
	^ nextKey greaseString
]

{ #category : #registration }
WACallbackRegistry >> store: aCallback [ 
	| key |
	key := self advanceKey.
	callbacks 
		at: (aCallback convertKey: key)
		put: aCallback.
	aCallback 
		setKey: key
		callbacks: callbacks.
	^ key
]
