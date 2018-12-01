Extension { #name : #GRPackage }

{ #category : #'*seaside-pharo40-slime' }
GRPackage classSide >> seasideSlime [
	^ self new
		name: 'Seaside-Pharo40-Slime';
		description: 'Code critis for Seaside. Detects common types of Seaside-specific bugs.';
		addDependency: 'Grease-Slime';
		url: #seasideUrl;
		yourself
]
