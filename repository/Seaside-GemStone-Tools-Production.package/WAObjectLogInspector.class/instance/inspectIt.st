actions
inspectIt
	"Evaluate the code in the textarea and then inspect the result."
	| result |
	result := self evaluate.
	self 
		chooseObject: result
		named: result greaseString