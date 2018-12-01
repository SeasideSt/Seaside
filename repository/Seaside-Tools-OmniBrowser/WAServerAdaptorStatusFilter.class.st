Class {
	#name : #WAServerAdaptorStatusFilter,
	#superclass : #OBFilter,
	#category : 'Seaside-Tools-OmniBrowser'
}

{ #category : #filtering }
WAServerAdaptorStatusFilter >> icon: aSymbol forNode: aNode [
	aNode isStopped ifTrue: [ ^ #seasideAdaptorStopped ].
	aNode isRunning ifTrue: [ ^ #seasideAdaptorRunning ].
	^ #blank
]
