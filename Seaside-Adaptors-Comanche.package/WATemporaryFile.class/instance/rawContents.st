accessing
rawContents
	"Reads the contents of the file into memory and returns them.
	Keep in mind that the contents will be cached into an instance variable."
	contents isNil ifTrue: [
		contents := self readStreamDo: [ :stream |
			stream contents ] ].
	^ contents