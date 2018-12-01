Extension { #name : #GRPackage }

{ #category : #'*seaside-pharo-json-core' }
GRPackage classSide >> seasidePharoJsonCore [
	^ self new
		name: 'Seaside-Pharo-JSON-Core';
		addDependency: 'Seaside-JSON-Core';
		url: #seasideUrl;
		yourself
]
