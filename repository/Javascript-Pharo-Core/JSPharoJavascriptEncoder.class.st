"
I am a Pharo specific JSON encoder.
"
Class {
	#name : 'JSPharoJavascriptEncoder',
	#superclass : 'WAPharoEncoder',
	#category : 'Javascript-Pharo-Core-Base',
	#package : 'Javascript-Pharo-Core',
	#tag : 'Base'
}

{ #category : 'private' }
JSPharoJavascriptEncoder class >> delegateOn: aStream [
	^ JSJavascriptEncoder on: aStream
]

{ #category : 'class initialization' }
JSPharoJavascriptEncoder class >> initialize [
	self initializeJavascriptTable
]

{ #category : 'class initialization' }
JSPharoJavascriptEncoder class >> initializeJavascriptTable [
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
JSPharoJavascriptEncoder >> nextPutAllFast: aByteString [
	| lastIndex nextIndex |
	"Encoding of $< in Javascript inside html requires to consider more than a single character.
	Therefore, we cannot use the superclass implementation and can only directly pass the string to the stream if no characters need to be encoded.
	See https://html.spec.whatwg.org/multipage/scripting.html#restrictions-for-contents-of-script-elements"
	lastIndex := 1.
	nextIndex := ByteString findFirstInString: aByteString inSet: table startingAt: lastIndex.
	nextIndex = 0 ifTrue: [ ^ stream nextPutAll: aByteString ].
	delegate nextPutAll: aByteString
]
