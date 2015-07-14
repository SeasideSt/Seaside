registration
register: aComponentClass asApplicationAt: aString in: aDispatcher
	"Use this to programatically register a component as an application."
	| application |
	application := self register: WAApplication at: aString in: aDispatcher.
	self configureNewApplication: application.
	application preferenceAt: #rootClass put: aComponentClass.
	^ application