Extension { #name : #GRPackage }

{ #category : #'*seaside-tests-examples' }
GRPackage class >> seasideTestsExamples [
	^ self new
		name: 'Seaside-Tests-Examples';
		description: 'Unit tests for Seaside-Examples.';
		addDependency: 'Seaside-Examples';
		addDependency: 'Seaside-Tests-Environment';
		url: #seasideUrl;
		yourself
]
