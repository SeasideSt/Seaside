attributes
writeAttribute: aString value: anObject 
	"Add or replace attribute aString with anObject."
	
	self call: 'writeAttribute' with: aString with: anObject