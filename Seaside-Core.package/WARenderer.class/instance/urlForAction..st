public
urlForAction: aBlock
	"Answer an action URL that will evaluate aBlock when it is requested."

	^ self actionUrl withField: (self callbacks store: (WAActionCallback on: aBlock))