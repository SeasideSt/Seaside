options-generated
refreshPositions: aBoolean
	"If set to true, all droppable positions are calculated on every mousemove. Caution: This solves issues on highly dynamic pages, but dramatically decreases performance."

	self optionAt: 'refreshPositions' put: aBoolean