Extension { #name : #GRPackage }

{ #category : #'*seaside-pharo-json-core' }
GRPackage class >> seasidePharoJsonCore [
	^ self new
		name: 'Seaside-Pharo-JSON-Core';
		addDependency: 'Seaside-JSON-Core';
		url: #seasideUrl;
		yourself
]
