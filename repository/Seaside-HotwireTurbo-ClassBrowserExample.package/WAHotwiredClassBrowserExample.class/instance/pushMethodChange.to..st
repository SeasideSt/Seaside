event handling
pushMethodChange: aMethodAnnounce to: pusher

	pusher turboStream: [ :ts | 
		ts replaceComponent: methodEditor with: methodEditor ] 