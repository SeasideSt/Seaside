*seaside-tests-functional
seasideTestsFunctional
	^ self new
		name: 'Seaside-Tests-Functional';
		description: 'Functional Seaside test suite.';
		addDependency: 'Seaside-Environment';
		addDependency: 'Seaside-Widgets';
		addDependency: 'Seaside-Tests-Core';
		url: #seasideUrl;
		yourself