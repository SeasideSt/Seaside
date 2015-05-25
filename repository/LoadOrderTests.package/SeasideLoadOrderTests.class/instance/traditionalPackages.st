packages-traditional
traditionalPackages

	^OrderedCollection new
		add: self functionalTestPackages ;		"Functional Tests"	
		add: self continuationPackages;			"Continuations"
		add: self flowPackages;					"Flow"
		add: self webToolsPackages;			"WebTools"
		add: self developmentPackages;		"Development"
		add: self examplePackages;			"Examples"
		yourself.