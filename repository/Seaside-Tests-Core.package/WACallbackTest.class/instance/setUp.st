running
setUp
	super setUp.
	registry := WACallbackRegistry new.
	log := OrderedCollection new