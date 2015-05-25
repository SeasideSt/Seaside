*seaside-pharo-flow
seasidePharoFlow
	^ self new
		name: 'Seaside-Pharo-Flow';
		addDependency: 'Seaside-Flow';
		addDependency: 'Grease-Pharo-Core';
		addDependency: 'Seaside-Pharo-Continuation';
		url: #seasideUrl;
		yourself