updating
updateUrl: aUrl
	super updateUrl: aUrl.
	updateUrlBlock isNil
		ifFalse: [ updateUrlBlock value: aUrl ]