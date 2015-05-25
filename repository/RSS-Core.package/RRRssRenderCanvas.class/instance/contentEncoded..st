content
contentEncoded: aString
	"A module for the actual content of websites.
	
	aString must not include ']]>'"
	self contentEncoded
		with: [ self cdata: aString ]