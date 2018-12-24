*Seaside-Tests-Pharo-Core
seasideTestsPharoCore
	^ self new
		name: 'Seaside-Tests-Pharo-Core';
		addDependency: 'Seaside-Pharo-Core';
		addDependency: 'Seaside-Tests-Core';
		url: #seasideUrl;
		yourself