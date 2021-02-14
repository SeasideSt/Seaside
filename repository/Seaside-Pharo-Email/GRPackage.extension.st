Extension { #name : #GRPackage }

{ #category : #'*seaside-pharo-email' }
GRPackage class >> seasidePharoEmail [
	^ self new
		name: 'Seaside-Pharo-Email';
		description: 'Pharo implementation classes for the package "Seaside-Email".';
		addDependency: 'Seaside-Email';
		addDependency: 'Seaside-Pharo-Core';
		url: #seasideUrl;
		yourself
]
