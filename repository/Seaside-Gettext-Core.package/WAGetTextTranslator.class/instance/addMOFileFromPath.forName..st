private
addMOFileFromPath: path forName: anApplicationName
	"Note: inspiration is moFileForDomain and loadMOFileForDomain"
	"Returns the cached MOFile for the given file path (or nil).
	If none is cached, it will try to load one (every time) and cache it on demand."
	| locale |
	locale := WALocale fromString: path basename.
	^ moFiles 
		at: locale greaseString
		put: (WAMOFile new load: path / 'LC_MESSAGES' / anApplicationName,'mo' localeString: locale greaseString)