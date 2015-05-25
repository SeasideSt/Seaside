documents
document: anObject mimeType: aMimeType
	self document: (anObject seasideMimeDocument 
		mimeType: aMimeType;
		yourself)