Extension { #name : #GRPackage }

{ #category : #'*seaside-tests-json' }
GRPackage class >> seasideTestsJson [
	^ self new
		name: 'Seaside-Tests-JSON';
		description: 'Unit tests for the Seaside-JSON-Core package.';
		addDependency: 'Seaside-JSON-Core';
		url: #seasideUrl;
		yourself
]
