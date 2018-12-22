*seaside-tests-pharo-functional
seasideTestsPharoFunctional
	^ self new
		name: 'Seaside-Tests-Pharo-Functional';
		description: 'Pharo specific functional Seaside test suite.';
		addDependency: 'Seaside-Tests-Functional';
		addDependency: 'Seaside-Tests-Environment';
		addDependency: 'Seaside-Pharo-Environment';
		addDependency: 'Seaside-Tests-Squeak-Core';
		url: #seasideUrl;
		yourself