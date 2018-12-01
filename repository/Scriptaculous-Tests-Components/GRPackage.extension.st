Extension { #name : #GRPackage }

{ #category : #'*scriptaculous-tests-components' }
GRPackage classSide >> scriptaculousTestsComponents [
	^ self new
		name: 'Scriptaculous-Tests-Components';
		description: 'Functional and unit tests for the Scriptaculous-Components package.';
		addDependency: 'Scriptaculous-Components';
		addDependency: 'Scriptaculous-Tests-Core';
		url: #seasideUrl;
		yourself
]
