initialization
initialize
	| application |
	application := WAAdmin register: self asApplicationAt: 'comet/chat'.
	application preferenceAt: #sessionClass put: CTChatSession.
	application
		addLibrary: JQDeploymentLibrary;
		addLibrary: CTLibrary