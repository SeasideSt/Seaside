attributes
optimum: anInteger
	"The optimum attribute gives the position that is 'optimum'; if that is higher than the 'high' value then this indicates that the higher the value, the better; if it's lower than the 'low' mark then it indicates that lower values are better, and naturally if it is in between then it indicates that neither high nor low values are good."
	self attributeAt: 'optimum' put: anInteger