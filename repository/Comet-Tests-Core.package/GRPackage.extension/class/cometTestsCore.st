*comet-tests-core
cometTestsCore
	^ self new
		name: 'Comet-Tests-Core';
		description: 'Unit tests for the Comet-Core package.';
		addDependency: 'Javascript-Tests-Core';
		addDependency: 'Comet-Core';
		url: #seasideUrl;
		yourself