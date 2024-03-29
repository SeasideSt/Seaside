Extension { #name : 'GRPackage' }

{ #category : '*Seaside-Pharo-Core' }
GRPackage class >> seasidePharoCore [
	^ self new
		name: 'Seaside-Pharo-Core';
		addDependency: 'Seaside-Core';
		addDependency: 'Grease-Pharo-Core';
		url: #seasideUrl;
		yourself
]
