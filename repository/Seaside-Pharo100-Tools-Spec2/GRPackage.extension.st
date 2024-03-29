Extension { #name : 'GRPackage' }

{ #category : '*Seaside-Pharo100-Tools-Spec2' }
GRPackage class >> seasidePharoToolsSpec2 [
	^ self new
		name: 'Seaside-Pharo100-Tools-Spec2';
		description: 'Spec based server adapter browser for Pharo';
		addDependency: 'Seaside-Tools-Core';
		url: #seasideUrl;
		yourself
]
