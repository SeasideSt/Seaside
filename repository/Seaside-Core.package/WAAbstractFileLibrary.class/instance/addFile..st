actions
addFile: aFile 
	"adds a file to the receiver

	aFile an instance of of WAFile"
	| contents |
	aFile isNil ifTrue: [
		"in case no file was selected for uploading"
		^ self ].
	contents := (aFile contentType isNil or: [ aFile contentType isBinary ])
		ifTrue: [ aFile rawContents ]
		ifFalse: [
			GRPlatform current convertToSmalltalkNewlines: (aFile contentType charSet isNil
				ifTrue: [ aFile rawContents ]
				ifFalse: [ aFile contentsDecoded ]) ].
	self class 
		addFileNamed: aFile fileName
		contents: contents