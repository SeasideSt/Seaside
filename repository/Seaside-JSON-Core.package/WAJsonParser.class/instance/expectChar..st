private
expectChar: aChar
	"Expects aString and consume input, throw an error otherwise."

	^ (self matchChar: aChar) ifFalse: [ self error: aChar greaseString, ' expected' ]