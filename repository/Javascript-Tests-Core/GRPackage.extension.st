Extension { #name : #GRPackage }

{ #category : #'*javascript-tests-core' }
GRPackage class >> javascriptTestsCore [
	^ self new
		name: 'Javascript-Tests-Core';
		description: 'Unit tests for the Javascript-Core package.';
		addDependency: 'Javascript-Core';
		addDependency: 'Seaside-Tests-Core';
		url: #seasideUrl;
		yourself
]
