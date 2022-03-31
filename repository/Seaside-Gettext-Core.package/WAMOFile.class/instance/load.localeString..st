public
load: aFileName localeString: aLocaleString
	"Entry point for loading translations. All of strings are loaded. 
	translation strings are converted to internal string format on load time.
	original-string/index pairs are registerd to Dictionary on load time."
	localeString := aLocaleString.
	aFileName asFileReference binaryReadStreamDo: [:strm | |originalTable translatedTable originalStrings|
	fileName := aFileName.
	self loadHeader: strm.
	
	originalTable := self loadStringPointers: strm 
									offset: originalTableOffset.
									
	translatedTable := self loadStringPointers: strm 
										offset: translatedTableOffset.

	originalStrings := self loadStrings: strm 
							pointers: originalTable.

	translatedStrings := self loadStrings: strm 
								pointers: translatedTable.

	translations := Dictionary new: nStrings.  
	1 to: nStrings do: [:index |
		| key |
		key := originalStrings at: index.
		translations at: key put: index.].
	]