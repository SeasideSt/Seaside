description
describeOn: config
	(config string: #login)
		group: #authentication;
		comment: 'The username for this application.'.
	(config password: #passwordHash)
		group: #authentication;
		comment: 'The password for this application.';
		label: 'Password'