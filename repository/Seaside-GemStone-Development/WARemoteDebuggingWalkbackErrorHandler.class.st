"
Use this class as an exceptionHandler when you want the stack frame displayed on the web page, with the option to snap off a continuation that can be debugged in GemTools.

You can use this class when running separate Seaside server vms or running the adaptor in GemTools
"
Class {
	#name : #WARemoteDebuggingWalkbackErrorHandler,
	#superclass : #WAGemStoneWalkbackErrorHandler,
	#instVars : [
		'walkback'
	],
	#category : 'Seaside-GemStone-Development-Core'
}

{ #category : #initialization }
WARemoteDebuggingWalkbackErrorHandler class >> initialize [
	WAAdmin applicationExceptionHandlingDefaults at: #exceptionHandler put: self
]

{ #category : #'rendering error' }
WARemoteDebuggingWalkbackErrorHandler >> handleRenderingError: anException inProduction: inProduction [
	self requestContext respond: [ :response |
		response
			internalError;
			contentType: WAMimeType textHtml;
			nextPutAll: (self rendererClass builder
				fullDocument: true;
				rootBlock: [ :root | self updateHtmlRoot: root forException: anException ];
				render: [ :html | self renderContentForException: anException on: html inProduction: inProduction ]) ]
]

{ #category : #private }
WARemoteDebuggingWalkbackErrorHandler >> open: anException [
  | continuation action |
  GRPlatform current canDebugInteractively
    ifTrue: [ 
      (anException isKindOf: Error)
        ifFalse: [ 
          "Halt or BreakpointNotification ... see WASession>>withErrorHandler"
          anException pass ].
      ^ super open: anException ].
  action := [ :cont | 
  continuation := cont.
  #'create' ] callCC.
  action == #'create'
    ifTrue: [ 
      | wb |
      "If an error occurs trying to display the walkback component, we just use the super
			behaviour, which should be to open a debugger.."
      [ 
      self session isNil
        ifTrue: [ 
          | logEntry |
          WACurrentRequestContext value forDebugging: true.
          logEntry := WAObjectLogEntry
            error: anException description
            request: WACurrentRequestContext value request
            continuation: continuation.	"the continuation is not resumable"
          logEntry resumeContinuation.
          logEntry addToLog ]
        ifFalse: [ 
          WACurrentRequestContext value forDebugging: true.
          wb := self walkbackClass
            exception: anException
            continuation: continuation.
          self requestContext request isXmlHttpRequest
            ifTrue: [ 
              wb logContinuation: anException description.
              (self requestContext responseGenerator internalError: anException)
                respond ]
            ifFalse: [ self session presenter call: wb ].	"Exception handlers hold the request context because they are used in places where
					 the dynamic variable is not present. Since this particular class depends on RenderLoop,
		 			 however, it will be present and we need to update the stored value after doing a call."
          requestContext := WACurrentRequestContext value ] ]
        on: Error
        do: [ :err | 
          Transcript
            cr;
            show: 'Error creating WAWalkback: ' , err description.	"error depends upon whether we're using #call:onAnswer: or #call:"
          ((err isKindOf: WAUnhandledNotificationError)
            or: [ err isKindOf: WAGsInvalidCallbackContext ])
            ifTrue: [ 
              wb applicationDeployed
                ifFalse: [ wb addContinuation ].
              ^ self
                handleRenderingError: anException
                inProduction: wb applicationDeployed ] ].
      ^ self ].
  action == #'debug'
    ifTrue: [ self halt ]
]

{ #category : #'rendering error' }
WARemoteDebuggingWalkbackErrorHandler >> renderContentForException: anException on: html inProduction: inProduction [
	html heading level1; with: anException description.
	inProduction
		ifTrue: [ 
			html paragraph: 'Your request could not be completed. An exception occurred.'.
			html paragraph: 'The system administrator has been informed of this error.']
		ifFalse: [ 
			html paragraph: 'Error during rendering, a continuation containing error stack has been saved'.
			html paragraph: 'To bring up a debugger in your development image, press the Debug button in the GemStone/S Transcript window.'.
			html paragraph: [
				html strong: 'For the moment, resuming from a remote debug session is not supported' ]]
]

{ #category : #'rendering error' }
WARemoteDebuggingWalkbackErrorHandler >> rendererClass [
	^ WARenderer default
]

{ #category : #'rendering error' }
WARemoteDebuggingWalkbackErrorHandler >> titleForException: anException [
	^ anException description
]

{ #category : #'rendering error' }
WARemoteDebuggingWalkbackErrorHandler >> updateHtmlRoot: anHtmlRoot forException: anException [
	anHtmlRoot title: (self titleForException: anException)
]

{ #category : #private }
WARemoteDebuggingWalkbackErrorHandler >> walkbackClass [

	^WARemoteDebuggingWalkback
]
