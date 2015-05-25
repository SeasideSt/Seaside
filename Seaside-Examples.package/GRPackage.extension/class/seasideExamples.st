*seaside-examples
seasideExamples
	^ self new
		name: 'Seaside-Examples';
		description: 'Simple example applications and components.';
		addDependency: 'Seaside-Component';
		addDependency: 'Seaside-Canvas';
		addDependency: 'Seaside-Tools-Core'; "for WAAdmin"
		url: #seasideUrl;
		yourself