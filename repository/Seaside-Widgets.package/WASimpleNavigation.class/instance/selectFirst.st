behavior
selectFirst
	"Selects the first added component as active."
	
	components notEmpty
		ifTrue: [ self select: components first key ]