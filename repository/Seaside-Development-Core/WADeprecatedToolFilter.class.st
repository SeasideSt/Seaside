Class {
	#name : #WADeprecatedToolFilter,
	#superclass : #WARequestFilter,
	#instVars : [
		'notifications'
	],
	#category : 'Seaside-Development-Filter'
}

{ #category : #actions }
WADeprecatedToolFilter >> deprecated: aNotification [
	"Adds a deprecated warning aNotification to the receiver. Remove old deprecation warnings that have the same message and detail text."

	notifications := notifications reject: [ :each | 
		(each messageText = aNotification messageText)
			and: [ each details = aNotification details ] ].
	notifications add: aNotification.
	aNotification resume
]

{ #category : #processing }
WADeprecatedToolFilter >> handleFiltered: aRequestContext [ 
	[ super handleFiltered: aRequestContext ] 
		on: GRDeprecatedApiNotification, GRPlatform current deprecationExceptionSet
		do: [ :notification | self deprecated: notification ]
]

{ #category : #initialization }
WADeprecatedToolFilter >> initialize [
	super initialize.
	self reset
]

{ #category : #accessing }
WADeprecatedToolFilter >> notifications [
	^ notifications
]

{ #category : #actions }
WADeprecatedToolFilter >> reset [
	notifications := OrderedCollection new
]
