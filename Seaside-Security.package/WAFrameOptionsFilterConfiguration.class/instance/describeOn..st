description
describeOn: config
	(config list: #frameOptions)
		comment: 'The places where framing should be allowed.';
		options: [ #('DENY' 'SAMEORIGIN') ];
		default: 'DENY'