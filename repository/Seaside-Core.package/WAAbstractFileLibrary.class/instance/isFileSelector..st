private
isFileSelector: aSymbol
	"added condition to prevent overrides of methods defined in this class being picked up"
	^ aSymbol isUnary
		and: [ (self lastUpperCaseIndexIn: aSymbol) > 1
		and: [ (self nonFileSelectors includes: aSymbol) not ] ]