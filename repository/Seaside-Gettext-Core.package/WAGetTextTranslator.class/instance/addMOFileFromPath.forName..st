private
addMOFileFromPath: pathString forName: anApplicationName
	"This method is currently only used for instantiation with a web application."
	| locale fileName |
	locale := WALocale fromString: (GRPlatform current localNameOf: pathString).
	fileName := String streamContents:[ :str |
			str 
				nextPutAll: pathString;
				nextPutAll: GRPlatform current pathSeparator;
				nextPutAll: 'LC_MESSAGES';
				nextPutAll: GRPlatform current pathSeparator;
				nextPutAll: anApplicationName;
				nextPutAll: '.mo' ].
	^ moFiles 
		at: locale greaseString
		put: (WAMOFile new load: fileName localeString: locale greaseString)