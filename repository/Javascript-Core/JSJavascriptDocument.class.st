"
I add the possibility to generate JSON.
"
Class {
	#name : 'JSJavascriptDocument',
	#superclass : 'WADocument',
	#instVars : [
		'javascripEncoder',
		'urlEncoder'
	],
	#category : 'Javascript-Core-Base',
	#package : 'Javascript-Core',
	#tag : 'Base'
}

{ #category : 'writing' }
JSJavascriptDocument >> assignment [
	stream nextPut: $=
]

{ #category : 'writing' }
JSJavascriptDocument >> beginString [
	stream nextPut: $"
]

{ #category : 'writing' }
JSJavascriptDocument >> closeArray [
	stream nextPut: $]
]

{ #category : 'writing' }
JSJavascriptDocument >> closeBlock [
	stream nextPut: $}
]

{ #category : 'writing' }
JSJavascriptDocument >> closeBracket [
	stream nextPut: $]
]

{ #category : 'writing' }
JSJavascriptDocument >> closeObject [
	stream nextPut: $}
]

{ #category : 'writing' }
JSJavascriptDocument >> dotProperty: aString [
	stream nextPut: $..
	self identifier: aString
]

{ #category : 'writing' }
JSJavascriptDocument >> encodeURIComponent [
	stream nextPutAll: 'encodeURIComponent'
]

{ #category : 'writing' }
JSJavascriptDocument >> endString [
	stream nextPut: $"
]

{ #category : 'writing' }
JSJavascriptDocument >> identifier: aString [
	stream nextPutAll: aString
]

{ #category : 'writing' }
JSJavascriptDocument >> infinity [
	stream nextPutAll: 'Infinity'
]

{ #category : 'initialization' }
JSJavascriptDocument >> initializeWithStream: aStream codec: aCodec [
	super initializeWithStream: aStream codec: aCodec.
	javascripEncoder := GRPlatform current javascriptEncoderOn: aStream.
	urlEncoder := GRPlatform current urlEncoderOn: aStream codec: aCodec.
]

{ #category : 'writing' }
JSJavascriptDocument >> javascript: aCodeString [
	"write given Javascript code verbatim"
	stream nextPutAll: aCodeString
]

{ #category : 'writing' }
JSJavascriptDocument >> keyword: aString [
	javascripEncoder nextPutAll: aString.
	javascripEncoder nextPut: Character space
]

{ #category : 'writing' }
JSJavascriptDocument >> nan [
	stream nextPutAll: 'NaN'
]

{ #category : 'writing' }
JSJavascriptDocument >> negation [
	stream nextPut: $!
]

{ #category : 'writing' }
JSJavascriptDocument >> negativeInfinity [
	stream nextPutAll: '-Infinity'
]

{ #category : 'writing' }
JSJavascriptDocument >> null [
	stream nextPutAll: 'null'
]

{ #category : 'writing' }
JSJavascriptDocument >> openArray [
	stream nextPut: $[
]

{ #category : 'writing' }
JSJavascriptDocument >> openBlock [
	stream nextPut: ${
]

{ #category : 'writing' }
JSJavascriptDocument >> openBracket [
	stream nextPut: $[
]

{ #category : 'writing' }
JSJavascriptDocument >> openObject [
	stream nextPut: ${
]

{ #category : 'writing' }
JSJavascriptDocument >> operator: aString [
	stream nextPutAll: aString
]

{ #category : 'writing' }
JSJavascriptDocument >> separator [
	stream nextPut: $;
]

{ #category : 'writing' }
JSJavascriptDocument >> string: aString [
	stream nextPut: $".
	javascripEncoder nextPutAll: aString.
	stream nextPut: $"
]

{ #category : 'writing' }
JSJavascriptDocument >> urlEncode: aString [
	urlEncoder nextPutAll: aString
]
