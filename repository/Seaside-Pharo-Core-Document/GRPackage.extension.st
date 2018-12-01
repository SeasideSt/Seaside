Extension { #name : #GRPackage }

{ #category : #'*seaside-pharo-core' }
GRPackage classSide >> seasidePharoCore [
	^ self new
		name: 'Seaside-Pharo-Core';
		addDependency: 'Seaside-Core';
		addDependency: 'Grease-Pharo-Core';
		url: #seasideUrl;
		yourself
]
