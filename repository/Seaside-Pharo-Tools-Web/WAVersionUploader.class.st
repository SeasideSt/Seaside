Class {
	#name : #WAVersionUploader,
	#superclass : #WAComponent,
	#instVars : [
		'file',
		'url'
	],
	#category : 'Seaside-Pharo-Tools-Web'
}

{ #category : #testing }
WAVersionUploader class >> canBeRoot [
	^ true
]

{ #category : #accessing }
WAVersionUploader class >> description [
	^ 'Monticello Browser'
]

{ #category : #initialization }
WAVersionUploader class >> initialize [
	WAAdmin register: self asApplicationAt: 'tools/versionuploader'
]

{ #category : #actions }
WAVersionUploader >> loadFile [
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
]

{ #category : #actions }
WAVersionUploader >> loadURL [
	| stream version |
	url asUrl fileName ifEmpty: [
		self inform: 'no valid URL given' onAnswer: [ ].
		^ self ].
	stream := url asUrl retrieveContents content asByteArray readStream .
	version := (MCVersionReader readerClassForFileNamed: url) versionFromStream: stream.
	version load
]

{ #category : #actions }
WAVersionUploader >> newVersion: aWorkingCopy [
	| version stream |
	version := [ aWorkingCopy newVersion ]
		on: MCVersionNameAndMessageRequest
		do: [ :request | request resume: (Array with: request suggestedName with: '') ].
	stream := RWBinaryOrTextStream on: String new.
	version fileOutOn: stream.
	self requestContext respond: [ :response |
		response
			contentType: WAMimeType applicationOctetStream;
			attachmentWithFileName: version fileName;
			nextPutAll: stream contents ]
]

{ #category : #rendering }
WAVersionUploader >> renderContentOn: html [
	self renderDownloadOn: html.
	self renderLoadFromFileOn: html.
	self renderLoadFromUrlOn: html.
	self renderSaveImageOn: html
]

{ #category : #rendering }
WAVersionUploader >> renderDownloadOn: html [
	html heading level2; with: 'Loaded versions'.
	html unorderedList: [
		self sortedWorkingCopies do: [ :each |
			html listItem: [
				html text: each description.
				html space.
				html anchor
					callback: [ self newVersion: each ];
					with: 'Save' ] ] ]
]

{ #category : #rendering }
WAVersionUploader >> renderLoadFromFileOn: html [
	html heading level2; with: 'Load version from file'.
	html form
		multipart;
		with: [
		 	html div: [
				html fileUpload
					callback: [ :f | file := f ].
				html space.
				html submitButton
					callback: [ self loadFile ];
					text: 'Load' ] ]
]

{ #category : #rendering }
WAVersionUploader >> renderLoadFromUrlOn: html [
	html heading level2; with: 'Load version from URL'.
	html form: [
		html div: [
			html textInput
				size: 60;
				value: 'http://'; callback: [ :u | url := u ].
			html space.
			html submitButton
				callback: [ self loadURL ];
				text: 'Load' ] ]
]

{ #category : #rendering }
WAVersionUploader >> renderSaveImageOn: html [
	html anchor
		callback: [ self saveImage ];
		with: 'Save Image'
]

{ #category : #actions }
WAVersionUploader >> saveImage [
	SmalltalkImage current snapshot: true andQuit: false
]

{ #category : #accessing }
WAVersionUploader >> sortedWorkingCopies [
	^ MCWorkingCopy allManagers asSortedCollection: [ :a :b | a packageName <= b packageName ]
]

{ #category : #updating }
WAVersionUploader >> updateRoot: anHtmlRoot [
	super updateRoot: anHtmlRoot.
	anHtmlRoot title: 'Version Uploader'
]
