actions
loadFile
	| reader version |
	file ifNil: [
		self inform: 'no file selected' onAnswer: [ ].
		^ self ].
	reader := MCVersionReader readerClassForFileNamed: file fileName.
	reader ifNil: [
		self inform: file fileName, ' is not in a known format' onAnswer: [ ].
		^ self ].
	version := reader versionFromStream: file contents asByteArray readStream.
	version load