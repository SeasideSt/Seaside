convenience
addButton: aString do: anObject 
	"Adds a new button with the label aString and the action anObject."
	(self options 
		at: 'buttons'
		ifAbsentPut: [ GRSmallDictionary new ]) 
		at: aString
		put: anObject asFunction