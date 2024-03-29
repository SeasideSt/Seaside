"
I deal with `.mo` files. An `.mo` file is a binary format of the `.po` file. It's a translation file that has a key-value mapping for translated text. I can load `.mo` files and once loaded I can search the key-value mapping to find the right translations.

Forked code from Gettext project: https://github.com/pharo-contributions/Gettext
"
Class {
	#name : 'WAMOFile',
	#superclass : 'Object',
	#instVars : [
		'fileName',
		'isLittleEndian',
		'revision',
		'nStrings',
		'originalTableOffset',
		'translatedTableOffset',
		'translatedStrings',
		'translations',
		'localeId'
	],
	#classInstVars : [
		'Cr',
		'Lf'
	],
	#category : 'Seaside-Gettext-Core',
	#package : 'Seaside-Gettext-Core'
}

{ #category : 'instance creation' }
WAMOFile class >> fromFileNamed: aFileName localeId: aLocaleString [
	^ self basicNew initializeFromFile: aFileName localeId: aLocaleString
]

{ #category : 'instance creation' }
WAMOFile class >> fromStream: aStream localeId: aLocaleString [
	^ self basicNew initializeFromStream: aStream localeId: aLocaleString
]

{ #category : 'public' }
WAMOFile >> atRandom [

	^ translatedStrings at: nStrings atRandom
]

{ #category : 'accessing' }
WAMOFile >> fileName [
	^ fileName
]

{ #category : 'initialization' }
WAMOFile >> initializeFromFile: aFileName localeId: aLocaleString [
	"Entry point for loading translations. All of strings are loaded. Translation strings are converted to internal string format on load time.
	Original string/index pairs are registerd to Dictionary on load time."
	self initialize.
	localeId := aLocaleString.
	fileName := aFileName.
	GRPlatform current 
		readFileStreamOn: aFileName 
		do: [ :strm | self privateLoadStream: strm ] 
		binary: true
]

{ #category : 'initialization' }
WAMOFile >> initializeFromStream: aStream localeId: aLocaleString [
	self initialize.
	localeId := aLocaleString.
	self privateLoadStream: aStream
]

{ #category : 'private' }
WAMOFile >> loadHeader: strm [
	| magic |
	magic := GRPlatform current nextUInt32: strm.
	magic = 16rDE120495 
		ifTrue: [ isLittleEndian := true ]
		ifFalse: [
			magic = 16r950412DE 
				ifTrue: [ isLittleEndian := false ]
				ifFalse: [ self error: 'invalid MO' ] ].
	revision := self nextInt32From: strm.
	nStrings := self nextInt32From: strm.
	originalTableOffset := self nextInt32From: strm.
	translatedTableOffset := self nextInt32From: strm.
]

{ #category : 'private' }
WAMOFile >> loadStringPointers: strm offset: tableOffset [
	"returns tupple { arrayOfOffsetToString . arrayOfLengthOfString }"
	| offsetTable lenTable len offset tupple |
	offsetTable := Array new: nStrings.
	lenTable := Array new: nStrings.
	GRPlatform current stream: strm position: tableOffset.
	1 to: nStrings do: [ :index |
		len := self nextInt32From: strm.
		offset := self nextInt32From: strm.
		offsetTable at: index put: offset.
		lenTable at: index put: len ].
	tupple := Array new: 2.
	tupple at: 1 put: offsetTable.
	tupple at: 2 put: lenTable.
	^ tupple
]

{ #category : 'private' }
WAMOFile >> loadStrings: strm pointers: tupple [
  | offsetTable lenTable strings encodedStream |
  encodedStream := (GRCodec forEncoding: 'utf8') decoderFor: strm.
  offsetTable := tupple first.
  lenTable := tupple second.
  strings := Array new: nStrings.
  1 to: nStrings do: [ :index | 
    | rawStr start byteLength endPos |
    start := offsetTable at: index.
    byteLength := lenTable at: index.
    endPos := start + byteLength.
    rawStr := (String new: byteLength) writeStream.
    GRPlatform current stream: encodedStream position: start.
    [ (GRPlatform current positionOfStream: encodedStream) < endPos ]
      whileTrue: [ rawStr nextPut: encodedStream next ].
    strings at: index put: rawStr contents ].
  ^ strings
]

{ #category : 'accessing' }
WAMOFile >> localeId [ 
	^ localeId
]

{ #category : 'private' }
WAMOFile >> nextInt32From: strm [
	^ isLittleEndian 
			ifTrue: [ strm nextLittleEndianNumber: 4 ]
			ifFalse: [ strm nextInt32 ]
]

{ #category : 'private' }
WAMOFile >> privateLoadStream: aStream [
	| originalTable translatedTable originalStrings |
	
	self loadHeader: aStream.
	originalTable := self loadStringPointers: aStream offset: originalTableOffset.
	translatedTable := self loadStringPointers: aStream offset: translatedTableOffset.
	originalStrings := self loadStrings: aStream pointers: originalTable.
	translatedStrings := self loadStrings: aStream pointers: translatedTable.
	translations := Dictionary new: nStrings.  
	1 to: nStrings do: [ :index |
		translations at: (originalStrings at: index) put: index ]
]

{ #category : 'accessing' }
WAMOFile >> revision [
	^ revision
]

{ #category : 'public' }
WAMOFile >> searchFor: aString [
	| index |
	index := translations at: aString ifAbsent: [ ^ nil ].
	^ translatedStrings at: index
]

{ #category : 'accessing' }
WAMOFile >> translatedStrings [
	^ translatedStrings
]

{ #category : 'public' }
WAMOFile >> translationFor: aString [ 

	aString isEmpty ifTrue: [
		^ GetTextUnsucessfulTranslationResult original: aString translation: '' ].

	^ (self searchFor: aString) 
		ifNotNil: [ :aTranslation | GetTextSucessfulTranslationResult original: aString translation: aTranslation ]
		ifNil: [ GetTextUnsucessfulTranslationResult original: aString ]
]

{ #category : 'accessing' }
WAMOFile >> translations [
	^ translations
]
