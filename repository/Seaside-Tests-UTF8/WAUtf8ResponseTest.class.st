Class {
	#name : #WAUtf8ResponseTest,
	#superclass : #WAContextTest,
	#instVars : [
		'response'
	],
	#category : 'Seaside-Tests-UTF8'
}

{ #category : #private }
WAUtf8ResponseTest >> asString: aCollectionOfIntegers [
	^ String streamContents: [ :stream |
		aCollectionOfIntegers do: [ :each |
			stream nextPut: (Character codePoint: each) ] ]
]

{ #category : #private }
WAUtf8ResponseTest >> assertLines: anArray [
	self assert: self lines = anArray
]

{ #category : #private }
WAUtf8ResponseTest >> contents [
	| stream |
	stream := WriteStream on: String new.
	self response writeOn: stream.
	^ stream contents
]

{ #category : #configuration }
WAUtf8ResponseTest >> createCodec [
	^ GRCodec forEncoding: 'utf-8'
]

{ #category : #private }
WAUtf8ResponseTest >> lines [
	"Answer the response as an array of lines, to be used within the tests."
	| result stream |
	result := OrderedCollection new.
	stream := self contents readStream.
	[ stream atEnd ] whileFalse: 
		[ result add: (stream greaseUpToAll: (String 
					with: Character cr
					with: Character lf)) ].
	^ result asArray
]

{ #category : #private }
WAUtf8ResponseTest >> response [
	^ response ifNil: [ response := WABufferedResponse new ]
]

{ #category : #tests }
WAUtf8ResponseTest >> testRedirectTo [
	| url |
	url :=  WAUrl absolute: 'http://www.seaside.st/'.
	url addToPath: self unicodeString.
	self response redirectTo: url.
	self assertLines:  #('HTTP/1.1 302 Found'
		'Location: http://www.seaside.st/%C2%A5%C2%A3%E2%82%AC%24%C2%A2%E2%82%A1%E2%82%A2%E2%82%A3%E2%82%A4%E2%82%A5%E2%82%A6%E2%82%A7%E2%82%A8%E2%82%A9%E2%82%AA%E2%82%AB%E2%82%AD%E2%82%AE%E2%82%AF'
		'Content-Length: 0' '')
]

{ #category : #private }
WAUtf8ResponseTest >> unicodeString [
	^ self asString: #(165 163 8364 36 162 8353 8354 8355 8356 8357 8358 8359 8360 8361 8362 8363 8365 8366 8367)
]
