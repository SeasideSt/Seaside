"
A WAResponseNotification is signaled whenever the application server wants to return a response back to the client.
"
Class {
	#name : #WAResponseNotification,
	#superclass : #WANotification,
	#category : 'Seaside-Core-Exceptions'
}

{ #category : #public }
WAResponseNotification >> defaultAction [
	^ WAUnhandledNotificationError signalWithNotification: self
]

{ #category : #testing }
WAResponseNotification >> isResumable [
	^ false
]
