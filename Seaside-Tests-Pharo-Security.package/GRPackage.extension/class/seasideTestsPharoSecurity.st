*seaside-tests-pharo-security
seasideTestsPharoSecurity
	^ self new
		name: 'Seaside-Tests-Pharo-Security';
		addDependency: 'Seaside-Pharo-Security';
		addDependency: 'Seaside-Tests-Security';
		url: #seasideUrl;
		yourself