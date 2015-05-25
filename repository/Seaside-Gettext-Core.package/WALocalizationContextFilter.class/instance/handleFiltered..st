processing
handleFiltered: aRequestContext 
	WACurrentLocalizationContext
		use: WALocalizationContext new
		during: [ super handleFiltered: aRequestContext ]