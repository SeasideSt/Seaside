actions
option: aString put: anObject
	"Set an option aString to anObject."
	
	self action: 'option' arguments: (Array with: aString with: anObject)