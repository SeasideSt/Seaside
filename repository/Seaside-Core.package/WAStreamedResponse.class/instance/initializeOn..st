initialization
initializeOn: aStream 
	super initializeOn: aStream.
	committed := false.
	externalStream := aStream