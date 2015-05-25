actions
deprecated: aNotification
	"Adds a deprecated warning aNotification to the receiver. Remove old deprecation warnings that have the same message and detail text."

	notifications := notifications reject: [ :each | 
		(each messageText = aNotification messageText)
			and: [ each details = aNotification details ] ].
	notifications add: aNotification.
	aNotification resume