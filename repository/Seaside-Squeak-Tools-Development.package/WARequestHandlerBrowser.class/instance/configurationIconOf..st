configuration - attributes
configurationIconOf: aConfiguration

	(self configurationIsGroup: aConfiguration) ifTrue: [^ nil].
	
	^ ToolIcons iconNamed: (self configurationIconNameFor: aConfiguration)
