*seaside-pharo-core
seasideMimeDocumentType: aMimeType
	"Converts the receiver to a WAMimeDocument. The argument should ideally be an instance for WAMimeType. For various crappy reasons Strings and nil are also allowed."
	
	| aStream writer |
	aStream := RWBinaryOrTextStream on: String new.
	writer := self writerForMimeType: aMimeType seasideMimeType.
	writer isNil ifTrue: [ self error: 'no writer for ', aMimeType greaseString, ' found' ].
	writer putForm: (self asFormOfDepth: 32) onStream: aStream.
	^ WAMimeDocument on: aStream contents mimeType: aMimeType