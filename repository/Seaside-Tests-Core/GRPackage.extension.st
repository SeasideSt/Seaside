Extension { #name : #GRPackage }

{ #category : #'*seaside-tests-core' }
GRPackage class >> seasideTestsCore [
	^ self new
		name: 'Seaside-Tests-Core';
		description: 'Unit tests for the package Seaside-Core.';
		addDependency: 'Seaside-Core';
		addDependency: 'Grease-Tests-Core';
		url: #seasideUrl;
		yourself
]
