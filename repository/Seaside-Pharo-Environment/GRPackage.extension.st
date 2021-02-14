Extension { #name : #GRPackage }

{ #category : #'*seaside-pharo-environment' }
GRPackage class >> seasidePharoEnvironment [
	^ self new
		name: 'Seaside-Pharo-Environment';
		addDependency: 'Seaside-Environment';
		addDependency: 'Seaside-Pharo-Core';
		addDependency: 'Seaside-Pharo-Canvas';
		url: #seasideUrl;
		yourself
]
