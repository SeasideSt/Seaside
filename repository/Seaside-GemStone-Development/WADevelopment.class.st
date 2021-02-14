Class {
	#name : #WADevelopment,
	#superclass : #WABasicDevelopment,
	#category : 'Seaside-GemStone-Development-Core'
}

{ #category : #initialization }
WADevelopment class >> initialize [
	"self initialize"
	
	super initialize
]

{ #category : #private }
WADevelopment class >> workspaceContents [

	^super workspaceContents, '
"Use this handler when running production Seaside servers out of topaz vms (default)"
WAAdmin applicationExceptionHandlingDefaults 
	at: #exceptionHandler 
	put: WAGemStoneProductionErrorHandler.

"Use this handler when running Seaside server out of a GemTools vm"
WAAdmin applicationExceptionHandlingDefaults 
	at: #exceptionHandler 
	put: WAGemStoneWalkbackErrorHandler.

"Use this handler when running development Seaside servers out of topaz vms"
WAAdmin applicationExceptionHandlingDefaults 
	at: #exceptionHandler 
	put: WARemoteDebuggingWalkbackErrorHandler.
' withSqueakLineEndings
]
