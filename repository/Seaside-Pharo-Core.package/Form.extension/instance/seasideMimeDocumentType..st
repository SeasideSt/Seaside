*Seaside-Pharo-Core
seasideMimeDocumentType: aMimeType
	"Converts the receiver to a WAMimeDocument. The argument should ideally be an instance for WAMimeType. For various crappy reasons Strings and nil are also allowed."
	
	| writer content |
	writer := self writerForMimeType: aMimeType seasideMimeType.
	writer isNil ifTrue: [ self error: 'no writer for ', aMimeType greaseString, ' found' ].
	content := ByteArray streamContents: [ :stream |
		writer putForm: (self asFormOfDepth: 32) onStream: stream ].
	^ WAMimeDocument on: content mimeType: aMimeType