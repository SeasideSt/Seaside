"
I am a stream that allows switching between text and binary mode. In binary mode no encoding will be done.

Instance Variables
	codecStream:		<GRCodecStream>
	socketStream:		<SocketStream>

codecStream
	- we codec stream, that does encoding

socketStream
	- we socket stream, that does no encoding

stream
	- the current stream to be used

"
Class {
	#name : #GRSwitchableStream,
	#superclass : #GRDelegatingStream,
	#instVars : [
		'codecStream',
		'socketStream'
	],
	#category : 'Seaside-Adaptors-Comanche'
}

{ #category : #'instance creation' }
GRSwitchableStream class >> onCodecStream: aCodecStream socketStream: aSocketStream [
	^ self basicNew onCodecStream: aCodecStream socketStream: aSocketStream
]

{ #category : #accessing }
GRSwitchableStream >> binary [
 	"Put the receiver into binary mode, makes it byte based"
	stream := socketStream.
	socketStream binary
]

{ #category : #streaming }
GRSwitchableStream >> crlf [
	stream crlf
]

{ #category : #streaming }
GRSwitchableStream >> next [
	^ stream next
]

{ #category : #streaming }
GRSwitchableStream >> next: anInteger [
	^ stream next: anInteger
]

{ #category : #streaming }
GRSwitchableStream >> nextPut: aCharacter [
	^ stream nextPut: aCharacter
]

{ #category : #streaming }
GRSwitchableStream >> nextPutAll: aString [
	^ stream nextPutAll: aString
]

{ #category : #initialization }
GRSwitchableStream >> onCodecStream: aCodecStream socketStream: aSocketStream [
	self initializeOn: aCodecStream.
	codecStream := aCodecStream.
	socketStream := aSocketStream
]

{ #category : #streaming }
GRSwitchableStream >> space [
	^ stream space
]

{ #category : #accessing }
GRSwitchableStream >> text [
 	"Put the receiver into text mode, makes it character based"
	stream := codecStream.
	socketStream text
]
