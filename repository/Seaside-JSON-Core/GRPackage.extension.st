Extension { #name : #GRPackage }

{ #category : #'*seaside-json-core' }
GRPackage classSide >> seasideJsonCore [
	^ self new
		name: 'Seaside-JSON-Core';
		description: 'JSON integration in Seaside. Provides a basic functionality to generate JSON from Smalltalk.';
		addDependency: 'Seaside-Core';
		addDependency: 'Seaside-Canvas';
		url: #seasideUrl;
		yourself
]
