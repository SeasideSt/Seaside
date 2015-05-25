convenience
class: aString if: aBoolean
	"Adds the class aString to the receiving element if aBoolean is true. 
	
	Example:
	
	html div
		class: 'error' if: self hasError;
		with: self errorMessage"

	aBoolean
		ifTrue: [ self class: aString ]