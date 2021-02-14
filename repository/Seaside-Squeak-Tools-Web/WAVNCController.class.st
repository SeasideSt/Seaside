Class {
	#name : #WAVNCController,
	#superclass : #WAComponent,
	#category : 'Seaside-Squeak-Tools-Web'
}

{ #category : #testing }
WAVNCController class >> canBeRoot [
	^ true
]

{ #category : #accessing }
WAVNCController class >> description [
	^ 'VNC Controller'
]

{ #category : #initialization }
WAVNCController class >> initialize [
	(Smalltalk hasClassNamed: #RFBServer)
		ifTrue: [ WAAdmin register: self asApplicationAt: 'tools/vnc' ]
]

{ #category : #accessing }
WAVNCController >> currentDisplay [
	^ self serverInstance displayNumber greaseString
]

{ #category : #testing }
WAVNCController >> isServerRunning [
	^ self serverInstance isRunning
]

{ #category : #rendering }
WAVNCController >> renderContentOn: html [
	html heading: 'VNC Server'.
	self isServerRunning
		ifTrue: [ self renderStopOn: html ]
		ifFalse: [ self renderStartOn: html ].
	html heading: 'UI Process'.
	self uiProcess isSuspended
		ifFalse: [ self renderSuspendOn: html ]
		ifTrue: [ self renderResumeOn: html ]
]

{ #category : #rendering }
WAVNCController >> renderResumeOn: html [
	html form: [
		html text: 'UI Process is suspended. '.
		html submitButton
			callback: [ self resume ];
			text: 'Resume' ]
]

{ #category : #rendering }
WAVNCController >> renderStartOn: html [ 
	html form: 
		[ html text: 'Start VNC on display: '.
		html textInput
			value: 0;
			callback: [ :value | self startOn: value greaseInteger ].
		html submitButton text: 'Start' ]
]

{ #category : #rendering }
WAVNCController >> renderStopOn: html [
	html form: [
		html text: 'Stop VNC (running on ', self currentDisplay, ') '.
		html submitButton
			callback: [ self stop ];
			text: 'Stop' ]
]

{ #category : #rendering }
WAVNCController >> renderSuspendOn: html [
	html form: [
		html text: 'UI Process is running. '.
		html submitButton
			callback: [ self suspend ];
			text: 'Suspend' ]
]

{ #category : #actions }
WAVNCController >> resume [
	self uiProcess resume
]

{ #category : #accessing }
WAVNCController >> serverClass [
	^ Smalltalk classNamed: #RFBServer
]

{ #category : #accessing }
WAVNCController >> serverInstance [
	^ self serverClass server
]

{ #category : #actions }
WAVNCController >> startOn: aNumber [
	self resume.
	self serverClass start: aNumber
]

{ #category : #actions }
WAVNCController >> stop [
	self serverClass stop
]

{ #category : #actions }
WAVNCController >> suspend [
	self uiProcess suspend.
	self stop
]

{ #category : #accessing }
WAVNCController >> uiProcess [
	^ UIManager default uiProcess
]
