initialization
initializeFromFile: aFileName localeString: aLocaleString
	"Entry point for loading translations. All of strings are loaded. Translation strings are converted to internal string format on load time.
	Original string/index pairs are registerd to Dictionary on load time."
	self initialize.
	localeString := aLocaleString.
	fileName := aFileName.
	GRPlatform current 
		readFileStreamOn: aFileName 
		do: [ :strm | self privateLoadStream: strm ] 
		binary: true