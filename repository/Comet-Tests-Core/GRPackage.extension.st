Extension { #name : #GRPackage }

{ #category : #'*comet-tests-core' }
GRPackage class >> cometTestsCore [
	^ self new
		name: 'Comet-Tests-Core';
		description: 'Unit tests for the Comet-Core package.';
		addDependency: 'Javascript-Tests-Core';
		addDependency: 'Comet-Core';
		url: #seasideUrl;
		yourself
]
