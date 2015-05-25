actions
loadURL
	| stream version |
	url asUrl fileName ifEmpty: [
		self inform: 'no valid URL given' onAnswer: [ ].
		^ self ].
	stream := url asUrl retrieveContents content asByteArray readStream .
	version := (MCVersionReader readerClassForFileNamed: url) versionFromStream: stream.
	version load