class initialization
register
	| application |
	application := WAAdmin 
		register: self
		asApplicationAt: 'examples/gettext'.
	application configuration addParent: WAGetTextConfiguration instance.
	application preferenceAt: #sessionClass put: WAGettextExampleSession.
	application preferenceAt: #gettextDomain put: 'seaside-gettext-example'.

	TextDomainManager registerCategoryPrefix: 'Seaside-Gettext-Examples' domain: 'seaside-gettext-example'