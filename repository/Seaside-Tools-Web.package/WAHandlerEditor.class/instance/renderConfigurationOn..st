rendering
renderConfigurationOn: html
	self handler configuration isNil
		ifFalse: [ html render: configurationEditor ]