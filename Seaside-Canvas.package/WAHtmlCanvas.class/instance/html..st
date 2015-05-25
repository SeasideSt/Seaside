public
html: aString 
	"Emit aString unescaped onto the target document."
	self flush.
	self document nextPutAll: aString greaseString