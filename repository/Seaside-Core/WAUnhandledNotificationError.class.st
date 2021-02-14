"
Seaside has several Notifications that signal the desire to end the current attempt to process a request. These Notification must be handled as they are not resumable or continuable. If those Notifications are not handled, their default actions are to signal this error.
"
Class {
	#name : #WAUnhandledNotificationError,
	#superclass : #WAError,
	#instVars : [
		'notification'
	],
	#category : 'Seaside-Core-Exceptions'
}

{ #category : #signaling }
WAUnhandledNotificationError class >> signalWithNotification: aNotification [
	^ self new
		notification: aNotification;
		signal
]

{ #category : #accessing }
WAUnhandledNotificationError >> notification [
	^ notification
]

{ #category : #accessing }
WAUnhandledNotificationError >> notification: aNotification [
	notification := aNotification
]
