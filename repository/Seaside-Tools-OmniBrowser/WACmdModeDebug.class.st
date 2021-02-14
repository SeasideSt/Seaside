Class {
	#name : #WACmdModeDebug,
	#superclass : #WACmdMode,
	#category : 'Seaside-Tools-OmniBrowser-Commands'
}

{ #category : #execution }
WACmdModeDebug >> execute [
	target setDebugMode
]

{ #category : #testing }
WACmdModeDebug >> label [
	^ 'Debug'
]
