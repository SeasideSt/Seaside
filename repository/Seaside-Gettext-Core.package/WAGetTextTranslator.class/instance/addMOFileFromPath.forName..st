private
addMOFileFromPath: pathString forName: anApplicationName

	| locale fileName |
	locale := WALocale fromString: (GRPlatform current localNameOf: pathString).
	fileName := String streamContents: [ :str | 
		            str
			            nextPutAll: pathString;
			            nextPutAll: GRPlatform current pathSeparator;
			            nextPutAll: 'LC_MESSAGES';
			            nextPutAll: GRPlatform current pathSeparator;
			            nextPutAll: anApplicationName;
			            nextPutAll: '.mo' ].
	^ self
		  addMOFile: (WAMOFile new initializeFromFile: fileName localeId: locale localeId)
		  forLocaleID: locale localeId