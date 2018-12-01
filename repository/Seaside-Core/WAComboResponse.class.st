"
WAComboResponse is a combination of a buffered and a streaming response. By default, WAComboResponse will buffer the entire response to be sent at the end of the request processing cycle. If streaming is desired, the response can be flushed by sending it the #flush message. Flushing a response will sent all previously buffered data using chunked transfer-encoding (which preserves persistent connections). Clients can flush the response as often as they want at appropriate points in their response generation; everything buffered up to that point will be sent. For example, a search results page might use something like:

renderContentOn: aCanvas
	""Render the search page""

	self renderSearchLabelOn: aCanvas.
	aCanvas flush. ""flush before starting search to give immediate feedback""

	self searchResultsDo:[:aResult|
		self renderSearchResultOn: aCanvas.
		aCanvas flush. ""flush after each search result""
	].

After a response has been flushed once, header modifications are no longer possible and will raise a WAIllegalStateException.

Server adaptors need to be aware that a committed response must be closed, when complete. An uncommitted response should be handled as usual by the server adapter.
"
Class {
	#name : #WAComboResponse,
	#superclass : #WAResponse,
	#instVars : [
		'bufferedStream',
		'externalStream',
		'committed',
		'closed'
	],
	#category : 'Seaside-Core-HTTP'
}

