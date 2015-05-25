*seaside-pharo-canvas
seasidePharoCanvas
	^ self new
		name: 'Seaside-Pharo-Canvas';
		addDependency: 'Seaside-Canvas';
		addDependency: 'Seaside-Pharo-Core';
		url: #seasideUrl;
		yourself