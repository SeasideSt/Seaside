private
expectChar: aChar
	"Expects aChar and consume input, throw an error otherwise."

	^ (self matchChar: aChar) ifFalse: [ self error: aChar greaseString, ' expected' ]