accessing
basicSystemConfiguration
	^ WAConfigurationMock new
		description: [ :config | (config string: #a) default: #default ];
		yourself