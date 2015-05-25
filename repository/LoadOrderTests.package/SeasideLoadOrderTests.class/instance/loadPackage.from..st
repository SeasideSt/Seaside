load and test
loadPackage: aString from: aRepository

	| version repositoryGroup transcript stream |
	version := aRepository loadVersionFromFileNamed: aString.
	transcript := Transcript.
	stream := WriteStream on: String new.
	[
		Transcript := stream.
		version load.
	] ensure: [
		Transcript := transcript.
	].
	false ifTrue: [self reportToTranscript: stream contents].
	repositoryGroup := version workingCopy repositoryGroup.
	repositoryGroup addRepository: aRepository.
	Transcript cr; show: 'Loaded ' , aString.
	self showUndeclared.
	