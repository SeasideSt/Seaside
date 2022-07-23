initialization
load: aFileName localeString: aLocaleString
	"Entry point for loading translations. All of strings are loaded. Translation strings are converted to internal string format on load time.
	Original string/index pairs are registerd to Dictionary on load time."
	localeString := aLocaleString.
	fileName := aFileName.
	
	GRPlatform current 
		readFileStreamOn: aFileName 
		do: [ :strm | | originalTable translatedTable originalStrings |
			self loadHeader: strm.
			originalTable := self loadStringPointers: strm offset: originalTableOffset.
			translatedTable := self loadStringPointers: strm offset: translatedTableOffset.
			originalStrings := self loadStrings: strm pointers: originalTable.
			translatedStrings := self loadStrings: strm pointers: translatedTable.
			translations := Dictionary new: nStrings.  
			1 to: nStrings do: [ :index |
				translations at: (originalStrings at: index) put: index ] ] 
		binary: true