*seaside-gemstone-environment
seasideGemStoneEnvironment
	^ self new
		name: 'Seaside-GemStone-Environment';
		addDependency: 'Seaside-Environment';
		url: #gemstoneUrl;
		yourself