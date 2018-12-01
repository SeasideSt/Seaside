Class {
	#name : #WARenderNotification,
	#superclass : #WANotification,
	#category : 'Seaside-Core-Exceptions'
}

{ #category : #public }
WARenderNotification >> defaultAction [
	^ WAUnhandledNotificationError signalWithNotification: self
]

{ #category : #testing }
WARenderNotification >> isResumable [
	^ false
]
