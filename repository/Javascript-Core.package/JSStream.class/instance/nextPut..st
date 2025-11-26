streaming
nextPut: aCharacter
	"quite inefficient, ideally rare"
	self add: (JSCode on: aCharacter greaseString)