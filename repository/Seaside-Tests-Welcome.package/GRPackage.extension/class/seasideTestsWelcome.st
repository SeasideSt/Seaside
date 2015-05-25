*seaside-tests-welcome
seasideTestsWelcome
	^ self new
		name: 'Seaside-Tests-Welcome';
		description: 'Unit tests for the welcome screen.';
		addDependency: 'Seaside-Welcome';
		url: #seasideUrl;
		yourself