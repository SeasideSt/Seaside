Class {
	#name : #WARemoteDebuggingWalkback,
	#superclass : #WAGemStoneWalkback,
	#instVars : [
		'continuation',
		'logEntry'
	],
	#category : 'Seaside-GemStone-Development-Core'
}

{ #category : #'instance creation' }
WARemoteDebuggingWalkback class >> exception: anException continuation: aContinuation [
	^ self new initializeWithException: anException continuation: aContinuation
]

{ #category : #actions }
WARemoteDebuggingWalkback >> addContinuation [
  continuation == nil
    ifTrue: [ ^ self ].
  logEntry := WAObjectLogEntry
    error: exception description
    request: self session requestContext request
    continuation: continuation.
  self applicationDeployed
    ifTrue: [ 
      "when in deployment mode, the logEntry is not resumable"
      logEntry resumeContinuation ].
  logEntry addToLog.
  continuation := nil
]

{ #category : #accessing }
WARemoteDebuggingWalkback >> applicationDeployed [
	"Answer true if you don't want the remote debugging window to show up"
	^false
]

{ #category : #initialization }
WARemoteDebuggingWalkback >> initializeWithException: anException continuation: aContinuation [

	self initializeWithException: anException.
	continuation := aContinuation.
	self applicationDeployed
		ifTrue: [ self addContinuation ].
]

{ #category : #actions }
WARemoteDebuggingWalkback >> logContinuation: title [
  "log stack to gem log and call addContinuation"

  | stream stack |
  continuation == nil
    ifTrue: [ ^ self ].
  stack := GsProcess stackReportToLevel: self stackReportLimit.
  stream := WriteStream on: String new.
  stream nextPutAll: '----------- ' , title , ' ' , DateAndTime now printString.
  stream lf.
  stream nextPutAll: exception description.
  stream lf.
  stream nextPutAll: stack.
  stream nextPutAll: '-----------'.
  stream lf.
  GsFile gciLogServer: stream contents.
  self addContinuation
]

{ #category : #rendering }
WARemoteDebuggingWalkback >> renderContentOn: html [

	self applicationDeployed
		ifTrue: ["Production"
			^self renderProductionContentOn: html].
	"Development"
	continuation == nil 
		ifTrue: [
			self renderHeadingOn: html.
			self renderInstructionsOn: html]
		ifFalse: [ super renderContentOn: html ]
]

{ #category : #rendering }
WARemoteDebuggingWalkback >> renderInstructionsOn: html [

	html paragraph: [
		html text: 'To bring up a debugger in your development image, press the Debug button in the GemStone/S Transcript window.'].
	true
		ifTrue: [ 
			html paragraph: [
				html strong: 'For the moment, resuming from a remote debug session is not supported' ].
			^self ].
	html paragraph: [
		html anchor
			callback: [ self resumeContinuation ];
			title: 'Resume from remote debugger.';
			with: 'Resume']
]

{ #category : #rendering }
WARemoteDebuggingWalkback >> renderProductionContentOn: html [

	html paragraph: [
		html text: 'The system administrator has been informed of this error.']
]

{ #category : #rendering }
WARemoteDebuggingWalkback >> renderToolsOn: html [
	html paragraph: [
		continuation ~~ nil 
			ifTrue: [
				html anchor
					callback: [ self addContinuation ];
				title: 'Put copy of process in queue for remote debugging';
				with: 'Remote Debug']
			ifFalse: [html strong: 'Already submitted for remote debugging'].
		self exception isResumable ifTrue: [
			html space.
			html anchor
				callback: [ self answer: false ];
				with: 'Proceed' ].
		limit < frames size ifTrue: [
			html space.
			html anchor
				callback: [ limit := frames size ];
				with: 'Full Stack' ] ]
]

{ #category : #actions }
WARemoteDebuggingWalkback >> resumeContinuation [

	logEntry == nil
		ifTrue: [ 
			self inform: 'No process to resume'.
			^false ].
	logEntry resumption == nil
		ifTrue: [ self inform: 'Remote continuation not ''continued'' yet' ]
		ifFalse: [ | proc |
			logEntry isResumed
				ifTrue: [ 
					self inform: 'Remote continuation has already resumed.'.
					^false ].
			proc := logEntry resumption.
			logEntry resumeContinuation.
			proc == proc _continue ifTrue: [ proc _continue ]].
	^false
]

{ #category : #accessing }
WARemoteDebuggingWalkback >> stackReportLimit [
  ^ 300
]

{ #category : #accessing }
WARemoteDebuggingWalkback >> states [

	^{ self }
]
