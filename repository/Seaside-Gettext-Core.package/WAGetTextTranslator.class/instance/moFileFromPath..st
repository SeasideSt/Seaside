private
moFileFromPath: path
	"Note: inspiration is moFileForDomain and loadMOFileForDomain"
	"Returns the cached MOFile for the given file path (or nil).
	If none is cached, it will try to load one (every time) and cache it on demand."
	| moFile |

	^moFiles 
		at: path 
		ifAbsent: [
			moFile := MOFile new load: path localeID: self localeID.
			moFile notNil ifTrue:[
				moFiles at: path put: moFile].
			moFile].