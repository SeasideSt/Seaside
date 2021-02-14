Extension { #name : #GRPackage }

{ #category : #'*seaside-tests-component' }
GRPackage class >> seasideTestsComponent [
	^ self new
		name: 'Seaside-Tests-Component';
		description: 'Unit tests for the package Seaside-Component.';
		addDependency: 'Seaside-Component';
		addDependency: 'Seaside-Tests-Core';
		url: #seasideUrl;
		yourself
]
