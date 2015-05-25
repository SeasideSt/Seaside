user interface
inform: aString
	self lightbox: (WAFormDialog new addMessage: aString; yourself).
	self lightbox: (WAFormDialog new addMessage: 'Back for more'; yourself)