Extension { #name : #Form }

{ #category : #'*seaside-pharo-core' }
Form >> defaultMimeType [
	^ WAMimeType imageGif
]

{ #category : #'*seaside-pharo-core' }
Form >> mimeType [
	^ self defaultMimeType
]

{ #category : #'*seaside-pharo-core' }
Form >> seasideMimeDocument [
	^ self seasideMimeDocumentType: self defaultMimeType
]

{ #category : #'*seaside-pharo-core' }
Form >> seasideMimeDocumentType: aMimeType [
	"Converts the receiver to a WAMimeDocument. The argument should ideally be an instance for WAMimeType. For various crappy reasons Strings and nil are also allowed."
	
	| aStream writer |
	aStream := RWBinaryOrTextStream on: String new.
	writer := self writerForMimeType: aMimeType seasideMimeType.
	writer isNil ifTrue: [ self error: 'no writer for ', aMimeType greaseString, ' found' ].
	writer putForm: (self asFormOfDepth: 32) onStream: aStream.
	^ WAMimeDocument on: aStream contents mimeType: aMimeType
]

{ #category : #'*seaside-pharo-core' }
Form >> writerForMimeType: mimeType [
	| sub |
	mimeType main ~= 'image'
		ifTrue: [ ^ nil ]. 
	"First token is assumed to be 'image'"
	sub := mimeType sub.
	(sub = 'jpg' or: [ sub = 'jpeg' ]) ifTrue: [
		"try PluginBasedJPEGReadWriter, JPEGReadWriter2 and JPEGReadWriter"
		^ Smalltalk
			at: #PluginBasedJPEGReadWriter
			ifAbsent: [
				Smalltalk
					at: #JPEGReadWriter2
					ifAbsent: [
						Smalltalk
							at: #JPEGReadWriter
							ifAbsent: [ nil ] ] ] ].
	sub = 'png' ifTrue: [ ^ PNGReadWriter ].
	sub = 'bmp' ifTrue: [ ^ BMPReadWriter ].
	sub = 'gif' ifTrue: [ ^ GIFReadWriter ].
	^ nil
]
