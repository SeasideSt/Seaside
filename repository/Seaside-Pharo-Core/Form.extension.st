Extension { #name : #Form }

{ #category : #'*Seaside-Pharo-Core' }
Form >> defaultMimeType [
	^ WAMimeType imagePng
]

{ #category : #'*Seaside-Pharo-Core' }
Form >> mimeType [
	^ self defaultMimeType
]

{ #category : #'*Seaside-Pharo-Core' }
Form >> seasideMimeDocument [
	^ self seasideMimeDocumentType: self defaultMimeType
]

{ #category : #'*Seaside-Pharo-Core' }
Form >> seasideMimeDocumentType: aMimeType [
	"Converts the receiver to a WAMimeDocument. The argument should ideally be an instance for WAMimeType. For various crappy reasons Strings and nil are also allowed."
	
	| aStream writer |
	aStream := GRPlatform current readWriteByteStream.
	writer := self writerForMimeType: aMimeType seasideMimeType.
	writer isNil ifTrue: [ self error: 'no writer for ', aMimeType greaseString, ' found' ].
	writer putForm: (self asFormOfDepth: 32) onStream: aStream.
	^ WAMimeDocument on: aStream contents mimeType: aMimeType
]

{ #category : #'*Seaside-Pharo-Core' }
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
