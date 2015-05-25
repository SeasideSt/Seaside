enumerating
select: aString 
	"Takes a CSS selector and returns an enumerable of extended descendants of element that match aString."
	
	^ self call: 'select' with: aString; enumerator