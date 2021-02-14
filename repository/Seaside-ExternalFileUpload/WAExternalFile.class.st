Class {
	#name : #WAExternalFile,
	#superclass : #WAObject,
	#instVars : [
		'contentType',
		'fileName',
		'filePath'
	],
	#category : 'Seaside-ExternalFileUpload'
}

{ #category : #accessing }
WAExternalFile >> contentType [
	^ contentType
]

{ #category : #accessing }
WAExternalFile >> contentType: aMimeTypeOrString [
	contentType := aMimeTypeOrString isNil
		ifFalse: [ aMimeTypeOrString seasideMimeType ]
]

{ #category : #accessing }
WAExternalFile >> fileName [
	^ fileName
]

{ #category : #accessing }
WAExternalFile >> fileName: aString [
	fileName := aString
]

{ #category : #accessing }
WAExternalFile >> filePath: aString [
	filePath := aString
]

{ #category : #accessing }
WAExternalFile >> fullyQualifiedFilePath [
	^ filePath
]

{ #category : #accessing }
WAExternalFile >> rawContents [
	^ GRPlatform current contentsOfFile: filePath binary: true
]
