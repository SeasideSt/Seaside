*seaside-tests-component
seasideTestsComponent
	^ self new
		name: 'Seaside-Tests-Component';
		description: 'Unit tests for Seaside''s Component integration with Magritte metamodel.';
		addDependency: 'Magritte-Tests-Seaside';
		url: #seasideUrl;
		yourself