*seaside-tests-pharo-development
seasideTestsPharoDevelopment
	^ self new
		name: 'Seaside-Tests-Pharo-Development';
		addDependency: 'Seaside-Pharo-Development';
		addDependency: 'Seaside-Tests-Development';
		url: #seasideUrl;
		yourself