*comet-pharo-core
cometPharoCore
	^ self new
		name: 'Comet-Pharo-Core';
		addDependency: 'Comet-Core';
		url: #seasideUrl;
		yourself