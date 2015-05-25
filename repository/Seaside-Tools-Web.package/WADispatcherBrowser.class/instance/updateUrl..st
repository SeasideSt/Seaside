updating
updateUrl: aUrl
	super updateUrl: aUrl.
	self updateUrlHandler hierarchyNames do: [ :each | aUrl addToPath: each ]