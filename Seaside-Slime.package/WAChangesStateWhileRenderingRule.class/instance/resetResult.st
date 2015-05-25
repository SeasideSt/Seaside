running
resetResult
	super resetResult.
	resultMatcher := RBParseTreeSearcher new.
	self result matcher: resultMatcher