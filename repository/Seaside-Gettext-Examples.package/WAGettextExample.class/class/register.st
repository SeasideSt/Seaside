class initialization
register
	| application |
	application := WAAdmin 
		register: self
		asApplicationAt: 'gettext'.
	application preferenceAt: #sessionClass put: WAGettextExampleSession.
	application configuration addParent: WAGetTextConfiguration instance.
	TextDomainManager registerCategoryPrefix: 'Seaside-Gettext-Examples' domain: 'gettext'.