description
describeOn: config
	(config classBinding: #rootComponentClass)
		label: 'Root Component';
		options: [ self rootComponents ].
	config at: #documentClass putClass: WAXmlDocument