Class {
	#name : #WACallbackTest,
	#superclass : #TestCase,
	#instVars : [
		'registry',
		'log'
	],
	#category : 'Seaside-Tests-Core-Callbacks'
}

{ #category : #utilities }
WACallbackTest >> assertLog: aCollection [
	self
		assert: log asArray = aCollection asArray
		description: 'Expected ' , aCollection asArray printString , ', but got ' , log asArray printString.
	log := OrderedCollection new
]

{ #category : #utilities }
WACallbackTest >> request: aRequestFields [
	"Processes a request with the fields given in aRequestFields."
	
	| request context |
	request := WARequest new setPostFields: aRequestFields; yourself.
	context := WARequestContext request: request response: WAResponse new.
	registry handle: context
]

{ #category : #running }
WACallbackTest >> setUp [
	super setUp.
	registry := WACallbackRegistry new.
	log := OrderedCollection new
]

{ #category : #'tests-callbacks' }
WACallbackTest >> testActionCallback [
	| key1 key2 |
	key1 := registry store: (WAActionCallback on: [ log add: 1 ]).
	key2 := registry store: (WAActionCallback on: [ log add: 2 ]).

	" trigger first callback "
	self 
		should: 
			[ self request: (WARequestFields new
					at: key1
						put: nil;
					yourself) ]
		raise: WARenderNotification.
	self assertLog: #(1 ).

	" trigger second callback "
	self 
		should: 
			[ self request: (WARequestFields new
					at: key2
						put: nil;
					yourself) ]
		raise: WARenderNotification.
	self assertLog: #(2 ).

	" first callback has priority "
	self 
		should: 
			[ self request: (WARequestFields new
					at: key2
						put: nil;
					at: key1
						put: nil;
					yourself) ]
		raise: WARenderNotification.
	self assertLog: #(1 ).

	" first callback is only triggered once "
	self 
		should: 
			[ self request: (WARequestFields new
					at: key1
						put: nil;
					at: key1
						put: nil;
					yourself) ]
		raise: WARenderNotification.
	self assertLog: #(1 )
]

{ #category : #tests }
WACallbackTest >> testAdvanceKey [
	self assert: registry advanceKey = '1'.
	self assert: registry advanceKey = '2'.
	self assert: registry advanceKey = '3'
]

{ #category : #'tests-callbacks' }
WACallbackTest >> testCancelCallback [
	| keyValue keySave keyCancel |
	keyValue := registry store: (WAValueCallback on: [ :v | log add: v ]).
	keySave := registry store: (WAActionCallback on: [ log add: 'save' ]).
	keyCancel := registry store: (WACancelActionCallback on: [ log add: 'cancel' ]).

	" a save callback "
	self 
		should: 
			[ self request: (WARequestFields new
					at: keyValue
						put: 'a';
					at: keySave
						put: nil;
					yourself) ]
		raise: WARenderNotification.
	self assertLog: #('a' 'save' ).
	self 
		should: 
			[ self request: (WARequestFields new
					at: keySave
						put: nil;
					at: keyValue
						put: 'b';
					yourself) ]
		raise: WARenderNotification.
	self assertLog: #('b' 'save' ).

	" a cancel callback "
	self 
		should: 
			[ self request: (WARequestFields new
					at: keyValue
						put: 'a';
					at: keyCancel
						put: nil;
					yourself) ]
		raise: WARenderNotification.
	self assertLog: #('cancel' ).
	self 
		should: 
			[ self request: (WARequestFields new
					at: keyCancel
						put: nil;
					at: keyValue
						put: 'b';
					yourself) ]
		raise: WARenderNotification.
	self assertLog: #('cancel' )
]

{ #category : #'tests-callbacks' }
WACallbackTest >> testDefaultCallback [
	| keyValue keySave keyDefault |
	keyValue := registry store: (WAValueCallback on: [ :v | log add: v ]).
	keySave := registry store: (WAActionCallback on: [ log add: 'save' ]).
	keyDefault := registry store: (WADefaultActionCallback on: [ log add: 'default' ]).

	" a save callback "
	self 
		should: 
			[ self request: (WARequestFields new
					at: keyValue
						put: 'a';
					at: keySave
						put: nil;
					at: keyDefault
						put: nil;
					yourself) ]
		raise: WARenderNotification.
	self assertLog: #('a' 'save' ).
	self 
		should: 
			[ self request: (WARequestFields new
					at: keyDefault
						put: nil;
					at: keySave
						put: nil;
					at: keyValue
						put: 'b';
					yourself) ]
		raise: WARenderNotification.
	self assertLog: #('b' 'save' ).

	" a default callback "
	self 
		should: 
			[ self request: (WARequestFields new
					at: keyValue
						put: 'a';
					at: keyDefault
						put: nil;
					yourself) ]
		raise: WARenderNotification.
	self assertLog: #('a' 'default' ).
	self 
		should: 
			[ self request: (WARequestFields new
					at: keyDefault
						put: nil;
					at: keyValue
						put: 'b';
					yourself) ]
		raise: WARenderNotification.
	self assertLog: #('b' 'default' )
]

{ #category : #'tests-callbacks' }
WACallbackTest >> testDispatchCallback [
	| key key1 key2 |
	key := registry store: WADispatchCallback new.
	key1 := registry store: (WAValueCallback on: 
			[ :v | log add: 1; add: v ]).
	key2 := registry store: (WAValueCallback on: 
			[ :v | log add: 2; add: v ]).

	" an empty callback "
	self 
		shouldnt: 
			[ self request: (WARequestFields new
					at: key put: nil;
					yourself) ]
		raise: WARenderNotification.
	self assertLog: #().

	" another empty callback "
	self 
		shouldnt: 
			[ self request: (WARequestFields new
					at: key put: '';
					yourself) ]
		raise: WARenderNotification.
	self assertLog: #().

	" the first callback "
	self 
		shouldnt: 
			[ self request: (WARequestFields new
					at: key put: key1;
					yourself) ]
		raise: WARenderNotification.
	self assertLog: #(1 '' ).

	" the second callback "
	self 
		shouldnt: 
			[ self request: (WARequestFields new
					at: key put: key2;
					yourself) ]
		raise: WARenderNotification.
	self assertLog: #(2 '' ).
	
	" a double callback "
	self 
		shouldnt: 
			[ self request: (WARequestFields new
					at: key put: key2;
					at: key put: key2;
					yourself) ]
		raise: WARenderNotification.
	self assertLog: #(2 '' )
]

{ #category : #'tests-callbacks' }
WACallbackTest >> testImageCallback [
	| key |
	key := registry store: (WAImageCallback on: [ log add: 1 ]).

	" an invalid callback "
	self 
		shouldnt: [
			self request: (WARequestFields new
				at: key
				put: nil;
				yourself) ]
		raise: WARenderNotification.
	self assertLog: #().

	" a valid callback "
	self 
		should:  [
			self request: (WARequestFields new
				at: key , '.x'
				put: nil;
				yourself) ]
		raise: WARenderNotification.
	self assertLog: #(1)
]

{ #category : #'tests-callbacks' }
WACallbackTest >> testMapCallback [
	| key |
	key := registry store: (WAMapCallback on: [ :v | log add: v ]).

	" valid "
	self 
		shouldnt: 
			[ self request: (WARequestFields new
					at: key
						put: '?1,2';
					yourself) ]
		raise: WARenderNotification.
	self assertLog: (Array with: 1 @ 2).

	" valid "
	self 
		shouldnt: 
			[ self request: (WARequestFields new
					at: key
						put: '?1,23';
					yourself) ]
		raise: WARenderNotification.
	self assertLog: (Array with: 1 @ 23).

	" valid "
	self 
		shouldnt: 
			[ self request: (WARequestFields new
					at: key
						put: '?12,34';
					yourself) ]
		raise: WARenderNotification.
	self assertLog: (Array with: 12 @ 34).

	" invalid: no value "
	self 
		shouldnt: 
			[ self request: (WARequestFields new
					at: key
						put: nil;
					yourself) ]
		raise: WARenderNotification.
	self assertLog: #().

	" invalid: empty string "
	self 
		shouldnt: 
			[ self request: (WARequestFields new
					at: key
						put: '';
					yourself) ]
		raise: WARenderNotification.
	self assertLog: #().

	" invalid: invalid syntax "
	self 
		shouldnt: 
			[ self request: (WARequestFields new
					at: key
						put: '1,2';
					yourself) ]
		raise: WARenderNotification.
	self assertLog: #().

	" invalid: invalid syntax "
	self 
		shouldnt: 
			[ self request: (WARequestFields new
					at: key
						put: '?1';
					yourself) ]
		raise: WARenderNotification.
	self assertLog: #().

	" invalid: invalid syntax "
	self 
		shouldnt: 
			[ self request: (WARequestFields new
					at: key
						put: '?1,';
					yourself) ]
		raise: WARenderNotification.

	" invalid: invalid syntax "
	self 
		shouldnt: 
			[ self request: (WARequestFields new
					at: key
						put: '?1x2';
					yourself) ]
		raise: WARenderNotification.
	self assertLog: #().

	" invalid: invalid syntax "
	self 
		shouldnt: 
			[ self request: (WARequestFields new
					at: key
						put: '?a,b';
					yourself) ]
		raise: WARenderNotification.
	self assertLog: #()
]

{ #category : #'tests-callbacks' }
WACallbackTest >> testMultiValuesCallback [
	| key key1 key2 dict |
	dict := Dictionary new.
	key1 := '1'.
	key2 := '2'.
	dict at: key1 greaseInteger put: '1a'.
	dict at: key2 greaseInteger put: '2a'.
	key := registry store: (WAMultipleValuesCallback
				on: [ :v | log := v ]
				values: dict).

	"an empty callback"
	self
		shouldnt: [
			self request: (WARequestFields new
				at: key put: nil;
				yourself) ]
		raise: WARenderNotification.
	self assert: log isEmpty.
	
	" another empty callback "
	self 
		shouldnt: [
			self request: (WARequestFields new
				at: key put: '';
				yourself) ]
		raise: WARenderNotification.
	self assert: log isEmpty.
	
	" the first callback "
	self 
		shouldnt: [
			self request: (WARequestFields new
				at: key put: key1;
				yourself) ]
		raise: WARenderNotification.
	self assertLog: #( '1a' ).
	
	" the second callback "
	self 
		shouldnt: [
			self request: (WARequestFields new
				at: key add: key1;
				at: key add: key2;
				yourself) ]
		raise: WARenderNotification.
	self assertLog: #('1a' '2a' )


]

{ #category : #tests }
WACallbackTest >> testNextKey [
	self assert: registry nextKey = '1'.
	registry increaseKey.
	self assert: registry nextKey = '2'.
	self assert: registry nextKey = '2'
]

{ #category : #'tests-callbacks' }
WACallbackTest >> testUploadCallback [
	| key file |
	key := registry store: (WAUploadCallback on: [ :v | log add: v ]).

	" nil uploads are ignored "
	self 
		shouldnt: 
			[ self request: (WARequestFields new
					at: key
						put: nil;
					yourself) ]
		raise: WARenderNotification.
	self assertLog: #().

	" string uploads are ignored "
	self 
		shouldnt: 
			[ self request: (WARequestFields new
					at: key
						put: 'foo';
					yourself) ]
		raise: WARenderNotification.
	self assertLog: #().

	" WAFile uploads are triggered "
	self 
		shouldnt: 
			[ self request: (WARequestFields new
					at: key
						put: (file := WAFile new);
					yourself) ]
		raise: WARenderNotification.
	self assertLog: (Array with: file)
]

{ #category : #'tests-callbacks' }
WACallbackTest >> testValueCallback [
	| key1 key2 |
	key1 := registry store: (WAValueCallback on: 
			[ :v | log add: 1; add: v ]).
	key2 := registry store: (WAValueCallback on: 
			[ :v | log add: 2; add: v ]).

	" a single value callback with nil "
	self 
		shouldnt: 
			[ self request: (WARequestFields new
					at: key1 put: nil;
					yourself) ]
		raise: WARenderNotification.
	self assertLog: #(1 '' ).

	" a single value callback with an empty string "
	self 
		shouldnt: 
			[ self request: (WARequestFields new
					at: key1 put: '';
					yourself) ]
		raise: WARenderNotification.
	self assertLog: #(1 '' ).

	" a single value callback with a string "
	self 
		shouldnt: 
			[ self request: (WARequestFields new
					at: key1 put: 'foo';
					yourself) ]
		raise: WARenderNotification.
	self assertLog: #(1 'foo' ).

	" a single value callback with a filled collection "
	self 
		shouldnt: 
			[ self request: (WARequestFields new
					at: key1 add: 'foo';
					at: key1 add: 'bar';
					yourself) ]
		raise: WARenderNotification.
	self assertLog: #(1 'foo' ).

	" two callbacks in order "
	self 
		shouldnt: 
			[ self request: (WARequestFields new
					at: key1 put: 'b';
					at: key2 put: 'c';
					yourself) ]
		raise: WARenderNotification.
	self assertLog: #(1 'b' 2 'c' ).

	" two callbacks not in order "
	self 
		shouldnt: 
			[ self request: (WARequestFields new
					at: key2 put: 'c';
					at: key1 put: 'b';
					yourself) ]
		raise: WARenderNotification.
	self assertLog: #(1 'b' 2 'c' )
]

{ #category : #'tests-callbacks' }
WACallbackTest >> testValuesCallback [
	| key key1 key2 dict |
	dict := Dictionary new.
	key1 := '1'.
	key2 := '2'.
	dict at: key1 greaseInteger put: '1a'.
	dict at: key2 greaseInteger put: '2a'.
	key := registry store: (WAValuesCallback
		on: [ :v | log add: v ]
		values: dict).

	"an empty callback"
	self 
		shouldnt: [
			self request: (WARequestFields new
				at: key
				put: nil;
				yourself) ]
		raise: WARenderNotification.
	self assertLog: #().
	
	" another empty callback "
	self 
		shouldnt: [
			self request: (WARequestFields new
				at: key
				put: '';
			yourself) ]
		raise: WARenderNotification.
	self assertLog: #().
	
	" the first callback "
	self shouldnt: [
		self request: (WARequestFields new
			at: key
			put: key1;
			yourself) ]
		raise: WARenderNotification.
	self assertLog: #( '1a' ).
	
	" the second callback "
	self 
		shouldnt: [
			self request: (WARequestFields new
				at: key
				put: key2;
				yourself) ]
		raise: WARenderNotification.
	self assertLog: #( '2a' )


]
