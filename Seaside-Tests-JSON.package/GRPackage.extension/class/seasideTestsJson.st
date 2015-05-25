*seaside-tests-json
seasideTestsJson
	^ self new
		name: 'Seaside-Tests-JSON';
		description: 'Unit tests for the Seaside-JSON-Core package.';
		addDependency: 'Seaside-JSON-Core';
		url: #seasideUrl;
		yourself