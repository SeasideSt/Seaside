*seaside-development
enableDevelopmentTools
	self applicationDefaults addParent: WADevelopmentConfiguration instance.
	self clearConfigurationCaches