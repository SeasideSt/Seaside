callbacks
on: aSymbol of: anObject 
	self callback: (GRDelayedSend 
			receiver: anObject
			selector: aSymbol).
	self with: (self 
			labelForSelector: aSymbol
			of: anObject)