updating
updateUrl: aUrl
	super updateUrl: aUrl.
	aUrl addToPath: (self pathFor: contents title)