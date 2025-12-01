Class {
	#name : 'WACmdModeDebug',
	#superclass : 'WACmdMode',
	#category : 'Seaside-Tools-OmniBrowser-Commands',
	#package : 'Seaside-Tools-OmniBrowser',
	#tag : 'Commands'
}

{ #category : 'execution' }
WACmdModeDebug >> execute [
	target setDebugMode
]

{ #category : 'testing' }
WACmdModeDebug >> label [
	^ 'Debug'
]
