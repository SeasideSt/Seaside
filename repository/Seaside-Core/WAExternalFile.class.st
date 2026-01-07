"
I represent a file on a file system.

I know the name, the location and the MIME type of the file. I am mainly used for representing temporary files from streamed multipart uploads.

You will probably want to move me from my initial directory (which is probably a temporary directory) to my final destination. E.g.

externalFile fullyQualifiedFilePath asFileReference moveTo: FileLocator imageDirectory / 'final-destination'
"
Class {
	#name : 'WAExternalFile',
	#superclass : 'WAAbstractFile',
	#instVars : [
		'filePath'
	],
	#category : 'Seaside-Core-HTTP',
	#package : 'Seaside-Core',
	#tag : 'HTTP'
}

{ #category : 'testing' }
WAExternalFile >> exists [

	^ GRPlatform current fileExists: self fullyQualifiedFilePath
]

{ #category : 'accessing' }
WAExternalFile >> filePath: aString [
	filePath := aString
]

{ #category : 'accessing' }
WAExternalFile >> fullyQualifiedFilePath [
	^ filePath
]

{ #category : 'accessing' }
WAExternalFile >> rawContents [
	^ GRPlatform current contentsOfFile: filePath binary: true
]

{ #category : 'accessing' }
WAExternalFile >> size [
	^ self exists
		ifTrue: [ GRPlatform current sizeOfFile: self fullyQualifiedFilePath ]
		ifFalse: [ 0 ]
]
