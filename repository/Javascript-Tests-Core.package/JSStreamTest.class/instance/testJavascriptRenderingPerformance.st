tests
testJavascriptRenderingPerformance
	 
	| iterations size worstcasestring bestcasestring stringToStream |
	iterations := 1000.
	size := 5000.

	bestcasestring := self generateBestCaseString: size.
	worstcasestring := self generateWorstCaseString: size.
	
	Transcript show: 'Best case:';cr.
	stringToStream := self timeJavascriptRenderingOf: bestcasestring times: iterations.
	Transcript show: ('- Rendering {1} Strings with {2} chars in response: {3} ms' format: { iterations asString . size asString . stringToStream asString}); cr.
	
	Transcript show: 'Worst case:';cr.
	stringToStream := self timeJavascriptRenderingOf: worstcasestring times: iterations.
	Transcript show: ('- Rendering {1} Strings with {2} chars in response: {3} ms' format: { iterations asString . size asString . stringToStream asString}); cr.