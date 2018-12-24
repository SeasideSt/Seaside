testing
class: aClass includesBehaviorNamed: aSymbol
	"In order to avoid static dependencies to classes, we do this check by name."

	^ (Smalltalk includesKey: aSymbol) and: [ aClass includesBehavior: (Smalltalk at: aSymbol) ]