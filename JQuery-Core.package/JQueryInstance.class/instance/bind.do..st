events
bind: aString do: anObject 
	"Handle click and double-click for the paragraph. Note: the coordinates are window relative, so in this case relative to the demo iframe."
	
	self call: 'bind' with: aString with: anObject asFunction