{ #category : #'instance creation' }
WAComboResponse class >> external: anExternalStream [
	^ self
		onBuffered: (GRPlatform current writeCharacterStreamOn: (String new: 4096))
		external: anExternalStream
]

{ #category : #'instance creation' }
WAComboResponse class >> onBuffered: aBufferedStream external: anExternalStream [
	^ self basicNew initializeOnBuffered: aBufferedStream external: anExternalStream
]

{ #category : #'accessing-cookies' }
WAComboResponse >> addCookie: aCookie [
	"Add aCookie to the receiver. Raise an error if the response is committed."

	self committedCheck.
	^ super addCookie: aCookie
]

{ #category : #streaming }
WAComboResponse >> binary [
	"put the response stream into binary mode"

	bufferedStream := (GRCountingStream on: (GRPlatform current readWriteByteStream)).
	externalStream binary
]

{ #category : #accessing }
WAComboResponse >> bufferedStream [
	"The stream to buffer data before sending it"

	^ bufferedStream
]

{ #category : #accessing }
WAComboResponse >> bufferedStream: aStream [
	"The stream to buffer data before sending it"

	bufferedStream := aStream
]

{ #category : #initialization }
WAComboResponse >> close [
	"Send a zero-sized chunk to end the data transfer."

	closed ifTrue: [ self error: 'Response is closed' ].
	externalStream nextPutAll: '0'; crlf; crlf; flush.
	closed := true

]

{ #category : #initialization }
WAComboResponse >> commit [
	"Begin a partial transmission"

	self committedCheck.

	"Send the http request header and set the receiver to chunked encoding"
	self headerAt: 'Transfer-Encoding' put: 'chunked'.

	committed := true.
	self writeStatusOn: externalStream.
	self writeHeadersOn: externalStream.
	self writeCookiesOn: externalStream.
	externalStream crlf; flush

]

{ #category : #errors }
WAComboResponse >> committedCheck [
	"Raises a signal if this response is already committed."

	self isCommitted 
		ifTrue: [ WAIllegalStateException signal ]
]

{ #category : #accessing }
WAComboResponse >> contents [
	"Answer the contents of the response. If the response is streaming, answer nil"

	^ committed ifFalse: [ bufferedStream contents ]
]

{ #category : #initialization }
WAComboResponse >> destroy [
	"Destroy the receiver"

	super destroy.
	bufferedStream := nil.
	externalStream := nil

]

{ #category : #accessing }
WAComboResponse >> externalStream [
	"The external (socket) stream to send data to"

	^ externalStream
]

{ #category : #accessing }
WAComboResponse >> externalStream: aSocketStream [
	"The external (socket) stream to send data to"

	externalStream := aSocketStream
]

{ #category : #public }
WAComboResponse >> flush [
	"Flush the receiver and send partial content"

	committed ifFalse: [ self commit ].

	"Write the partial content if any"
	self nextChunk: bufferedStream count put: bufferedStream contents.
	bufferedStream reset
]

{ #category : #'accessing-headers' }
WAComboResponse >> headerAt: aString append: aValue [
	"Appends a response header. Raises an error if the respone is committed."

	self committedCheck.
	^ super headerAt: aString append: aValue
]

{ #category : #'accessing-headers' }
WAComboResponse >> headerAt: aString put: aValue [
	"Sets a response header. Raises an error if the response is committed"

	self committedCheck.
	^ super headerAt: aString put: aValue
]

{ #category : #initialization }
WAComboResponse >> initialize [
	"Initialize the receiver"

	super initialize.
	bufferedStream := GRPlatform current readWriteCharacterStream.
	committed := false.
	closed := false
]

{ #category : #initialization }
WAComboResponse >> initializeOnBuffered: aBufferedStream external: anExternalStream [
	"Initialize the receiver"

	self initialize.
	bufferedStream := aBufferedStream.
	externalStream := anExternalStream.
	committed := false.
	closed := false
]

{ #category : #private }
WAComboResponse >> isChunked [
	^ (self headerAt: 'Transfer-Encoding' ifAbsent: [ nil ]) = 'chunked'
]

{ #category : #testing }
WAComboResponse >> isCommitted [
	"Return true if the response is committed, i.e., (partially) transmitted"

	^ committed
]

{ #category : #testing }
WAComboResponse >> isStreamingResponse [
	"Return true if the receiver supports partial stream responses."

	^ true
]

{ #category : #streaming }
WAComboResponse >> nextChunk: anInteger put: data [
	"Write a chunk of data to the external stream. Does NOT write if no data is provided since this would logically end the chunked transfer. To end data transfer use #close instead. Raise an error if the response has been committed and closed.
	
	Unfortunately the size of the chunk is not measured in bytes but characters so we need the ability to pass in the chunk size
	see also
	http://code.google.com/p/seaside/issues/detail?id=733"

	data isEmpty ifTrue: [ ^ self ].
	closed ifTrue: [ self error: 'Response is closed' ].

	externalStream nextPutAll: (anInteger printStringBase: 16); crlf.
	externalStream nextPutAll: data; crlf; flush

]

{ #category : #streaming }
WAComboResponse >> nextChunkPut: data [
	"Write a chunk of data to the external stream. Does NOT write if no data is provided since this would logically end the chunked transfer. To end data transfer use #close instead. Raise an error if the response has been committed and closed."

	self nextChunk: data size put: data

]

{ #category : #'accessing-headers' }
WAComboResponse >> removeHeaderAt: aString [
	"Removes all occurences of the header. Raises an error if the response is committed."

	self committedCheck.
	^ super removeHeaderAt: aString
]

{ #category : #convenience }
WAComboResponse >> resetIfPossible [
	^ committed
		ifTrue: [ false ]
		ifFalse: [
			self initializeFields.
			bufferedStream reset.
			true ]
]

{ #category : #'accessing-status' }
WAComboResponse >> status: aNumber message: aString [
	"Set the response status. Raises an error if the response is committed."

	self committedCheck.
	^ super status: aNumber message: aString
]

{ #category : #accessing }
WAComboResponse >> stream [
	"This answers the BUFFERED stream; to actually send the partial data you must #flush it"

	^ bufferedStream
]

{ #category : #writing }
WAComboResponse >> writeContentOn: aStream [
	committed ifFalse: [ 
		aStream nextPutAll: self contents ]
]

{ #category : #writing }
WAComboResponse >> writeHeadersOn: aStream [
	self isChunked ifFalse: [
		self 
		headerAt: 'Content-Length'
		put: bufferedStream position ].
	super writeHeadersOn: aStream 
]
