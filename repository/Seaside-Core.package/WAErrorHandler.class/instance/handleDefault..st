actions
handleDefault: anException
	"This method provides the default behaviour if subclasses do
	not implement one of the specific handler methods."
	^ self internalError: anException