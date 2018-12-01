Extension { #name : #GRPackage }

{ #category : #'*seaside-slime' }
GRPackage classSide >> seasideSlime [
	^ self new
		name: 'Seaside-Slime';
		description: 'Code critis for Seaside. Detects common types of Seaside-specific bugs.';
		addDependency: 'Grease-Slime';
		url: #seasideUrl;
		yourself
]
