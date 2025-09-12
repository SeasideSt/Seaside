*seaside-tests-canvas
seasideTestsCanvas
	^ self new
		name: 'Seaside-Tests-Canvas';
		description: 'Unit tests for Seaside'' Canvas integration with Magritte metamodel.';
		addDependency: 'Magritte-Tests-Seaside';
		url: #seasideUrl;
		yourself
