"
I am a Pharo specific JSON encoder.
"
Class {
	#name : 'JSPharoJavascriptStringEncoder',
	#superclass : 'WAPharoEncoder',
	#category : 'Javascript-Pharo-Core-Base',
	#package : 'Javascript-Pharo-Core',
	#tag : 'Base'
}

{ #category : 'private' }
JSPharoJavascriptStringEncoder class >> delegateOn: aStream [
	^ JSJavascriptStringEncoder on: aStream
]

{ #category : 'class initialization' }
JSPharoJavascriptStringEncoder class >> initialize [
	self initializeJavascriptTable
]

{ #category : 'class initialization' }
JSPharoJavascriptStringEncoder class >> initializeJavascriptTable [
	table := ByteArray new: 256 withAll: 0.
	0 to: 31 do: [ :index | 
		table 
			at: index + 1
			put: 1 ].
	table at: $" greaseInteger + 1 put: 1.
	table at: $\ greaseInteger + 1 put: 1.
	table at: $< greaseInteger + 1 put: 1.
]

{ #category : 'private' }
JSPharoJavascriptStringEncoder >> flushBuffer [

	^delegate flushBuffer
]

{ #category : 'accessing' }
JSPharoJavascriptStringEncoder >> nextPutAll: aString [
	(aString isString and: [ aString isByteString and: [ delegate bufferIsEmpty ]])
		ifTrue: [ self nextPutAllFast: aString ]
		ifFalse: [
			"slow fall back for WideStrings"
			delegate nextPutAll: aString ]
]

{ #category : 'private' }
JSPharoJavascriptStringEncoder >> nextPutAllFast: aByteString [
	| lastIndex nextIndex |
	"Encoding of $< in Javascript inside html requires to consider more than a single character.
	Therefore, we cannot use the superclass implementation and can only directly pass the string to the stream if no characters need to be encoded.
	See https://html.spec.whatwg.org/multipage/scripting.html#restrictions-for-contents-of-script-elements"
	lastIndex := 1.
	nextIndex := ByteString findFirstInString: aByteString inSet: table startingAt: lastIndex.
	nextIndex = 0 ifTrue: [ ^ stream nextPutAll: aByteString ].
	delegate nextPutAll: aByteString
]
