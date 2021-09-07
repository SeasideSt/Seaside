*Seaside-Pharo-Core
seasidePharoCore
	^ self new
		name: 'Seaside-Pharo-Core';
		addDependency: 'Seaside-Core';
		addDependency: 'Grease-Pharo-Core';
		url: #seasideUrl;
		yourself