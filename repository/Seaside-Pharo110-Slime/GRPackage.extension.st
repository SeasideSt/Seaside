Extension { #name : 'GRPackage' }

{ #category : '*Seaside-Pharo110-Slime' }
GRPackage class >> seasideSlime [
	^ self new
		name: 'Seaside-Pharo110-Slime';
		description: 'Code critis for Seaside. Detects common types of Seaside-specific bugs.';
		addDependency: 'Grease-Pharo110-Slime';
		url: #seasideUrl;
		yourself
]
