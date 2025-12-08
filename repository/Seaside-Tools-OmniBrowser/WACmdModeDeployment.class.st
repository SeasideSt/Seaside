Class {
	#name : 'WACmdModeDeployment',
	#superclass : 'WACmdMode',
	#category : 'Seaside-Tools-OmniBrowser-Commands',
	#package : 'Seaside-Tools-OmniBrowser',
	#tag : 'Commands'
}

{ #category : 'execution' }
WACmdModeDeployment >> execute [
	target setDeploymentMode
]

{ #category : 'testing' }
WACmdModeDeployment >> label [
	^ 'Deployment'
]
