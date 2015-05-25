*seaside-tests-security
seasideTestsSecurity
	^ self new
		name: 'Seaside-Tests-Security';
		addDependency: 'Seaside-Security';
		addDependency: 'Seaside-Tests-Core';
		url: #seasideUrl;
		yourself