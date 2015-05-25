accessing
functionName: aString
	"Changes the function name that Seaside generates to access the jQuery namespace. By default Seaside uses '$'. If another Javascript library (like Prototype, MooTools, or YUI) should be used simultaniously this name might be overridden. In this case use 'jQuery' as the function name, as this is an alias that normally does not conflict. In any case consult <http://docs.jquery.com/Using_jQuery_with_Other_Libraries>."

	FunctionName := aString