attributes
characterOffset: anInteger
	"When present, this attribute specifies the offset to the first occurrence of the alignment character on each line. If a line doesn't include the alignment character, it should be horizontally shifted to end at the alignment position."

	self attributes at: 'charoff' put: anInteger