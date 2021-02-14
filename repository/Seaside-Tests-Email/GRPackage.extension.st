Extension { #name : #GRPackage }

{ #category : #'*seaside-tests-email' }
GRPackage class >> seasideTestsEmail [
	^ self new
		name: 'Seaside-Tests-Email';
		description: 'Unit tests for the package Seaside-Email.';
		addDependency: 'Seaside-Email';
		addDependency: 'Seaside-Tests-Core';
		url: #seasideUrl;
		yourself
]
