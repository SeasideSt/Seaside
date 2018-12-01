"
I represent a file that was uploaded by the user via #fileInput. Compared to WAFile my contents are not stored in memory on disk in a temporary file. I support the same protocol as WAFile.

Instance Variables
	fileSize:		<Integer>
	temporaryFileName:		<String>

fileSize
	- the file size in bytes

temporaryFileName
	- the name of the file in which my contents are stored on disk
"
Class {
	#name : #WATemporaryFile,
	#superclass : #WAFile,
	#instVars : [
		'temporaryFileName',
		'fileSize'
	],
	#category : 'Seaside-Adaptors-Comanche'
}

{ #category : #actions }
WATemporaryFile >> delete [
	"deletes the uploaded file from the disk"
	self temporaryDirectory deleteFileNamed: self temporaryFileName
]

{ #category : #testing }
WATemporaryFile >> isTemporary [
	"this is not an in memory but an in temporary file"

	^ true
]

{ #category : #accessing }
WATemporaryFile >> rawContents [
	"Reads the contents of the file into memory and returns them.
	Keep in mind that the contents will be cached into an instance variable."
	contents isNil ifTrue: [
		contents := self readStreamDo: [ :stream |
			stream contents ] ].
	^ contents
]

{ #category : #initialization }
WATemporaryFile >> readFromChunk: aChunk [
	"This is where we actually read the file contents chunk wise
	and save it to disk."

	| stream |
	self contentType: aChunk contentType seasideMimeType.
	stream := StandardFileStream newFileNamed: (self temporaryDirectory fullNameFor: self temporaryFileName).
	fileSize := [ stream binary.
		aChunk saveToStream: stream ]
			ensure: [ stream close ]
]

{ #category : #actions }
WATemporaryFile >> readStreamDo: aOneArgumentBlock [
	"Convenience method to access a read stream on the contents. The read stream will be passed to the block.
	the stream will be in binary mode
	the stream will be closed afterwards"
	| stream |
	stream := self temporaryDirectory readOnlyFileNamed: self temporaryFileName.
	^ [	stream binary.
		aOneArgumentBlock value: stream ]
			ensure: [ stream close ]
]

{ #category : #accessing }
WATemporaryFile >> size [
	"the file size in bytes"

	^ fileSize
]

{ #category : #accessing }
WATemporaryFile >> temporaryDirectory [
	"the directory in which the file is located in which my contents are stored on the server"

	^ (FileDirectory default directoryNamed: 'seasidetmp') assureExistence
]

{ #category : #accessing }
WATemporaryFile >> temporaryFileName [
	"Answer the name of the file in which my contents are stored in the directory #temporaryDirectory.
	
	Don't confuse this with #fileName which is the name of the file that the client sent."
	^ temporaryFileName ifNil: [ temporaryFileName := WAKeyGenerator current keyOfLength: 48 ]
]
