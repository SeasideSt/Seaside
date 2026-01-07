Class {
	#name : 'WASignalingErrorHandler',
	#superclass : 'WAErrorHandler',
	#category : 'Seaside-Tests-RenderLoop',
	#package : 'Seaside-Tests-RenderLoop'
}

{ #category : 'actions' }
WASignalingErrorHandler >> handleException: anException [
	WARenderNotification signal
]
