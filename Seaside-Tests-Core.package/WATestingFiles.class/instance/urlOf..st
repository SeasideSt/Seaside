accessing
urlOf: aSymbol
	"Could this be moved to the superclass? --JGF"

	^ self urlOf: aSymbol using: self defaultFileHandler