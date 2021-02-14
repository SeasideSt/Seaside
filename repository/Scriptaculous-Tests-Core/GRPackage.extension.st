Extension { #name : #GRPackage }

{ #category : #'*scriptaculous-tests-core' }
GRPackage class >> scriptaculousTestsCore [
	^ self new
		name: 'Scriptaculous-Tests-Core';
		description: 'Functional and unit tests for the Scriptaculous-Core package.';
		addDependency: 'Scriptaculous-Core';
		addDependency: 'Prototype-Tests-Core';
		url: #seasideUrl;
		yourself
]
