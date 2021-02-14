Extension { #name : #GRPackage }

{ #category : #'*seaside-tests-rest-core' }
GRPackage class >> seasideTestsRestCore [
	^ self new
		name: 'Seaside-Tests-REST-Core';
		description: 'Unit tests for the package Seaside-REST-Core.';
		addDependency: 'Seaside-REST-Core';
		url: #seasideUrl;
		yourself
]
