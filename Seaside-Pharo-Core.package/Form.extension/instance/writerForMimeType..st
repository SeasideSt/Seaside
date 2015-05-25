*seaside-pharo-core
writerForMimeType: mimeType
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