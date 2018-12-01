Class {
	#name : #WASignalingErrorHandler,
	#superclass : #WAErrorHandler,
	#category : 'Seaside-Tests-RenderLoop'
}

{ #category : #actions }
WASignalingErrorHandler >> handleException: anException [
	WARenderNotification signal
]
