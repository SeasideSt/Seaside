delegation
onAnswer: aBlock
	"Adds an answer handler aBlock to the receiver."

	^ self addDecoration: (WAAnswerHandler new block: aBlock)