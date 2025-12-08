Class {
	#name : 'WAHotwireClassBrowserSession',
	#superclass : 'WASession',
	#instVars : [
		'pusher'
	],
	#category : 'Seaside-HotwireTurbo-ClassBrowserExample',
	#package : 'Seaside-HotwireTurbo-ClassBrowserExample'
}

{ #category : 'event handling' }
WAHotwireClassBrowserSession >> handleClassChange: aClassAnnounce [
  "test"
	self presenter pushClassChange: aClassAnnounce to: pusher
]

{ #category : 'event handling' }
WAHotwireClassBrowserSession >> handleMethodChange: aMethodAnnounce [
	
	(aMethodAnnounce affectsMethod: self presenter selectedMethod) 
		ifTrue:[ self presenter pushMethodChange: aMethodAnnounce to: pusher ]
]

{ #category : 'initialization' }
WAHotwireClassBrowserSession >> initialize [

	super initialize.
	self subscribeToSystemAnnouncements.
	pusher := WAWebSocketTurboStreamPusherOutsideOfRequest new
]

{ #category : 'accessing' }
WAHotwireClassBrowserSession >> pusher [

	^ pusher
]

{ #category : 'private' }
WAHotwireClassBrowserSession >> subscribeToSystemAnnouncements [

	SystemAnnouncer uniqueInstance weak
		when: ClassAnnouncement send: #handleClassChange: to: self;
		when: MethodAnnouncement send: #handleMethodChange: to: self
]

{ #category : 'initialization' }
WAHotwireClassBrowserSession >> unregistered [

	super unregistered.
	self unsubscribeToSystemAnnouncements
]

{ #category : 'private' }
WAHotwireClassBrowserSession >> unsubscribeToSystemAnnouncements [

	SystemAnnouncer uniqueInstance unsubscribe: self
]
