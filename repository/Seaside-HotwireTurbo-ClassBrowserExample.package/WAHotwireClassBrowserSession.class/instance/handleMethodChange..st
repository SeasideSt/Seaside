event handling
handleMethodChange: aMethodAnnounce
	
	(aMethodAnnounce affectsMethod: self presenter selectedMethod) 
		ifTrue:[ self presenter pushMethodChange: aMethodAnnounce to: pusher ]