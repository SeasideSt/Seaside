Extension { #name : #GRPackage }

{ #category : #'*seaside-pharo20-core' }
GRPackage classSide >> seasidePharo20Core [
	^ self new
		name: 'Seaside-Pharo20-Core';
		addDependency: 'Seaside-Core';
		addDependency: 'Grease-Pharo20-Core';
		url: #seasideUrl;
		yourself
]
