*Seaside-Pharo11-Slime
seasideSlime
	^ self new
		name: 'Seaside-Pharo-Slime';
		description: 'Code critis for Seaside. Detects common types of Seaside-specific bugs.';
		addDependency: 'Grease-Pharo-Slime';
		url: #seasideUrl;
		yourself