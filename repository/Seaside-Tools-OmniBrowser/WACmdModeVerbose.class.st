Class {
	#name : #WACmdModeVerbose,
	#superclass : #WACmdMode,
	#category : 'Seaside-Tools-OmniBrowser-Commands'
}

{ #category : #execution }
WACmdModeVerbose >> execute [
	target setVerboseMode
]

{ #category : #testing }
WACmdModeVerbose >> label [
	^ 'Verbose'
]
