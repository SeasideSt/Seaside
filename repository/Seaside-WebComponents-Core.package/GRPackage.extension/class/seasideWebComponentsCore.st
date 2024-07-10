*Seaside-WebComponents-Core
seasideWebComponentsCore
	^ self new
		name: 'Seaside-WebComponents-Core';
		description: 'Allows embedding Seaside components as Web Components';
		addDependency: 'Seaside-Core';
		addDependency: 'Seaside-Canvas';
		addDependency: 'Seaside-Component';
		addDependency: 'Seaside-RenderLoop';
		url: #seasideUrl;
		yourself