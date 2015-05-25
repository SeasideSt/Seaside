tasks
checkAuthorInitials
	GRPlatform current seasideIsAuthorNameSet ifFalse: [ self call: WAWelcomeAuthorNamePrompter new ] 
	
