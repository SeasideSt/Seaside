private
nonFileSelectors
	"Answers all the unary selectors with an upper clase latter that are not file selector.s
	This method is intended to be overriden by superclasses that add functionality. Don't forget to add the result of the super send."
	^ #(cacheDuration fileSelectors deployFiles configurationComponent selectorsToInclude nonFileSelectors)