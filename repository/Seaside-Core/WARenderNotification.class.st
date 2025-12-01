Class {
	#name : 'WARenderNotification',
	#superclass : 'WANotification',
	#category : 'Seaside-Core-Exceptions',
	#package : 'Seaside-Core',
	#tag : 'Exceptions'
}

{ #category : 'public' }
WARenderNotification >> defaultAction [
	^ WAUnhandledNotificationError signalWithNotification: self
]

{ #category : 'testing' }
WARenderNotification >> isResumable [
	^ false
]
