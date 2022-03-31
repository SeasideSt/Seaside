private
addMOFileFromPath: path forName: anApplicationName
	"This method is currently only used for instantiation with a web application."
	| locale |
	locale := WALocale fromString: path basename.
	^ moFiles 
		at: locale greaseString
		put: (WAMOFile new load: path / 'LC_MESSAGES' / anApplicationName,'mo' localeString: locale greaseString)