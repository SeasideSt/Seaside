effects
toggle: aDuration callback: anObject
	"Bind two or more handlers to the matched elements, to be executed on alternate clicks."
	
	self call: 'toggle' with: aDuration with: anObject asFunction