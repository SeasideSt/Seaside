class initialization
register
	| application |
	application := WAAdmin 
		register: self
		asApplicationAt: 'examples/gettext'.
	application configuration addParent: WAGetTextConfiguration instance.
	application preferenceAt: #sessionClass put: WAGettextExampleSession.
	application preferenceAt: #gettextApplicationName put: 'seaside-gettext-example'.